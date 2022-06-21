import 'package:bloc_counter/core/colors/constants.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
   MainCard({
    Key? key,required this.url,required this.index,required this.result
  }) : super(key: key);

  String url;
  int index;
  List result;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,0,0), 
      child: Container(
        width: 120,
        height: 180, 
        decoration: BoxDecoration(
          borderRadius: kBRadius10,  
          image:  DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage( 
              url + result[index]['poster_path'],
            ),
          ),
        ),
      ),
    );
  }
}