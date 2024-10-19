import 'package:flutter/material.dart';
import 'package:movie_app/src/core/colors/colors.dart';
import 'package:movie_app/src/presentation/downloads/download_page.dart';
import 'package:movie_app/src/presentation/first_laugh/first_laugh_screen.dart';
import 'package:movie_app/src/presentation/home/home_screen.dart';
import 'package:movie_app/src/presentation/new_hot/new_hot_screen.dart';
import 'package:movie_app/src/presentation/search/search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
int _selectedIndex = 0;

class _MainPageState extends State<MainPage> {



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [
    HomeScreen(),
    NewHotScreen(),
    FirstLaughScreen(),
    SearchScreen(),
    DownloadPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                            currentIndex: _selectedIndex,
              elevation: 1,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              unselectedIconTheme: const IconThemeData(
                color: Colors.grey,
              ),
              backgroundColor: backgroundColor,

              selectedIconTheme: const IconThemeData(color: Colors.white),
              selectedItemColor: Colors.white,
              onTap: _onItemTapped,

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: "New & Hot"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: "First Laugh"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.arrow_circle_down_rounded),
                    label: "Downloads"),
              ],

            ),            body: screens[_selectedIndex],

        )
    );
  }
}
