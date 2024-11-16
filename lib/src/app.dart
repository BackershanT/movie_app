import 'package:flutter/material.dart';
import 'package:movie_app/src/application/downloads/downloads_bloc.dart';
import 'package:movie_app/src/application/search/search_bloc.dart';
import 'package:movie_app/src/domain/core/di/injectable.dart';
import 'package:movie_app/src/presentation/mainpage/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
          BlocProvider(create: (ctx) => getIt<SearchBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.grey,
              textTheme: const TextTheme()),
          home: MainPage(),
        ));
  }
}
