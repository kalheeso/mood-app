import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_app/controllers/LoginController.dart';
import 'package:mood_app/screens/AddMoodScreen.dart';
import 'package:mood_app/screens/FeedScreen.dart';
import 'package:mood_app/screens/HomeScreen.dart';
import 'package:mood_app/screens/LoginScreen.dart';
import 'package:mood_app/screens/ProfileScreen.dart';
import 'package:mood_app/screens/SignUpScreen.dart';
import 'package:mood_app/screens/SplashScreen.dart';
import 'package:mood_app/services/MoodAppService.dart';

import 'controllers/MoodController.dart';
import 'controllers/UserController.dart';

final getIt = GetIt.instance;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(MoodAppService(Dio()));
  getIt.registerSingleton(UserController());
  getIt.registerSingleton(MoodController());
  getIt.registerSingleton(LoginController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App do Matheus',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/splashScreen",
      routes: {
        "/splashScreen": (_) => SplashScreen(),
        "/homeScreen": (_) => HomeScreen(),
        "/loginScreen": (_) => LoginScreen(),
        "/feedScreen": (_) => FeedScreen(),
        "/addMoodScreen": (_) => AddMoodScreen(),
        "/signUpScreen": (_) => SignUpScreen(),
        "/profileScreen": (_) => ProfileScreen()
      },
    );
  }
}
