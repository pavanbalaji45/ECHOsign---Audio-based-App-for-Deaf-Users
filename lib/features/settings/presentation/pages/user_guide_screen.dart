import 'package:echo_sign/config/constants.dart';
import 'package:flutter/material.dart';

class UserGuideScreen extends StatelessWidget {
  const UserGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Guide'),
        surfaceTintColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to EchoSign!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Follow these steps to use the app:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildStep(1, 'Configure API Endpoint', '''
Navigate to the "API Configuration" screen from the menu. Enter your API endpoint and save it. This endpoint will be used for all requests.'''),
              _buildStep(2, 'Record Audio', '''
Press the "Record" button on the recording screen to start recording. You can see the duration of the recording in real-time.'''),
              _buildStep(3, 'Stop and Save', '''
Once you’re done recording, press the "Stop" button. The audio file will be automatically saved locally, and its details will be stored securely.'''),
              _buildStep(4, 'View Recordings', '''
Navigate to the "Audio List" screen to view all your saved recordings. You can play back any recording directly from the list.'''),
              _buildStep(5, 'Notifications', '''
The app will notify you about the current status, such as whether it is recording, playing, or stopped.'''),
              _buildStep(6, 'Send Audio for Prediction', '''
In the "Audio List" screen, select a recording and send it to the configured API endpoint for prediction. The result will be displayed as a response.'''),
              SizedBox(height: 16),
              Divider(),
              Text(
                'Tips:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Ensure your API endpoint is correctly configured.'),
              Text('• Use .wav files for the best compatibility.'),
              Text('• Manage your saved recordings regularly to save space.'),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back to Home'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep(int stepNumber, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step $stepNumber: $title',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
