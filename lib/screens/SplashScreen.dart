import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_app/controllers/UserController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserController _userController = GetIt.I.get<UserController>();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _userController.userExists(exists: () {
        Navigator.pushReplacementNamed(context, "/homeScreen");
      }, doesntExist: () {
        Navigator.pushReplacementNamed(context, "/loginScreen");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: ClipRRect(
              child: Image.asset(
                "assets/images/applogo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
