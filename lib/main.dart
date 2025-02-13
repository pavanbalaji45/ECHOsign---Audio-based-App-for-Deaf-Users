import 'package:echo_sign/firebase_options.dart';
import 'package:echo_sign/routes/app_routes.dart';
import 'package:echo_sign/config/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Notifications
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  await requestNotificationPermission();
  await Hive.initFlutter();
  await Hive.openBox('audio_data'); // Open a Hive box for storage
  // Open a Hive box for storing session data
  await Hive.openBox('authBox');
  await Hive.openBox('config');
  runApp(const EchoSign());
}

class EchoSign extends StatelessWidget {
  const EchoSign({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EchoSign',
      theme: AppTheme.themeData,
      initialRoute: AppPages.splash,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
