import 'package:bloc_counter/core/colors/colors.dart';
import 'package:bloc_counter/presentation/downloads/screen_downloads.dart';
import 'package:bloc_counter/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:bloc_counter/presentation/home/screen_home.dart';
import 'package:bloc_counter/presentation/main_page/widgets/bottom_nav.dart';
import 'package:bloc_counter/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:bloc_counter/presentation/search/screen_search.dart';
import 'package:flutter/material.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavWidget(),
    );
  }
}


// SafeArea(
//         child: Center(
//           child: Text(
//             'Hello',
//           ),
//         ),
//       ),