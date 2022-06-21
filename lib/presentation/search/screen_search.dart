import 'package:bloc_counter/core/colors/constants.dart';

import 'package:bloc_counter/presentation/search/widgets/search_idle.dart';
import 'package:bloc_counter/presentation/search/widgets/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: Colors.grey,
            ),
            style: const TextStyle(color: Colors.white),
            backgroundColor: Colors.grey.withOpacity(0.4),
          ),
          kHeight,
          // Expanded(child: const SearchIdleWidget()),
          Expanded(child: const SearchIdleWidget()), 
        ],
      ),
    )));
  }
}
