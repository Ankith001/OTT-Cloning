import 'package:bloc_counter/core/colors/constants.dart';
import 'package:bloc_counter/presentation/fast_laugh/widgets/video_list_item.dart';
import 'package:bloc_counter/presentation/widgets/api_fetch_method.dart';
import 'package:flutter/material.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (index) {
              return FutureBuilder(
                  future: apiFetchMethod(trendingUrls),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      print('errror');
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      Map map = snapshot.data;
                      List results = map['results'];
                     
                     return VideoListItem(
                        index: index, 
                        url: imageBaseUrl,
                        result: results,
                      );
                    }
                    return kHeight;
                  });
            },
          ),
        ),
      ),
    );
  }
}
