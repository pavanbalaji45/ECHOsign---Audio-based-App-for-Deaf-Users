// Forgot password screen

import 'package:echo_sign/Widgets/button.dart';
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(''),
        elevation: 2,
        surfaceTintColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // image logo
                Image.asset('assets/illu/login.png', width: 300, height: 300),
                Container(
                  decoration: neumorphicStyle,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      contentPadding:
                          const EdgeInsets.only(left: 24, top: -15, bottom: 0),
                      labelStyle: TextStyle(
                        color: textColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                neumorphicButton(
                  text: 'Reset Password',
                  onPressed: () {
                    authController.resetPassword(emailController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}