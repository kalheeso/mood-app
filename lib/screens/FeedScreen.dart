import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/controllers/MoodController.dart';
import 'package:mood_app/enums/Status.dart';
import 'package:mood_app/util/UtilDate.dart';
import 'package:mood_app/util/UtilDialog.dart';
import 'package:mood_app/widgets/SmallerButton.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  MoodController _moodController = GetIt.I.get<MoodController>();

  @override
  void initState() {
    _moodController.loadMoods(success: () {
      _refreshController.refreshCompleted();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: SmartRefresher(
          header: MaterialClassicHeader(
            color: Colors.teal[200],
          ),
          onRefresh: () {
            _moodController.loadMoods(success: () {
              _refreshController.refreshCompleted();
            });
          },
          controller: _refreshController,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Observer(builder: (_) {
                    switch (_moodController.consultStatusMood) {
                      case ConsultStatus.LOADING:
                        return Container(
                          height: 0.0,
                          width: 0.0,
                        );
                      case ConsultStatus.SUCCESS:
                        if (_moodController.moods.length == 0) {
                          return Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 2.6),
                            child: Center(
                              child: Text("Add a mood to check your diary",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500)),
                            ),
                          );
                        }
                        return Column(children: [
                          ListView.builder(
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var mood = _moodController.moods[index];
                              return Card(
                                  elevation: 4,
                                  shadowColor: Colors.teal[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Wrap(
                                      spacing: 15,
                                      runSpacing: 15,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Observer(builder: (_) {
                                                    switch (mood.mood) {
                                                      case "Sad":
                                                        return FaIcon(
                                                          FontAwesomeIcons
                                                              .sadTear,
                                                          size: 50,
                                                          color: Colors
                                                              .blueGrey[700],
                                                        );
                                                        break;
                                                      case "Angry":
                                                        return FaIcon(
                                                          FontAwesomeIcons
                                                              .angry,
                                                          size: 50,
                                                          color:
                                                              Colors.red[900],
                                                        );
                                                        break;
                                                      case "Happy":
                                                        return FaIcon(
                                                          FontAwesomeIcons
                                                              .grinAlt,
                                                          size: 50,
                                                          color:
                                                              Colors.amber[400],
                                                        );
                                                        break;
                                                      case "Ordinary":
                                                        return FaIcon(
                                                          FontAwesomeIcons.meh,
                                                          size: 50,
                                                          color: Colors
                                                              .orange[700],
                                                        );
                                                        break;
                                                      default:
                                                        return Container();
                                                    }
                                                  }),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            12,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${mood.note}",
                                                          style: GoogleFonts
                                                              .nunitoSans(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    /*  IconButton(
                                                        icon: FaIcon(
                                                          FontAwesomeIcons.pen,
                                                          size: 14,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                        onPressed: () {
                                                           UtilDialog.editMood(context, mood);
                                                        }),*/
                                                    IconButton(
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .trash,
                                                          size: 14,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                        onPressed: () {
                                                          showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Center(
                                                                    child: Card(
                                                                        margin:
                                                                            EdgeInsets.all(24.0),
                                                                        child: Padding(
                                                                            padding: EdgeInsets.all(16.0),
                                                                            child: Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Text(
                                                                                  "Are you sure you want to delete?",
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
                                                                                        _moodController.deleteMood(mood, success: () {
                                                                                          Navigator.pop(context);
                                                                                        });
                                                                                      },
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ))));
                                                              });
                                                        }),
                                                    Text(
                                                      UtilDate.convertDateTime(
                                                          mood.date),
                                                      style: GoogleFonts
                                                          .nunitoSans(
                                                              color: Colors
                                                                  .grey[600],
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                            },
                            itemCount: _moodController.moods.length,
                            shrinkWrap: true,
                          )
                        ]);
                      case ConsultStatus.ERROR:
                        return Text("Ops");
                    }
                  }),
                ],
              )),
        ),
      ),
    );
  }
}
