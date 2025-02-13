import 'package:flutter/material.dart';


// API Endpoint
const apiEndpoint = "http://192.168.192.252:5000/predict";

final Color primaryColor = Color(0xFF007BFF); // Bright Blue
final Color secondaryColor = Color(0xFF00C897); // Mint Green
final Color accentColor = Color(0xFFFFA500); // Bright Orange
final Color backgroundColor = Color(0xFFF8F9FA); // Light Gray
final Color textColor = Color(0xFF343A40); // Dark Gray


ShapeDecoration neumorphicStyle = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0.71, -0.71),
    end: Alignment(-0.71, 0.71),
    colors: [Colors.white, Color(0xFFEAEAEA)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0xE5DDDDDD),
      blurRadius: 13,
      offset: Offset(5, 5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0xE5FFFFFF),
      blurRadius: 10,
      offset: Offset(-5, -5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33DDDDDD),
      blurRadius: 10,
      offset: Offset(5, -5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33DDDDDD),
      blurRadius: 10,
      offset: Offset(-5, 5),
      spreadRadius: 0,
    )
  ],
);

Decoration neumorphicStyleNotRounded = ShapeDecoration(
  gradient: const LinearGradient(
    begin: Alignment(0.71, -0.71),
    end: Alignment(-0.71, 0.71),
    colors: [Colors.white, Color(0xFFEAEAEA)],
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(0),
  ),
  shadows: const [
    BoxShadow(
      color: Color(0xE5DDDDDD),
      blurRadius: 13,
      offset: Offset(5, 5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0xE5FFFFFF),
      blurRadius: 10,
      offset: Offset(-5, -5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33DDDDDD),
      blurRadius: 10,
      offset: Offset(5, -5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33DDDDDD),
      blurRadius: 10,
      offset: Offset(-5, 5),
      spreadRadius: 0,
    )
  ],
);

const List<BoxShadow> neumorphicStyleShadows = [
    BoxShadow(
      color: Color(0xE5DDDDDD),
      blurRadius: 13,
      offset: Offset(5, 5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0xE5FFFFFF),
      blurRadius: 10,
      offset: Offset(-5, -5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33DDDDDD),
      blurRadius: 10,
      offset: Offset(5, -5),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x33DDDDDD),
      blurRadius: 10,
      offset: Offset(-5, 5),
      spreadRadius: 0,
    )
  ];

TextStyle titleStyle = TextStyle(
  color: textColor,
  fontSize: 22,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);

TextStyle bodyStyle = TextStyle(
  color: textColor,
  fontSize: 16,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);

TextStyle captionStyle = TextStyle(
  color: textColor,
  fontSize: 12,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w300,
);