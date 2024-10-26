import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/mainpage/main_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey,
          textTheme:  TextTheme(

              )),
      home:  MainPage(),
    );
  }
}
