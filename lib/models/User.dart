import 'package:json_annotation/json_annotation.dart';

import 'Mood.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  String id, name, email, password;
  List<Mood> moods;

  User({this.id, this.name, this.email, this.password, this.moods});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
