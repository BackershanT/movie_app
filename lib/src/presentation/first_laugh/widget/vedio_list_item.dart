import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
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
    final videoUrls = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrls,
          onStateChanged: (bool) {},
        ),
        Align(
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
                      ValueListenableBuilder(
                        valueListenable: likedVideosNotifier,
                        builder: (BuildContext c, Set<int> newLikedListIds,
                            Widget? _) {
                          final _index = index;
                          if (newLikedListIds.contains(_index)) {
                            return GestureDetector(
                                onTap: () {
                                  likedVideosNotifier.value.remove(_index);
                                  likedVideosNotifier.notifyListeners();
                                  // BlocProvider.of<FastLaughBloc>(context)
                                  //     .add(UnLikeVideo(id: _index));
                                },
                                child: VedioAction(
                                    icon: Icons.favorite_outline,
                                    title: "Liked"));
                          }
                          return GestureDetector(
                              onTap: () {
                                likedVideosNotifier.value.add(_index);
                                likedVideosNotifier.notifyListeners();


                                // BlocProvider.of<FastLaughBloc>(context)
                                //     .add(LikeVideo(id: _index));
                              },
                              child: VedioAction(
                                  icon: Icons.emoji_emotions, title: "LOL"));
                        },
                      ),
                      kheight,
                      VedioAction(icon: Icons.add, title: "MyList"),
                      kheight,
                      GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListItemInheritedWidget.of(context)
                                  ?.movieData
                                  .posterPath;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: VedioAction(icon: Icons.share, title: "Share"),
                      ),
                      kheight,
                      VedioAction(icon: Icons.play_circle, title: "Play "),
                    ],
                  )
                ],
              )),
        )
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
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController))
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
