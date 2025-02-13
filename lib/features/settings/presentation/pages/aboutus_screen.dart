// aboutus Screen

import 'package:flutter/material.dart';

import '../../../../config/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
        surfaceTintColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 24.0),
          child: Container(
            width: double.infinity,
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text('About Us',style: titleStyle,),
                Divider(),
                Text('At EchoSign, we are dedicated to empowering the deaf and hard-of-hearing community through innovative technology. Our app leverages advanced sound recognition to bridge the communication gap by converting environmental sounds and spoken language into sign language. Our mission is to create a world where accessibility is a given, not a privilege. By combining cutting-edge technology with user-centered design, EchoSign ensures that no conversation or critical sound goes unnoticed. With EchoSign, we aim to foster inclusivity, independence, and confidence for those navigating a world driven by sound. Together, we are making communication seamless and meaningful for everyone.', style: bodyStyle,textAlign: TextAlign.justify,),
                SizedBox(height: 30,),
                Text('Our Team',style: titleStyle,),
                Divider(),
                Text('V. Sharavinda BU21CSEN0100774',style: bodyStyle,),
                Text('G. Gouthami BU21CSEN0100802', style: bodyStyle,),
                Text('M. Varshitha BU21CSEN0101230',style: bodyStyle,),
                Text('B. Manogna BU21CSEN0101442',style: bodyStyle,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
