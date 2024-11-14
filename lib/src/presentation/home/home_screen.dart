import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/home/widget/home_card.dart';

import 'package:movie_app/src/presentation/widget/main_title.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
                    // print(direction);
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }

                    return true;
                  },
                  child: Stack(
                    children: [

                  ListView(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 600,
                            decoration:  const BoxDecoration(
                                color: Colors.amberAccent,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg",
                                    ))),
                            // child: ,
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Column(
                                        children: [
                                          Icon(Icons.add),
                                          Text("MyList")
                                        ],
                                      ),
                                      TextButton.icon(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        onPressed: () {},
                                        label: const Text('play'),
                                        icon: const Icon(
                                          Icons.play_arrow_outlined,
                                          size: 30,
                                        ),
                                      ),
                                      const Column(
                                        children: [
                                          Icon(Icons.info_outline),
                                          Text("Info")
                                        ],
                                      ),
                                    ],
                                  )))
                        ],
                      ),
                      const MainTitle(title: "Released in Past Year"),
                      kheight,
                      LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: List.generate(
                                  10, (index) => const HomeMainCard()))),
                      kheight20,
                      const MainTitle(title: "Trending Now"),
                      kheight,
                      LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: List.generate(
                                  10, (index) => const HomeMainCard()))),
                      kheight20,
                      const MainTitle(title: "Tense & Drama"),
                      kheight,
                      LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: List.generate(
                                  10, (index) => const HomeMainCard()))),
                      kheight20,
                      const MainTitle(title: "South INdian Moview"),
                      kheight,
                      LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: List.generate(
                                  10, (index) => const HomeMainCard()))),
                      kheight20,
                      const MainTitle(title: "TOp10 movie"),
                      kheight,
                      LimitedBox(
                          maxHeight: 200,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: List.generate(
                                  10,
                                  (index) => HomeMainCardTwo(
                                        index: index,
                                      )))),
                    ],
                  ),
                      scrollNotifier.value ==true ? AnimatedContainer(
                        duration: const Duration(milliseconds: 1200),
                        width: double.infinity,
                        height: 80,
                        color: Colors.black.withOpacity(0.3),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.logo_dev,size: 50,color: Colors.white,),
                                Spacer(),
                                Icon(Icons.logo_dev,size: 50,color: Colors.white,),
                                Icon(Icons.logo_dev,size: 50,color: Colors.white,),

                              ],
                            ),Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("tv shows",style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold
                                ),),
                                Text("movies",style: TextStyle(
                                    fontSize: 16,fontWeight: FontWeight.bold
                                )),
                                Text("categories",style: TextStyle(
                                    fontSize: 16,fontWeight: FontWeight.bold
                                )),
                              ],
                            )
                            
                          ],
                        ),
                      ):kheight,
                    ]));
            }));
  }
}
