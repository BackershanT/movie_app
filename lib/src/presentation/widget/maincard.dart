import 'package:flutter/material.dart';
const imageUrl =    "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg";

class Maincard extends StatelessWidget {
  const Maincard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        image: const DecorationImage(image: NetworkImage(imageUrl),),
    borderRadius: BorderRadius.circular(10)
      ),

    );
  }
}
