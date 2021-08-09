import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/controllers/MoodController.dart';
import 'package:mood_app/controllers/UserController.dart';
import 'package:mood_app/models/Mood.dart';
import 'package:mood_app/models/User.dart';
import 'package:mood_app/widgets/SmallerButton.dart';
import 'package:mood_app/widgets/StandardButton.dart';
import 'package:mood_app/widgets/StandardTextField.dart';

class UtilDialog {
  MoodController _moodController = GetIt.I.get<MoodController>();

  static void changePassword(BuildContext context, User user) {
    UserController _userController = GetIt.I.get<UserController>();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "New password:",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          StandardTextField(
                            onChanged: (text) {
                              user.password = text;
                            },
                            hintText: 'Insert here',
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SmallerButton(
                                color: Colors.teal[400],
                                title: "Cancel",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SmallerButton(
                                  color: Colors.teal[400],
                                  title: "Confirm",
                                  onPressed: user.password != null &&
                                          user.password.isNotEmpty &&
                                          user.password != " "
                                      ? () {
                                          _userController.editUser(user,
                                              success: () {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    "/loginScreen",
                                                    (Route<dynamic> route) =>
                                                        false);
                                          }, error: (msg) {
                                            showInfo(context,
                                                title: "Ops",
                                                message: "I'm a fraud");
                                          });
                                        }
                                      : () {
                                          Fluttertoast.showToast(
                                              msg:
                                                  "Please, insert a valid password",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 10);
                                        })
                            ],
                          )
                        ],
                      ))));
        });
  }

  static void showInfo(
    BuildContext context, {
    String title,
    String message,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$title",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            "$message",
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          StandardButton(
                            color: Colors.teal[400],
                            title: "OK",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ))));
        });
  }

  static void editMood(
    BuildContext context,
    Mood mood, {
    String title,
    String message,
  }) {
    TextEditingController _textFieldController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Editing",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunitoSans(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          StandardTextField(
                            hintText: "Insert here",
                            minLines: 1,
                            maxLines: 3,
                            onChanged: (text) {
                              mood.note = text;
                            },
                            textEditingController: _textFieldController,
                          ),
                          
                        ],
                      ))));
        });
  }

  static void logoutDialog(
    BuildContext context, {
    String title,
    String message,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "$message",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SmallerButton(
                                color: Colors.teal[400],
                                title: "Cancel",
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SmallerButton(
                                color: Colors.teal[400],
                                title: "OK",
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "/loginScreen",
                                      (Route<dynamic> route) => false);
                                },
                              )
                            ],
                          ),
                        ],
                      ))));
        });
  }

  static void showLoading(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
              child: Card(
                  margin: EdgeInsets.all(24.0),
                  child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green[300],
                      ))));
        });
  }
}
