import 'package:bloc_counter/presentation/widgets/api_fetch_method.dart';
import 'package:flutter/material.dart';

import '../../core/colors/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
   MainTitleCard({
    Key? key,required this.title,required this.url
  }) : super(key: key);
  final String title;
  String url;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiFetchMethod(url),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.hasData) {
          Map map = snapshot.data;

          List results = map['results'];

          String imageBaseUrl =
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight5, 
          LimitedBox(
            maxHeight: 180,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) =>  MainCard(index: index,result: results, url:  imageBaseUrl,))),
          )
        ],
      ),
    );
        }return kHeight;
      }
    );
  }
}
