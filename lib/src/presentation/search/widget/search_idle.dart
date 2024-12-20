import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/search/search_bloc.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/search/widget/top_search_item_tile.dart';

const imageUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi1q_XxIbYOrw7UDyuEPT4kHPYx1f2JqWDwg&s";

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text(
          "Top Searches,",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.isError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (state.idleList.isEmpty) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                      title: movie.title ?? 'no title Provided',
                      imageUrl: '$imageAppendUrl${movie.posterPath}',
                    );
                  },
                  separatorBuilder: (ctx, index) => kheight20,
                  itemCount: state.idleList.length);
            }
          },
        ))
      ],
    );
  }
}
