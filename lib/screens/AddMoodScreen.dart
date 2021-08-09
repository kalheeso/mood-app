import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/controllers/MoodController.dart';
import 'package:mood_app/controllers/UserController.dart';
import 'package:mood_app/models/Mood.dart';
import 'package:mood_app/util/UtilDialog.dart';
import 'package:mood_app/widgets/StandardButton.dart';
import 'package:mood_app/widgets/StandardTextField.dart';

class AddMoodScreen extends StatefulWidget {
  AddMoodScreen({Key key}) : super(key: key);
  @override
  _AddMoodScreenState createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  UserController _userController = GetIt.I.get<UserController>();
  MoodController _moodController = GetIt.I.get<MoodController>();
  TextEditingController _textFieldController = TextEditingController();

  String _msgForSuccess;

  Mood moodPost = Mood();

  bool moodSelected = false;
  bool noteFilled = false;

  bool ableToPost() {
    return moodSelected && noteFilled;
  }

  bool emoji1Color = false;
  bool emoji2Color = false;
  bool emoji3Color = false;
  bool emoji4Color = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            shadowColor: Colors.teal[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  Container(
                    width: 500,
                    child: StandardTextField(
                        minLines: 1,
                        maxLines: 3,
                        textEditingController: _textFieldController,
                        hintText: "What's going on?",
                        onChanged: (String text) {
                          text.length > 3
                              ? setState(() {
                                  noteFilled = true;
                                })
                              : noteFilled = false;
                        }),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 27,
                      ),
                      Text(
                        "Select your mood:",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        color: emoji1Color ? Colors.blueGrey[700] : Colors.grey,
                        iconSize: 65,
                        icon: FaIcon(
                          FontAwesomeIcons.sadTear,
                        ),
                        onPressed: () {
                          setState(() {
                            emoji1Color = true;
                            emoji2Color = false;
                            emoji3Color = false;
                            emoji4Color = false;
                            moodSelected = true;
                            moodPost?.mood = "Sad";
                            _msgForSuccess = "Is anyone really happy?";
                          });
                        },
                      ),
                      IconButton(
                        color: emoji2Color ? Colors.orange[700] : Colors.grey,
                        iconSize: 65,
                        icon: FaIcon(FontAwesomeIcons.meh),
                        onPressed: () {
                          setState(() {
                            emoji1Color = false;
                            emoji2Color = true;
                            emoji3Color = false;
                            emoji4Color = false;
                            moodSelected = true;
                            moodPost?.mood = "Ordinary";
                            _msgForSuccess = "We all get bored sometimes";
                          });
                        },
                      ),
                      IconButton(
                        color: emoji3Color ? Colors.amber[400] : Colors.grey,
                        iconSize: 65,
                        icon: FaIcon(FontAwesomeIcons.grinAlt),
                        onPressed: () {
                          setState(() {
                            emoji1Color = false;
                            emoji2Color = false;
                            emoji3Color = true;
                            emoji4Color = false;
                            moodSelected = true;
                            moodPost?.mood = "Happy";
                            _msgForSuccess = "Enjoy happiness while it lasts";
                          });
                        },
                      ),
                      IconButton(
                        color: emoji4Color ? Colors.red[900] : Colors.grey,
                        iconSize: 65,
                        icon: FaIcon(FontAwesomeIcons.angry),
                        onPressed: () {
                          setState(() {
                            emoji1Color = false;
                            emoji2Color = false;
                            emoji3Color = false;
                            emoji4Color = true;
                            moodSelected = true;
                            moodPost?.mood = "Angry";
                            _msgForSuccess = "Chill out bro";
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                        height: 30.0,
                        width: 80.0,
                        child: StandardButton(
                            color: Colors.teal[400],
                            onPressed: () {
                              if (moodSelected && noteFilled) {
                                DateTime now = new DateTime.now();
                                DateTime date =
                                    new DateTime(now.year, now.month, now.day);
                                moodPost.date = date;
                                moodPost.note = _textFieldController.text;
                                moodPost.idCreator =
                                    _userController.loggedUser.id;
                                _moodController.postEditMood(moodPost,
                                    success: () {
                                  setState(() {
                                    _textFieldController.text = "";
                                    emoji1Color = false;
                                    emoji2Color = false;
                                    emoji3Color = false;
                                    emoji4Color = false;
                                    moodSelected = false;
                                  });
                                  UtilDialog.showInfo(context,
                                      title: "Sent", message: _msgForSuccess);
                                }, error: (msg) {
                                  UtilDialog.showInfo(context, title: "Error");
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please, insert valid values for the fields",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 10);
                              }
                            },
                            title: "Send"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
