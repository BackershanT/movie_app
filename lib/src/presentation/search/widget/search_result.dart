import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/search/search_bloc.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/widget/maincard.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Movies & tv,",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kheight,
        Expanded(child: SizedBox(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              childAspectRatio: 1 / 1.4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(20, (index) {
                final movie = state.searchResultList[index];
                return Maincard(imageUrl: movie.posterPath.toString());
              }),
            );
          },
        )))
      ],
    );
  }
}
