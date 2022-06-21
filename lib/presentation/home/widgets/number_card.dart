import 'package:bloc_counter/core/colors/colors.dart';
import 'package:bloc_counter/core/colors/constants.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
   NumberCard({Key? key, required this.index, required this.result, required this.url}) : super(key: key);
  final int index;
    String url;
  
  List result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 180,
            ),
            Container( 
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: kBRadius10,
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                   url + result[index]['poster_path']
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -20,
          child: BorderedText(
            strokeWidth: 10.0 ,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",  
              style: TextStyle(color: kBlackColor,
                decoration: TextDecoration.none,
                decorationColor: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
