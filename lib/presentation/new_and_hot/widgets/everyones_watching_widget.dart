import 'package:bloc_counter/presentation/widgets/api_fetch_method.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import 'video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
   EveryonesWatchingWidget({
    Key? key,required this.index,required this.url
  }) : super(key: key); 
  int index;
  String imageBaseUrl = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';
  List results = [];
  String url;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiFetchMethod(  
          'https://api.themoviedb.org/3/movie/upcoming?api_key=1e945ca454e5ba27f52e620c4047fb84&language=en-US&page=1'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print('errror');
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          Map map = snapshot.data;
          results = map['results'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
           
          kHeight5,
           Text(
             results[index]['title'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          kHeight,
           Text(
            results[index]['overview'], 
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          kHeight50,
          //const VideoWidget(),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url + results[index]['backdrop_path']),fit: BoxFit.fill)), 
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomButton(
                icon: Icons.share_rounded,
                title: "Share",
                iconSize: 28,
                textSize: 15,
              ),
              kWidth,
              CustomButton(
                icon: Icons.add,
                title: "My List",
                iconSize: 28,
                textSize: 15,
              ),
              kWidth,
              CustomButton(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 28,
                textSize: 15,
              ),
              kWidth
            ],
          ),
        ],
      ),
    );
        }return kHeight;
      }
    );
  
  }
}