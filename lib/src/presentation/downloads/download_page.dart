

import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/downloads/widgets/download_images.dart';
import 'package:movie_app/src/presentation/widget/app_bar_widget.dart';

class DownloadPage extends StatelessWidget {
  DownloadPage({super.key});
  final List ImageList = [
    "https://images-cdn.ubuy.ae/634fa5a3884d9347417c7d33-movie-poster-action-fantasy-movie-shadow.jpg",
    "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg",
    "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: "Downloads",
              ),
            ),
            body: ListView(
              children: [
                const Row(
                  children: [
                    kWidth,
                    Icon(Icons.settings_outlined),
                    kWidth,
                    Text(
                      "Smart Downloads",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const Text("Indrocing Downloads For you"),
                const Text(
                    "We will Download a Personalized selection of movies and shows for you . so there is always for  you"),
                Container(
                  width: size.width,
                  height: size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                          child: CircleAvatar(
                        radius: size.width * 0.40,
                      )),
                      DownloadImages(
                        imageList: ImageList[0],
                        angle: 20,
                        margin: const EdgeInsets.only(left: 130, bottom: 50),
                        size: Size(size.width * 0.4, size.height * 0.27),
                      ),
                      DownloadImages(
                        imageList: ImageList[1],
                        angle: -20,
                        margin: const EdgeInsets.only(right: 130, bottom: 50),
                        size: Size(size.width * 0.4, size.height * 0.27),
                      ),
                      DownloadImages(
                        imageList: ImageList[2],
                        angle: 0,
                        margin: const EdgeInsets.only(bottom: 10),
                        size: Size(size.width * 0.4, size.height * 0.27),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: const Text('Setup'),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: const Text('See what you can download'),
                )
              ],
            )));
  }
}
