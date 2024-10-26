import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/search/widget/search_idle.dart';

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth =MediaQuery.of(context).size.width;
    return  Row(
      children: [
        Container(
          height:65 ,width: screenWidth*0.35,
          decoration: BoxDecoration(

            image: DecorationImage(
                fit:BoxFit.cover,
                image: NetworkImage(imageUrl))
          ),
        ),
        Expanded(child:
        Text("moviename",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
        Icon(CupertinoIcons.play_circle,size: 50,)
      ],
    );
  }
}
