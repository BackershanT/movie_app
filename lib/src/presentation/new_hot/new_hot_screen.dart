import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/new_hot/widgets/comingSoon.dart';
import 'package:movie_app/src/presentation/new_hot/widgets/everyone%20watchin.dart';
import 'package:movie_app/src/presentation/widget/app_bar_widget.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: AppBar(
                  title: const Text("New & HOT",
                      style: TextStyle(
                          // GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                  actions: [
                    const Icon(
                      Icons.cast,
                      size: 30,
                    ),
                    kWidth,
                    Container(
                      color: Colors.blue,
                      height: 30,
                      width: 30,
                    ),
                    kWidth,
                  ],
                  bottom: TabBar(
                      labelStyle:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      labelColor: Colors.black,
                      isScrollable: true,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      tabs: [
                        const Tab(
                          text: ":)coming soon",
                        ),
                        const Tab(
                          text: ":)Everyone watching",
                        ),
                      ]),
                )),
            body: TabBarView(children: [
              _buildComingSoon(),
              _buildEveryoneWatching(),
            ])));
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const ComingsoonWidget(),
      // shrinkWrap: true,
      // children: [
      //   ComingsoonWidget()
      // ],
    );
  }

  Widget _buildEveryoneWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const EveryoneWatchingWidget(),
      // shrinkWrap: true,
      // children: [
      //   ComingsoonWidget()
      // ],
    );
  }
}
