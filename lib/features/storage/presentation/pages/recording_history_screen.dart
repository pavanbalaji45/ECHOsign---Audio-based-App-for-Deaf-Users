// Recording History Screen

import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/storage/presentation/controllers/recording_controller.dart';
import 'package:echo_sign/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordingHistoryScreen extends StatelessWidget {
  const RecordingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordingController audioController = Get.put(RecordingController());
    // var box = Hive.box('audio_data');
    return Scaffold(
      appBar: AppBar(
        title: Text('Recording History'),
        backgroundColor: backgroundColor,
        elevation: 2,
        centerTitle: true,
        surfaceTintColor: backgroundColor,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: RefreshIndicator(
          onRefresh: () => audioController.loadRecordings(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Obx(
                () => audioController.recordings.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: audioController.recordings.length,
                          itemBuilder: (context, index) {
                            return HistoryTile(
                              index: index,
                              recordingUrl: audioController.recordings[index]
                                  ['filePath'],
                              date: audioController.recordings[index]['date'],
                              day: audioController.recordings[index]['day']
                                  .toString(),
                              month: audioController.recordings[index]['month']
                                  .toString(),
                              year: audioController.recordings[index]['year']
                                  .toString(),
                              duration: audioController.recordings[index]
                                      ['duration']
                                  .toString(),
                              predictedSound: audioController.recordings[index]
                                  ['predictedSound'],
                            );
                          },
                        ),
                      )
                    : const EmptyRecordings(),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton to clear all the recordings
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          audioController.clearRecordings();
          Get.snackbar('Cleared', 'All recordings removed');
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}

// ignore: must_be_immutable
class HistoryTile extends StatelessWidget {
  
  final int index;

  /// Sunday
  final String day;

  /// Jan
  String month;

  /// year
  final String year;

  /// 12:45 pm
  final String date;

  /// May 26, 2024
  final String duration;

  /// 06:02:00
  final String recordingUrl;

  final String predictedSound;

  /// 'https://example.com/recording.mp3'
  HistoryTile({
    super.key,
    required this.date,
    required this.day,
    required this.month,
    required this.year,
    required this.duration,
    required this.recordingUrl,
    required this.index,
    required this.predictedSound,
  });

  @override
  Widget build(BuildContext context) {
    // month should be in the format of 'May'
    // day should be in the format of 'Sunday'
    switch (month) {
      case '1':
        month = 'Jan';
        break;
      case '2':
        month = 'Feb';
        break;
      case '3':
        month = 'Mar';
        break;
      case '4':
        month = 'Apr';
        break;
      case '5':
        month = 'May';
        break;
      case '6':
        month = 'Jun';
        break;
      case '7':
        month = 'Jul';
        break;
      case '8':
        month = 'Aug';
        break;
      case '9':
        month = 'Sep';
        break;
      case '10':
        month = 'Oct';
        break;
      case '11':
        month = 'Nov';
        break;
      case '12':
        month = 'Dec';
        break;
      default:
        month = 'Jan';
    }
    return GestureDetector(
      onTap: () => Get.toNamed(AppPages.recordingPalyer, arguments: [recordingUrl, duration, date, index, predictedSound]),
      child: Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 15.0),
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: neumorphicStyleShadows,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: bodyStyle,
                ),
                const SizedBox(height: 6),
                Text(
                  'Date: $month $day, $year',
                  style: captionStyle,
                ),
              ],
            ),
            const SizedBox(width: 50),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: neumorphicStyle,
                  child: Icon(
                    Icons.play_arrow,
                    color: Color(0xFF343A40),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${duration}s',
                  style: captionStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyRecordings extends StatelessWidget {
  const EmptyRecordings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'No recordings yet',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
