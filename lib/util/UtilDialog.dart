import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/widgets/LogoutButton.dart';
import 'package:mood_app/widgets/StandardButton.dart';

class UtilDialog {
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
