import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/home/widget/home_card.dart';

class MainTitle extends StatelessWidget {
  final String title;

  const MainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.posterList});
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return
    LimitedBox(
    maxHeight: 200,
    child: ListView(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    children: List.generate(
    posterList.length,
    (index) => HomeMainCard(
    imageUrl: posterList[index],
    ))));
  }
}

