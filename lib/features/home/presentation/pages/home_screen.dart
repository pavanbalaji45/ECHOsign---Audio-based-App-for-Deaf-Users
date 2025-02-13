// Home Screen
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:echo_sign/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map> categories = [
    // 'Siren/Hammer',
    // 'Drilling/Engine',
    // 'Gunshots/Street Music',
    // 'Dog Barking/Car Horn',
    // 'Children Playing',
    {
      'text': 'Siren/Hammer',
      'icon': Icons.warning,
    },
    {
      'text': 'Drilling/Engine',
      'icon': Icons.build,
    },
    {
      'text': 'Gunshots/Street Music',
      'icon': Icons.music_note,
    },
    {
      'text': 'Dog Barking/Car Horn',
      'icon': Icons.pets,
    },
    {
      'text': 'Children Playing',
      'icon': Icons.child_care,
    }
   ];

   final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// SliverAppBar with a flexible space and background image
          SliverAppBar(
            expandedHeight: 100.0,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding: const EdgeInsets.only(left: 24.0, bottom: 0.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Hello There!',
                            style: titleStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, bottom: 16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            authController
                                      .currentUser.value!.displayName!,
                            style: bodyStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Explore',
                    style: titleStyle.copyWith(fontSize: 32.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24.0),
                  Wrap(
                    spacing: 24.0,
                    runSpacing: 24.0,
                    children: categories.map((category) {
                      return CategoryButton(
                        text: category['text'],
                        onPressed: () {
                          // Navigate to the recording screen
                          Get.toNamed(AppPages.recording);
                        },
                        icon: category['icon'],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Function onPressed;
  const CategoryButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 150.0,
      height: 150.0,
      decoration: neumorphicStyle,
      child: TextButton(
        // tooltip: text,
        onLongPress: () => SnackBar(content: Text(text)),
        onPressed: () {
          // Navigate to the recording screen
          onPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30.0, color: primaryColor),
            Text(text, style: bodyStyle, textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
          ],
        ),
      ),
    );
  }
}