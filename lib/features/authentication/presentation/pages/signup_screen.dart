// signup_screen.dart

import 'package:echo_sign/Widgets/button.dart';
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
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
                // name feild
                Container(
                  decoration: neumorphicStyle,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                const SizedBox(height: 30),
                // login button
                Obx(
                  () => authController.isLoading.value
                      ? const CircularProgressIndicator()
                      : neumorphicButton(
                          text: 'Signup',
                          onPressed: () {
                            if (nameController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Get.snackbar('Error', 'All fields are required');
                              return;
                            }
                            authController.signUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        ),
                ),
                const SizedBox(height: 50),
                // signup
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(
                      color: textColor,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
