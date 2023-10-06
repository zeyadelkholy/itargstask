import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
     const CustomText({super.key,
     required this.text,
     this.fontWeight,
     this.color,
     this.size,

  });

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
      fontSize: size
      ),





    );
  }
}

