
import 'package:echo_sign/features/authentication/presentation/pages/forgot_password.dart';
import 'package:echo_sign/features/authentication/presentation/pages/login_screen.dart';
import 'package:echo_sign/features/authentication/presentation/pages/signup_screen.dart';
import 'package:echo_sign/features/home/presentation/pages/home_screen.dart';
import 'package:echo_sign/features/home/presentation/pages/main_screen.dart';
import 'package:echo_sign/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:echo_sign/features/settings/presentation/pages/aboutus_screen.dart';
import 'package:echo_sign/features/splash/presentation/pages/splash_screen.dart';
import 'package:echo_sign/features/storage/presentation/pages/recording_player.dart';
import 'package:echo_sign/features/storage/presentation/pages/recording_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const String splash = '/splash';
  static const String onBoarding = '/on-boarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String mainPage = '/main-page';
  static const String home = '/home';
  static const String recordingHistory = '/recording-history';
  static const String recordingHistoryEmpty = '/recording-history-empty';
  static const String recording = '/recording';
  static const String recordingPalyer = '/recording-player';
  static const String settings = '/settings';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String help = '/help';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static const String notifications = '/notifications';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: AppPages.splash,
      page: () => SplashScreen(),
    ),
    
    // ONBOARDING SCREEN
    GetPage(
      name: AppPages.onBoarding,
      page: () => OnboardingScreen(),
    ),

    // LOGIN SCREEN
    GetPage(
      name: AppPages.login,
      page: () => LoginScreen(),
    ),

    // SIGNUP SCREEN
    GetPage(
      name: AppPages.signup,
      page: () => SignupScreen(),
    ),

    // FORGOT PASSWORD SCREEN
    GetPage(
      name: AppPages.forgotPassword,
      page: () => ForgotPassword(),
    ),

    // MAIN PAGE
    GetPage(
      name: AppPages.mainPage,
      page: () => MainPage(),
    ),

    // HOME SCREEN
    GetPage(
      name: AppPages.home,
      page: () => HomeScreen(),
    ),

    // RECORDING HISTORY SCREEN
    GetPage(
      name: AppPages.recordingHistory,
      page: () => HomeScreen(),
    ),

    // Recording Screen
    GetPage(
      name: AppPages.recording,
      page: () => RecordingScreen(),
    ),

    // Recording Player Screen
    GetPage(
      name: AppPages.recordingPalyer,
      page: () => RecordingPlayer(),
    ),

    // SETTINGS SCREEN
    GetPage(
      name: AppPages.about,
      page: () => AboutUsScreen(),
    ),
  ];
}