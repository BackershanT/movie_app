
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/new_hot/widgets/comingSoon.dart';
import 'package:movie_app/src/presentation/new_hot/widgets/everyone%20watchin.dart';

import '../../application/hotand_new_bloc.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: AppBar(
                  title: const Text("New & HOT",
                      style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  actions: [
                    const Icon(
                      Icons.cast,
                      size: 30,
                    ),
                    kWidth,
                    Container(
                      color: Colors.blue,
                      height: 30,
                      width: 30,
                    ),
                    kWidth,
                  ],
                  bottom: TabBar(
                      labelStyle: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      labelColor: Colors.black,
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      tabs: const [
                        Tab(
                          text: ":)coming soon",
                        ),
                        Tab(
                          text: ":)Everyone watching",
                        ),
                      ]),
                )),
            body: TabBarView(children: [
              ComingSoonList(key: Key('coming_soon')),
              EveryoneWatching(key: Key('everyone_is_watching')),

            ])));
  }


}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotandNewBloc>(context).add(LoadDataInComingSoon());
    });
    return RefreshIndicator(child:    BlocBuilder<HotandNewBloc, HotandNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return Center(child: Text('Error While Loading$state'));
          } else if (state.comingSoonList.isEmpty) {
            return Center(
              child: Text('Coming SoonList is Empty'),
            );
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return SizedBox();
                  }
                  log(movie.releaseDate.toString());
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate = DateFormat.yMMMMd('en_Us').format(_date!);
                    month =
                        formatedDate.split('').first.substring(0, 3).toUpperCase();
                    date = movie.releaseDate!.split('_')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }
                  return ComingsoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    description: movie.overview ?? 'No Discription',
                  );
                });
          }
        }), onRefresh:() async{
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        BlocProvider.of<HotandNewBloc>(context).add(LoadDataInComingSoon());
      });
    });

    //   BlocBuilder<HotandNewBloc, HotandNewState>(
    //     builder: (context, state) {
    //   if (state.isLoading) {
    //     return Center(
    //       child: CircularProgressIndicator(
    //         strokeWidth: 2,
    //       ),
    //     );
    //   } else if (state.isError) {
    //     return Center(child: Text('Error While Loading$state'));
    //   } else if (state.comingSoonList.isEmpty) {
    //     return Center(
    //       child: Text('Coming SoonList is Empty'),
    //     );
    //   } else {
    //     return ListView.builder(
    //         itemCount: state.comingSoonList.length,
    //         itemBuilder: (BuildContext context, index) {
    //           final movie = state.comingSoonList[index];
    //           if (movie.id == null) {
    //             return SizedBox();
    //           }
    //           log(movie.releaseDate.toString());
    //           String month = '';
    //           String date = '';
    //           try {
    //             final _date = DateTime.tryParse(movie.releaseDate!);
    //             final formatedDate = DateFormat.yMMMMd('en_Us').format(_date!);
    //             month =
    //                 formatedDate.split('').first.substring(0, 3).toUpperCase();
    //             date = movie.releaseDate!.split('_')[1];
    //           } catch (_) {
    //             month = '';
    //             date = '';
    //           }
    //           return ComingsoonWidget(
    //             id: movie.id.toString(),
    //             month: month,
    //             day: date,
    //             posterPath: '$imageAppendUrl${movie.posterPath}',
    //             movieName: movie.originalTitle ?? 'No Title',
    //             description: movie.overview ?? 'No Discription',
    //           );
    //         });
    //   }
    // }))///
  }
}

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotandNewBloc>(context).add(LoadDataInEveryOneWatching());
    });

    return BlocBuilder<HotandNewBloc, HotandNewState>(
        builder: (context, state) {
      if (state.isLoading) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      } else if (state.isError) {
        return Center(child: Text('Error While Loading$state'));
      } else if (state.everyOneWatchingList.isEmpty) {
        return Center(
          child: Text('Everyone Watching is Empty'),
        );
      } else {
        return ListView.builder(
            itemCount: state.everyOneWatchingList.length,
            itemBuilder: (BuildContext context, index) {
              final tv = state.everyOneWatchingList[index];
              if (tv.id == null) {
                return SizedBox();
              }
              return EveryoneWatchingWidget(
                posterPath: '$imageAppendUrl${tv.posterPath}',
                movieName: tv.originalName ?? 'No Name',
                description: tv.overview ?? 'No Discription',
              );
            });
      }
    });


  }
}
