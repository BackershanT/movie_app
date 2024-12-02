import 'package:flutter/material.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/domain/downloads/models/downloads_model.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(key: key, child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VedioListItem extends StatelessWidget {
  final int index;
  const VedioListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    return Column(
      children: [
        Container(
            height: 800,
            color: Colors.accents[index % Colors.accents.length],
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.volume_mute_rounded)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundImage: posterPath == null
                                  ? null
                                  : NetworkImage('$imageAppendUrl$posterPath')),
                          VedioAction(icon: Icons.emoji_emotions, title: "LOL"),
                          kheight,
                          VedioAction(icon: Icons.add, title: "MyList"),
                          kheight,
                          VedioAction(icon: Icons.share, title: "Share"),
                          kheight,
                          VedioAction(icon: Icons.play_circle, title: "Play "),
                        ],
                      )
                    ],
                  )),
            ))
      ],
    );
  }
}

class VedioAction extends StatelessWidget {
  final IconData icon;
  final String title;

  const VedioAction({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(title)
          ],
        ));
  }
}


class FastLaughVideoPlayer extends StatefulWidget {
  const FastLaughVideoPlayer({super.key});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return  Container();
  }
}
