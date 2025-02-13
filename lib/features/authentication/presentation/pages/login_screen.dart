// Login Screen
// This is the login screen where the user can enter their email and password to login to the app.
// Nuemorphism is used to style the login screen.

import 'package:echo_sign/Widgets/button.dart';
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:echo_sign/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                          EdgeInsets.only(left: 24, top: -15, bottom: 0),
                      labelStyle: TextStyle(
                        color: textColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: neumorphicStyle,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding:
                          EdgeInsets.only(left: 24, top: -15, bottom: 0),
                      labelStyle: TextStyle(
                        color: textColor,
                      ),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                // forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppPages.forgotPassword);
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: textColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => authController.isLoading.value
                      ? CircularProgressIndicator()
                      : neumorphicButton(
                          onPressed: () => {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty)
                              {
                                Get.snackbar('Error', 'Please fill all fields'),
                              }
                            else
                              {
                                authController.signIn(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              }
                          },
                          text: 'Login',
                          height: 50,
                        ),
                ),
                SizedBox(height: 30),
                // or sign up
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.signup);
                  },
                  child: Text(
                    'Don\'t have an account? Sign up',
                    style: TextStyle(
                      color: textColor,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                // or
                // const SizedBox(height: 20),
                // Text('or', style: TextStyle(color: textColor)),
                // // signin with google
                // SizedBox(height: 20),
                // neumorphicButton(
                //   onPressed: () {
                //     // Get.toNamed(AppPages.home);
                //   },
                //   text: 'Sign in with Google',
                //   image:
                //       Image.asset('assets/google.png', width: 20, height: 20),
                //   height: 52,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
