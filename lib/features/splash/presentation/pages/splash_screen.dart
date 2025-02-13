// splash screen
import 'package:echo_sign/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:echo_sign/features/home/presentation/pages/main_screen.dart';
import 'package:echo_sign/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      authController.onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Obx(() {
      if (authController.currentUser.value != null) {
        return MainPage();
      } else {
        return OnboardingScreen();
      }
    }),
    );
  }
}