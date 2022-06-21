import 'package:bloc_counter/presentation/widgets/api_fetch_method.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import 'video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({Key? key, required this.index,required this.url}) : super(key: key);
  int index;
  String imageBaseUrl = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';
  List results = [];
  String url;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          return Row(
            children: [
              SizedBox(
                width: 50,
                height: 430,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "FEB",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                    Text(
                      "11",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width - 50,
                height: 415,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const VideoWidget(),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(url + results[index]['poster_path']),fit: BoxFit.fill  
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          results[index]['title'],
                          style: const TextStyle(
                            letterSpacing: -3,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        //  const Spacer(),
                        Row(
                          children: const [
                            CustomButton(
                              icon: Icons.alarm,
                              title: "Remind me",
                              iconSize: 20,
                              textSize: 12,
                            ),
                            kWidth,
                            CustomButton(
                              icon: Icons.info_outline,
                              title: "Info",
                              iconSize: 20,
                              textSize: 12,
                            ),
                            kWidth
                          ],
                        )
                      ],
                    ),
                    kHeight5,
                    const Text("Coming on Friday"),
                    kHeight,
                    Text(
                      results[index]['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    kHeight,
                    Text(
                      results[index]['overview'],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return kHeight;
      },
    );
  }
}
