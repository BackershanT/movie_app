import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/src/presentation/search/widget/search_idle.dart';
import 'package:movie_app/src/presentation/search/widget/search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.white,
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.xmark,
                  color: Colors.black,
                ),
                style: TextStyle(color: Colors.black),
              ),

              Expanded(child: SearchIdle()),

              Expanded(child: SearchResult()),

              // SearchResult(),
            ],
          )),
    ));
  }
}
