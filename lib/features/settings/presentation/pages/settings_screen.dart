// Setting Screen

import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:echo_sign/features/settings/presentation/pages/aboutus_screen.dart';
import 'package:echo_sign/features/settings/presentation/pages/configuration_screen.dart';
import 'package:echo_sign/features/settings/presentation/pages/user_guide_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// SliverAppBar with a flexible space and background image
          SliverAppBar(
            expandedHeight: 160.0,
            floating: false, // AppBar won't disappear immediately on scroll
            pinned: true,
            centerTitle: false,
            elevation: 1,
            shadowColor: Colors.black,
            forceElevated: true,
            backgroundColor: backgroundColor,
            surfaceTintColor: backgroundColor,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 30.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Settings',
                            style: titleStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 24.0, bottom: 10.0),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pravatar.cc/150?img=1'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  authController
                                      .currentUser.value!.displayName!,
                                  style: titleStyle,
                                ),
                                Text(
                                  authController.currentUser.value!.email!,
                                  style: captionStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Container(
                    decoration: neumorphicStyle,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => UserGuideScreen());
                      },
                      child: ListTile(
                        title: Text('User Guide'),
                        leading: Icon(
                          Icons.person,
                          size: 24,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: neumorphicStyle,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ApiConfigScreen());
                      },
                      child: ListTile(
                        title: Text('Configuration'),
                        leading: Icon(
                          Icons.settings,
                          size: 24,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: neumorphicStyle,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => AboutUsScreen());
                      },
                      child: ListTile(
                        title: Text('About Us'),
                        leading: Icon(
                          Icons.lock,
                          size: 24,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Obx(
                    () => authController.isLoading.value
                        ? CircularProgressIndicator()
                        : Container(
                            decoration: neumorphicStyle,
                            child: TextButton(
                              onPressed: () {
                                authController.signOut();
                              },
                              child: ListTile(
                                title: Text('Logout'),
                                leading: Icon(
                                  Icons.logout,
                                  size: 24,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
