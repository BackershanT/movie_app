import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/downloads/download_page.dart';
import 'package:movie_app/src/presentation/first_laugh/first_laugh_screen.dart';
import 'package:movie_app/src/presentation/home/home_screen.dart';
import 'package:movie_app/src/presentation/mainpage/widgets/bottom_nav_page.dart';
import 'package:movie_app/src/presentation/new_hot/new_hot_screen.dart';
import 'package:movie_app/src/presentation/search/search_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final _pages = [
    const HomeScreen(),
    const NewHotScreen(),

    const FirstLaughScreen(),
     SearchScreen(),

    const DownloadPage(),

    // FirstLaughScreen(),
    // SearchScreen(),
    // DownloadPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          // print(_pages);
          // print(index);print(_pages[index]);

          return _pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavWidgets(),
    );
  }
}
