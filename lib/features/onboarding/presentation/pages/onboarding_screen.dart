// onboarding screen
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/routes/app_routes.dart';
import 'package:echo_sign/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
        surfaceTintColor: AppTheme.backgroundColor,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to EchoSign",
            body: "Translate sounds around you into sign language.",
            image: Image.asset('assets/illu/onboarding-1.png', width: 280, height: 144,),
            decoration: PageDecoration(
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              imageAlignment: Alignment(0.0, 2.0),
              bodyAlignment: Alignment.center,
            ),
          ),
          PageViewModel(
            title: "Record Sounds",
            body: "Record any sounds like doorbells or alarms.",
            image: Image.asset('assets/illu/onboarding-2.png', height: 245.0, width: 265,),
            decoration: PageDecoration(
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              imageAlignment: Alignment(0.0, 3.0),
              bodyAlignment: Alignment.center,
              bodyPadding: EdgeInsets.all(5.0)
            ),
          ),
          PageViewModel(
            title: "Sign Language Translation",
            body: "View real-time sign language translations.",
            image: Image.asset('assets/illu/onboarding-3.png', height: 280, width: 280,),
            decoration: PageDecoration(
              titleTextStyle: titleStyle,
              bodyTextStyle: bodyStyle,
              imageAlignment: Alignment(0.0, 3.0),
              bodyAlignment: Alignment.center,
              bodyPadding: EdgeInsets.all(10.0)
            ),
          ),
        ],
        onDone: () => Get.toNamed(AppPages.login),
        showSkipButton: true,
        skip: Text("Skip", style: bodyStyle),
        next: Icon(Icons.arrow_forward, color: AppTheme.textColor,),
        done: Text("Get Started", style: bodyStyle),
        dotsDecorator: DotsDecorator(
          color: AppTheme.textColor,
          activeColor: AppTheme.accentColor,
          size: Size(10.0, 10.0),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
