import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/mainpage/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
              // bodyLarge:TextStyle(color: Colors.white)

              )),
      home:  MainPage(),
    );
  }
}
