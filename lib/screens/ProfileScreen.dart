import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/controllers/UserController.dart';
import 'package:mood_app/util/UtilDialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserController _userController = GetIt.I.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal[100],
                Colors.teal[50],
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.5, 0.9],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    minRadius: 60.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${_userController.loggedUser.name}",
                style: GoogleFonts.nunitoSans(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.teal[500],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("${_userController.loggedUser.email}",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.teal[500],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("${_userController.loggedUser.name}",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 0, 12),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.powerOff,
                      size: 22,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          UtilDialog.logoutDialog(context,
                              message: "Are you sure you want to quit?");
                        },
                        child: Text(
                          "Logout",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 0, 0),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.edit,
                      size: 22,
                      color: Colors.grey[500],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        onPressed: () {
                          UtilDialog.changePassword(
                              context, _userController.loggedUser);
                        },
                        child: Text(
                          "Change password",
                          style: GoogleFonts.nunitoSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ))
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
