

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/search/widget/top_search_item_tile.dart';

final imageUrl ="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi1q_XxIbYOrw7UDyuEPT4kHPYx1f2JqWDwg&s";

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const Text("Top Searches,",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
        kheight,
Expanded(child:
        ListView.separated(
          shrinkWrap: true,
            itemBuilder: (ctx, index)=>const TopSearchItemTile(),
            separatorBuilder: (ctx, index)=>kheight20,
            itemCount: 10)
)
      ],
    );
  }
}
