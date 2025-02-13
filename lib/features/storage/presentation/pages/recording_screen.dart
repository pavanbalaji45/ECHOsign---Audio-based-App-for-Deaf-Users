// Recording Screen

import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/storage/presentation/controllers/recording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

class RecordingScreen extends StatelessWidget {
  const RecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordingController audioController = Get.put(RecordingController());
    audioController.gifPath.value = '';
    audioController.status.value = 'Press the mic to start';
    return Scaffold(
      appBar: AppBar(
        title: Text('Recording Screen'),
        surfaceTintColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Output
              SizedBox(
                height: 400,
                child: Obx(() => audioController.gifPath.value.isEmpty
                    ? Center(
                        child: Image.asset('assets/illu/listening.png', width: 350, height: 350),
                      )
                    :
                  Center(
                    child: GifView.asset(
                      audioController.gifPath.value,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Record status
              Container(
                decoration: neumorphicStyle,
                width: 200,
                height: 50,
                child: Center(
                  child: Obx(
                    () => Text(
                      audioController.status.value,
                      style: bodyStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Recording duration
              Text(
                audioController.isRecording.value
                    ? '${audioController.duration.value}s'
                    : '00:00:00',
                style: titleStyle,
              ),

              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // cancle button
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                    iconSize: 30,
                  ),
                  SizedBox(width: 60),
                  // Record button
                  GestureDetector(
                    onTap: () => !audioController.isRecording.value ? audioController.startRecording() : audioController.stopRecording(),
                    child: Container(
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.71, -0.71),
                          end: Alignment(-0.71, 0.71),
                          colors: [Colors.white, Color(0xFFEAEAEA)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        shadows: neumorphicStyleShadows,
                      ),
                      padding: EdgeInsets.all(20),
                      width: 70.0,
                      height: 70.0,
                      child: !audioController.isRecording.value ? Image.asset(
                        'assets/icons/microphone.png',
                        width: 40,
                        height: 40,
                      ) : Icon(Icons.mic_off, size: 30, color: accentColor),
                    ),
                  ),
                  // Save button
                  SizedBox(width: 60),
                  IconButton(
                    onPressed: () {
                      // Save the recording
                      Get.back();
                    },
                    icon: Icon(Icons.check),
                    iconSize: 30,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}