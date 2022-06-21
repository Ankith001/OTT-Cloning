import 'package:bloc_counter/core/colors/colors.dart';

import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  VideoListItem(
      {Key? key, required this.index, required this.url, required this.result})
      : super(key: key);

  int index;
  final String url;
  final List result;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    url + result[index]['poster_path'],
                  ),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //LEFT SIDE====>>

                CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 25,
                  child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          url + result[index]['poster_path'],
                        ),
                        radius: 27,
                      ),
                    ),
                    const VideoActionsWidget(
                      icon: Icons.emoji_emotions_outlined,
                      title: 'LOL',
                    ),
                    const VideoActionsWidget(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    const VideoActionsWidget(
                      icon: Icons.send,
                      title: 'Share',
                    ),
                    const VideoActionsWidget(
                      icon: Icons.play_arrow,
                      title: 'Play',
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 15),
          )
        ],
      ),
    );
  }
}
