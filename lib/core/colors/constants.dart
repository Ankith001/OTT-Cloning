import 'package:bloc_counter/core/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kWidth = SizedBox(width: 10);
const kHeight = SizedBox(height: 10);
const kHeight5 = SizedBox(height: 5);
const kHeight20 = SizedBox(height: 20);
const kHeight50 = SizedBox(height: 50);

//border radius

final BorderRadius kBRadius5 = BorderRadius.circular(5);
final BorderRadius kBRadius10 = BorderRadius.circular(10);
final BorderRadius kBRadius30 = BorderRadius.circular(30);
final BorderRadius kBRadius40 = BorderRadius.circular(40);

//image
const kMainImage =
    "https://terrigen-cdn-dev.marvel.com/content/prod/2x/hawkeye_lob_crd_04.jpg";

//Textstyle

TextStyle kHomeTitleText = const TextStyle(
  color: kWhiteColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const imageAppendUrl = 'https://image.tmdb.org/t/p/w500/';  

String trendingUrls =
    'https://api.themoviedb.org/3/trending/all/day?api_key=8a164c1acfb1c7c1f90d63bbb4de6dcd';  
    String popUrl = 'https://api.themoviedb.org/3/trending/all/day?api_key=1e945ca454e5ba27f52e620c4047fb84';

    String imageBaseUrl = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';

    String popularUrls =
    'https://api.themoviedb.org/3/movie/popular?api_key=8a164c1acfb1c7c1f90d63bbb4de6dcd&language=en-US&page=1';
//trending url


// tv shown based on books url 
String tvshows = '';

// top 10 in india today 


String top10 = 'https://api.themoviedb.org/3/movie/top_rated?api_key=8a164c1acfb1c7c1f90d63bbb4de6dcd&language=en-US&page=1'; 