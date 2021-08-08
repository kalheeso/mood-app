import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_app/controllers/UserController.dart';
import 'package:mood_app/models/User.dart';
import 'package:mood_app/screens/AddMoodScreen.dart';
import 'package:mood_app/screens/FeedScreen.dart';
import 'package:mood_app/screens/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserController _userController = GetIt.I.get<UserController>();
  int _currentIndex = 0;
  List<Widget> screens = [
    FeedScreen(),
    ProfileScreen(),
    AddMoodScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_userController.loggedUser.name}'s diary"),
        backgroundColor: Colors.teal[200],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.teal[600],
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Diary',
                icon: Icon(Icons.book_outlined)),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Profile',
                icon: Icon(Icons.person_outline_rounded)),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                label: 'Add',
                icon: Icon(Icons.add)),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: screens[_currentIndex],
      ),
    );
  }
}
