import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/widget/maincard.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

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

        Expanded(
            child:
            Container(
        child: GridView.count(
              childAspectRatio: 1/1.4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(20, (Index) {
            return const Maincard();
          }),
        )))
      ],
    );
  }
}
