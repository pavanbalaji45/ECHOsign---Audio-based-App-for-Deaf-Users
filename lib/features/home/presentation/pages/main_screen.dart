// Bottom Navigation Bar
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/home/presentation/controllers/navigation_controller.dart';
import 'package:echo_sign/features/home/presentation/pages/home_screen.dart';
import 'package:echo_sign/features/settings/presentation/pages/settings_screen.dart';
import 'package:echo_sign/features/storage/presentation/pages/recording_history_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final int pageIndex = 0;

  final pages = [
    HomeScreen(),
    RecordingHistoryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      body: Obx(
        () => pages[controller.pageIndex.value],
      ),
      bottomNavigationBar: Container(
        height: 100,
        
        color: Colors.white,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  controller.changePage(0);
                },
                child: controller.pageIndex.value == 0 ? Container(
                  width: 130,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: neumorphicStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.home,
                        color: controller.pageIndex.value == 0 ? primaryColor : textColor,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      controller.pageIndex.value == 0 ? Text('Home', style: bodyStyle) : const SizedBox(),
                    ],
                  ),
                ) : Icon(
                        FeatherIcons.home,
                        color: controller.pageIndex.value == 0 ? primaryColor : textColor,
                        size: 24,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changePage(1);
                },
                child: controller.pageIndex.value == 1 ? Container(
                  width: 140,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: neumorphicStyle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.hardDrive,
                        color: controller.pageIndex.value == 1 ? primaryColor : textColor,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      controller.pageIndex.value == 1 ? Text('Storage', style: bodyStyle) : const SizedBox(),
                    ],
                  ),
                ) : Icon(
                        FeatherIcons.hardDrive,
                        color: controller.pageIndex.value == 1 ? primaryColor : textColor,
                        size: 24,
                      ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changePage(2);
                },
                child: controller.pageIndex.value == 2 ? Container(
                  width: 145,
                  height: 50,
                  decoration: neumorphicStyle,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.settings,
                        color: controller.pageIndex.value == 2 ? primaryColor : textColor,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      controller.pageIndex.value == 2 ? Text('Settings', style: bodyStyle) : const Text(''),
                    ],
                  ),
                ) : Icon(
                        FeatherIcons.settings,
                        color: controller.pageIndex.value == 2 ? primaryColor : textColor,
                        size: 24,
                      ),
              ),
            ],
          )
        ),
      )
    );
  }
}