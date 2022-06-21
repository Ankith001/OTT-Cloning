import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  
  const MainTitle({  
    Key? key,required this.title,  
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}