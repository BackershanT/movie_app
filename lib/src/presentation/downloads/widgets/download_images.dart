import 'dart:math';

import 'package:flutter/material.dart';

class DownloadImages extends StatelessWidget {
   const DownloadImages({super.key,  required this.imageList, required this.angle, required this.margin, required this.size});
final String imageList;
final double angle;
final EdgeInsets margin;
final Size size;

  @override
  Widget build(BuildContext context) {

    return  Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          margin: margin,
          width: size.width ,
          height: size.height ,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(imageList as String))),
        ));

  }
}
