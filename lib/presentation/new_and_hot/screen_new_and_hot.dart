import 'package:bloc_counter/core/colors/colors.dart';
import 'package:bloc_counter/presentation/search/widgets/search_result.dart';
import 'package:flutter/material.dart';
import '../../core/colors/constants.dart';
import 'widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
                title: const Text(
                  "New & Hot",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    color: Colors.white,
                  ),
                  kWidth,
                  Container(
                    width: 30,
                    height: 30,
                    color: Colors.blue, 
                  ),
                ],
                bottom: TabBar(
                    isScrollable: true,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kWhiteColor,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: BoxDecoration(
                        color: kWhiteColor, borderRadius: kBRadius30),
                    tabs: const [
                      Tab(
                        text: '🍟 Coming Soon',
                      ),
                      Tab(
                        text: "👀 Everyone's Watching",
                      ),
                    ])),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ])),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (BuildContext context, index) =>  ComingSoonWidget(index: index ,url: imageBaseUrl),
    );
  }

  _buildEveryonesWatching() {
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, index) =>
             EveryonesWatchingWidget(index: index,url: imageBaseUrl));
  } 
}





