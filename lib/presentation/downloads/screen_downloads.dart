import 'dart:math';


import 'package:bloc_counter/core/colors/colors.dart';
import 'package:bloc_counter/core/colors/constants.dart';
import 'package:bloc_counter/presentation/widgets/api_fetch_method.dart';

import 'package:bloc_counter/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';


class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length));
  }
}

//==========Section One=====================>>>

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Text('Smart Downloads')
      ],
    );
  }
}

//==========Section Two=====================>>>

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final List imageList = [
    "https://terrigen-cdn-dev.marvel.com/content/prod/2x/hawkeye_lob_crd_04.jpg",
    "https://terrigen-cdn-dev.marvel.com/content/prod/1x/online_9.jpg",
    "https://m.media-amazon.com/images/M/MV5BODNiODVmYjItM2MyMC00ZWQyLTgyMGYtNzJjMmVmZTY2OTJjXkEyXkFqcGdeQXVyNzk3NDUzNTc@._V1_.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
   // BlocProvider.of<DownloadsBloc>(context).add(DownloadsEvent.getDownloadsImage());
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of movies and shows for you, so there is\nalways to watch on your \ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),

        FutureBuilder(
          future: apiFetchMethod(
              'https://api.themoviedb.org/3/trending/all/day?api_key=8a164c1acfb1c7c1f90d63bbb4de6dcd'),
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
      
            return SizedBox(
              width: size.width,
              height: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      radius: size.width * 0.4,
                    ),
                  ),
                  DownloadsImageWidget(
                    imageList: imageBaseUrl + results[0]['poster_path'] ,
                    margin: const EdgeInsets.only(left: 130, bottom: 50),
                    angle: 30,
                    size: Size(size.width * 0.3, size.width * 0.48),
                  ),
                  DownloadsImageWidget(
                    imageList: imageBaseUrl + results[1]['poster_path'], 
                    margin: const EdgeInsets.only(right: 130, bottom: 50),
                    angle: -30,
                    size: Size(size.width * 0.3, size.width * 0.48),
                  ),
                  DownloadsImageWidget( 
                    imageList: imageBaseUrl + results[2]['poster_path'], 
                    margin: const EdgeInsets.only(bottom: 10),
                    size: Size(size.width * 0.4, size.width * 0.58),
                    radius: 5,
                  )
                ],
              ),
            );
          }
          return const Padding( 
              padding: EdgeInsets.only(top: 200.0),
              child: CircularProgressIndicator(),
            );
        }
        )
      ]
    );
  }
                    
            
  
  
}

//==========Section Three=====================>>>

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: kButtonBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kButtonWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: kBlackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius = 10,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
