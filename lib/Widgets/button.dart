import 'package:echo_sign/config/constants.dart';
import 'package:flutter/material.dart';

// Neumorphic Button
Widget neumorphicButton({
  String? text,
  IconData? icon,
  Image? image,
  double? width,
  double? height,
  TextStyle? textStyle,
  required Function onPressed,
}) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: 
        Container(
          padding: EdgeInsets.all(0),
          width: double.infinity,
          height: height ?? 50,
          clipBehavior: Clip.antiAlias,
          decoration: neumorphicStyle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null) image,
              if (image != null) const SizedBox(width: 10),
              if (icon != null) Icon(icon),
              if (icon != null) const SizedBox(width: 10),
              Text(text!, style: textStyle ?? bodyStyle,),
            ],
          ),
        ),
  );
}
