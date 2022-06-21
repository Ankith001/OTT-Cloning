import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://images.contentstack.io/v3/assets/blt0952b6ad20dfb00a/bltfc4fbfd9fa0e1348/6141044d64c8007a9bde99c2/Arcane--Social-media_fb.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black26,
            radius: 15,
            child: IconButton(
              iconSize: 15,
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
