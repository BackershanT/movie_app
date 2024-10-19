// import 'package:flutter/material.dart';
// import 'package:movie_app/src/core/colors/colors.dart';
//
// ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);
//
// class BottomNavWidget extends StatelessWidget {
//   const BottomNavWidget ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: indexChangeNotifier,
//       builder: (context, int newIndex, _) {
//         return BottomNavigationBar(
//           items:  [
//             const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             const BottomNavigationBarItem(
//                 icon: Icon(Icons.collections), label: "New & Hot"),
//             const BottomNavigationBarItem(
//                 icon: Icon(Icons.emoji_emotions), label: "First Laugh"),
//             const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
//             const BottomNavigationBarItem(
//                 icon: Icon(Icons.arrow_circle_down_rounded),
//                 label: "Downloads"),
//           ],
//           backgroundColor: backgroundColor,
//           currentIndex: _selectedIndex,
//           onTap: (index){
//             indexChangeNotifier.value = index;
//           },
//           elevation: 0.5,
//           type: BottomNavigationBarType.fixed,
//           unselectedItemColor: Colors.grey,
//           unselectedIconTheme: const IconThemeData(
//             color: Colors.grey,
//           ),
//           selectedIconTheme: const IconThemeData(color: Colors.white),
//           selectedItemColor: Colors.white,
//
//         );
//       },
//     );
//   }
// }

