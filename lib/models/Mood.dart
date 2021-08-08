import 'package:json_annotation/json_annotation.dart';
import 'package:mood_app/models/User.dart';

part 'Mood.g.dart';

@JsonSerializable()
class Mood {
  User creator;
  String idCreator;
  String id, note;
  DateTime date;
  String mood;

  Mood({this.idCreator, this.id, this.note, this.date, this.mood, this.creator});

  factory Mood.fromJson(Map<String, dynamic> json) => _$MoodFromJson(json);
  Map<String, dynamic> toJson() => _$MoodToJson(this);
}
