import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:movie_app/src/presentation/first_laugh/widget/vedio_list_item.dart';

class FirstLaughScreen extends StatelessWidget {
  const FirstLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Icon(Icons.wifi_tethering_error_outlined),
          );
        } else if (state.videoList.isEmpty) {
          return const Center(
            child: Text('VedioList Empty'),
          );
        } else {
          return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videoList.length, (index) {
                return VideoListItemInheritedWidget(
                    widget:
                        VedioListItem(key: Key(index.toString()), index: index),
                    movieData: state.videoList[index]);
              }));
        }
      },
    )));
  }
}
