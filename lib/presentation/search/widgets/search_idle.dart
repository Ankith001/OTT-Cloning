import 'package:bloc_counter/core/colors/colors.dart';
import 'package:bloc_counter/core/colors/constants.dart';

import 'package:bloc_counter/presentation/search/widgets/title.dart';
import 'package:bloc_counter/presentation/widgets/api_fetch_method.dart';
import 'package:flutter/cupertino.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
            child: FutureBuilder(
                future: apiFetchMethod(trendingUrls),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print('error');
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (snapshot.hasData) {
                    Map map = snapshot.data;
                    List results = map['results'];
                    String imageBaseUrl =
                        'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => TopSearchItemTile(
                            index: index, result: results, url: imageBaseUrl),
                        separatorBuilder: (context, index) => kHeight,
                        itemCount: 10);
                  }
                  return kHeight;
                }))
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  TopSearchItemTile(
      {Key? key, required this.index, required this.result, required this.url})
      : super(key: key);

  int index;
  List result;
  String url;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.33,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(url + result[index]['poster_path']),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            "${result[index]['original_name'] ?? result[index]['title']}",
            style: const TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        Icon(
          CupertinoIcons.play_circle,
          color: kWhiteColor,
          size: 40,
        )
      ],
    );
  }
}
