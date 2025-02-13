import 'package:echo_sign/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ApiConfigScreen extends StatefulWidget {
  const ApiConfigScreen({super.key});

  @override
  _ApiConfigScreenState createState() => _ApiConfigScreenState();
}

class _ApiConfigScreenState extends State<ApiConfigScreen> {
  late TextEditingController _controller;
  late Box _configBox;

  @override
  void initState() {
    super.initState();
    _configBox = Hive.box('config');
    _controller = TextEditingController(
      text: _configBox.get('apiEndpoint', defaultValue: 'https://echo-sign-api.onrender.com/predict'),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveApiEndpoint() {
    final endpoint = _controller.text.trim();
    if (endpoint.isNotEmpty) {
      _configBox.put('apiEndpoint', endpoint);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('API Endpoint saved successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid URL.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configure API Endpoint'),
        surfaceTintColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'API Endpoint:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your API endpoint',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveApiEndpoint,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
