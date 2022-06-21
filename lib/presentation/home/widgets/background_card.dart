import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/colors/constants.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Container(
              width: double.infinity,
              height: 450,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(kMainImage),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0, 
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const CustomButton(
                      title: 'My List',
                      icon: Icons.add,
                    ),
                    _PlayButton(),
                    const CustomButton(icon: Icons.info_outline, title: 'Info'),
                  ],
                ),
              ),
            )
          ],
        );
  }

   TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'Play',
          style: TextStyle(
              color: kBlackColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}