import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.icon,
    required this.title,
    this.iconSize =25,
    this.textSize =18
  }) : super(key: key);
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize
          ),
        ),
      ],
    );
  }
}