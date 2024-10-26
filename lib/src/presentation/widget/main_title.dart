import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  final String title;
  const MainTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),child:
      Text(title,style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold
    ),));
  }
}
