// Recording player screen

// import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:echo_sign/config/constants.dart';
import 'package:echo_sign/features/storage/presentation/controllers/recording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';

class RecordingPlayer extends StatelessWidget {
  const RecordingPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordingController audioController = Get.put(RecordingController());
    var args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Playing Now'),
        surfaceTintColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            audioController.stopPlayback();
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
                child: Center(
                  child: GifView.asset(
                    'assets/gifs/${args[4]}.gif',
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                '${args[2]}',
                style: bodyStyle,
              ),
              SizedBox(height: 20),
              // Output
              Container(
                decoration: neumorphicStyle,
                width: 200,
                height: 50,
                child: Center(
                  child: Text(
                    audioController.recordings[args[3]]['predictedSound'],
                    style: bodyStyle,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Recording duration
              Text(
                'Duration: ${args[1]}s',
                style: bodyStyle,
              ),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // cancle button
                  IconButton(
                    onPressed: () {
                      // alert dialog to confirm deletion
                      Get.defaultDialog(
                        title: 'Delete Recording',
                        middleText:
                            'Are you sure you want to delete this recording?',
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              audioController.deleteRecording(args[3]);
                              Get.back(
                                closeOverlays: true,
                              );
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 25,
                    color: Colors.red,
                  ),
                  SizedBox(width: 60),
                  // Record button
                  GestureDetector(
                    onTap: () => !audioController.isPlaying.value
                        ? audioController.playFile(args[0])
                        : audioController.stopPlayback(),
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
                      child: !audioController.isPlaying.value
                          ? Image.asset(
                              'assets/icons/play.png',
                              width: 40,
                              height: 40,
                            )
                          : Icon(Icons.pause, size: 30, color: textColor),
                    ),
                  ),
                  SizedBox(width: 100),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
