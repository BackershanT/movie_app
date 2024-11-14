import 'package:flutter/material.dart';
import 'package:movie_app/src/app.dart';
import 'package:movie_app/src/domain/core/di/injectable.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await  configureInjection();
  runApp(const MyApp());
}

