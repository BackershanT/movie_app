import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/home_bloc/home_bloc.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/home/widget/home_card.dart';

import 'package:movie_app/src/presentation/widget/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    // print(direction);
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }

                    return true;
                  },
                  child: Stack(children: [
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        } else if (state.isError) {
                          return Center(
                            child: Text('unable to load'),
                          );
                        }
                        final _releasePastYear = state.pastYearMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        _releasePastYear.shuffle();
                        final _trendingNow = state.trendingMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        _trendingNow.shuffle();
                        final tenseAndDrama = state.tenseMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        tenseAndDrama.shuffle();
                        final southIndianMovie = state.southIndianMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        southIndianMovie.shuffle();
                        final top10Movie = state.southIndianMovieList.map((m){
                          return '$imageAppendUrl${m.posterPath}';
                        }).toList();
                        top10Movie.shuffle();

                          return ListView(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 600,
                                    decoration: const BoxDecoration(
                                        color: Colors.amberAccent,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg",
                                            ))),
                                    // child: ,
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Column(
                                                children: [
                                                  Icon(Icons.add),
                                                  Text("MyList")
                                                ],
                                              ),
                                              TextButton.icon(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        WidgetStateProperty.all(
                                                            Colors.white)),
                                                onPressed: () {},
                                                label: const Text('play'),
                                                icon: const Icon(
                                                  Icons.play_arrow_outlined,
                                                  size: 30,
                                                ),
                                              ),
                                              const Column(
                                                children: [
                                                  Icon(Icons.info_outline),
                                                  Text("Info")
                                                ],
                                              ),
                                            ],
                                          )))
                                ],
                              ),
                              if(_releasePastYear.length>=10)
                              const MainTitle(title: "Released in Past Year"),
                              kheight,
                              MainCard(posterList: _releasePastYear),
                              kheight20,
                              const MainTitle(title: "Trending Now"),
                              kheight,
                              MainCard(posterList: _trendingNow),
                              kheight20,
                              const MainTitle(title: "Tense & Drama"),
                              kheight,
                              MainCard(posterList: tenseAndDrama),
                              kheight20,
                              const MainTitle(title: "South Indian Movie"),
                              kheight,
                              MainCard(posterList: southIndianMovie),
                              kheight20,
                              kheight20,
                              kheight20,

                              // const MainTitle(title: "TOp10 movie"),
                              // kheight,
                              // // HomeMainCardTwo(imageUrl: top10Movie.toString(), ),
                            ],
                          );
                      },
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1200),
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withOpacity(0.3),
                            child: const Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.logo_dev,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.logo_dev,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.logo_dev,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "tv shows",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("movies",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text("categories",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                          )
                        : kheight,
                  ]));
            }));
  }
}
