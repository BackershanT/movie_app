import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style:TextStyle(
          // GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 30
          )
        ),
        Spacer(),
        Icon(Icons.cast,size: 30,),
        kWidth,
        Container(
          color: Colors.blue,
          height: 30,
          width: 30,
        ),
        kWidth
      ],
    );
  }
}
