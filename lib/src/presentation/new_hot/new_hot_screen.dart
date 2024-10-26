import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/widget/app_bar_widget.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:
      Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              title: Text(
                "New & HOT",
                style:TextStyle(
                  // GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                )
            ),
              actions: [
                Icon(Icons.cast,size: 30,),
                kWidth,
                Container(
                  color: Colors.blue,
                  height: 30,
                  width: 30,
                ),
                kWidth,

              ],
              bottom: TabBar(labelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
labelColor: Colors.black,
                isScrollable: true,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white

                ),
                  tabs: [
                Tab(text: ":)coming soon",),
                Tab(text: ":)Everyone watching",),
              ]),

            )),
      body: TabBarView(children: [
        _buildTabBarView('Coming soon'),
        _buildTabBarView('Everyone watching'),
      ]
      )
      ) );
  }
  _buildTabBarView(String name){
    return Center(child: Text(name),);
  }

}
