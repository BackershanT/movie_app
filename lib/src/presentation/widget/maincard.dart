import 'package:flutter/material.dart';

class Maincard extends StatelessWidget {
  final String imageUrl;
  const Maincard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
