import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/search/search_bloc.dart';
import 'package:movie_app/src/domain/core/debounce/debounce.dart';

import 'package:movie_app/src/presentation/search/widget/search_idle.dart';
import 'package:movie_app/src/presentation/search/widget/search_result.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final debouncer = Debouncer(milliseconds: 1);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.white,
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.black,
                ),
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  });
                  print(value);
                },
              ),

              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const SearchIdle();
                  } else {
                    return const SearchResultWidget();
                  }
                },
              )),

              // Expanded(child: SearchResult()),

              // SearchResult(),
            ],
          )),
    ));
  }
}
