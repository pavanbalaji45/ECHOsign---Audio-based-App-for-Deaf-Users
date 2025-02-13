// Record controller
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingController extends GetxController {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  var isRecording = false.obs;
  var isPlaying = false.obs;
  var duration = 0.obs;
  Timer? _timer;
  File? audioFile;
  var recordings = <Map<String, dynamic>>[].obs;
  var predictedSound = 'Unknown'.obs;
  var gifPath = ''.obs;
  var status = 'Press Mic to Start'.obs;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initRecorder();
    loadRecordings();
    initializeNotifications();
    ever(status, (newStatus) {
      // Trigger a notification whenever `status` changes
      showNotification('EchoSign', 'Status: $newStatus');
    });
  }

  /// Initialize the local notifications
  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Show a notification
  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'player_status_channel', // Channel ID
      'Player Status Notifications', // Channel name
      channelDescription: 'Displays the status of the player/recorder',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // Notification ID
      title,
      body,
      platformChannelSpecifics,
    );
  }

  Future<void> initRecorder() async {
    await Permission.microphone.request();
    await _recorder.openRecorder();
    await _player.openPlayer();
  }

  /// Generates a unique file name using current date and time
  Future<String> generateFileName() async {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${now.month}-${now.day}_${now.hour}-${now.minute}-${now.second}";
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$formattedDate.wav';
  }

  /// Start recording with a unique filename
  void startRecording() async {
    final filePath = await generateFileName();
    await _recorder.startRecorder(toFile: filePath);
    isRecording.value = true;
    if (isRecording.value) {
      status.value = 'Recording...';
    }
    duration.value = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration.value++;
    });
  }

  /// Stop recording and save data securely in Hive
  void stopRecording() async {
    final path = await _recorder.stopRecorder();
    audioFile = File(path!);
    isRecording.value = false;
    _timer?.cancel();
    status.value = 'Recording Stopped';

    try {
      // ✅ Upload to Bunny.net
      await uploadToBunnyNet(audioFile!);
    } catch (e) {
      Get.snackbar('Error', 'Failed to save audio');
    }
  }

  void startPlayback() async {
    if (audioFile == null) return;
    await _player.startPlayer(
      fromURI: audioFile!.path,
      whenFinished: () => isPlaying.value = false,
    );
    isPlaying.value = true;
  }

  void stopPlayback() async {
    await _player.stopPlayer();
    isPlaying.value = false;
  }

  void playFile(String filePath) async {
    await _player.startPlayer(
      fromURI: filePath,
      whenFinished: () => isPlaying.value = false,
    );
    isPlaying.value = true;
  }

  /// Load all recordings from Hive into the reactive list
  Future<void> loadRecordings() async {
    var box = Hive.box('audio_data');
    recordings.value =
        box.values.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  /// Add a new recording to the list and Hive
  void addRecording(Map<String, dynamic> recording) {
    var box = Hive.box('audio_data');
    box.add(recording);
    loadRecordings(); // Update the reactive list
  }

  /// Delete a recording from both Hive and the list
  void deleteRecording(int index) {
    var box = Hive.box('audio_data');
    box.deleteAt(index);
    loadRecordings(); // Update the reactive list
  }

  /// clear all recordings from Hive and the list
  void clearRecordings() {
    var box = Hive.box('audio_data');
    box.clear();
    loadRecordings(); // Update the reactive list
  }

  Future<void> uploadToBunnyNet(File audioFile) async {
    const storageZone = "echosign";
    const apiKey = "8332ae06-c212-44c4-9c6307f97f56-2a44-4bb4";
    final uri = Uri.parse(
        "https://storage.bunnycdn.com/$storageZone/${audioFile.path.split('/').last}");

    try {
      final response = await Dio().put(
        uri.toString(),
        data: audioFile.readAsBytesSync(),
        options: Options(
          headers: {
            'AccessKey': apiKey,
            'Content-Type': 'audio/wav',
          },
        ),
      );

      if (response.statusCode == 201) {
        status.value = 'Uploaded to storage';
        final fileUrl =
            "https://$storageZone.b-cdn.net/${audioFile.path.split('/').last}";
        await sendToFlaskAPI(fileUrl, audioFile.path);
      } else {
        status.value = 'Failed to upload to Bunny.net';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload to Bunny.net');
    }
  }

  Future<void> sendToFlaskAPI(String fileUrl, String path) async {
    try {
      var configBox = Hive.box('config');
      final apiEndpoint = configBox.get('apiEndpoint');
      status.value = 'Sending to API...';
      // use dio
      final dio = Dio();
      final response = await dio.post(
        apiEndpoint,
        data: {
          'url': fileUrl,
        },
      );

      if (response.statusCode == 200) {
        status.value = response.data['class'];
        // update the predictedSound value in my box
        predictedSound.value = response.data['class'];
        // add the recording
        addRecording({
          'filePath': path,
          'predictedSound': response.data['class'],
          'date': DateTime.now().toIso8601String(),
          'day': DateTime.now().day,
          'month': DateTime.now().month,
          'year': DateTime.now().year,
          'duration': duration.value
        });

        // Update the gifPath
        gifPath.value = 'assets/gifs/${response.data['class']}.gif';

        Get.snackbar('Success', 'Recording Saved to History');
      } else {
        status.value = 'Failed to send to api';
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to send to API');
    }
  }
}
