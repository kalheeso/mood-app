import 'package:json_annotation/json_annotation.dart';
import 'package:mood_app/models/Mood.dart';
import 'package:mood_app/models/User.dart';

part 'Return.g.dart';

@JsonSerializable()
class UserReturn {
  User sucesso;

  UserReturn({this.sucesso});

  factory UserReturn.fromJson(Map<String, dynamic> json) =>
      _$UserReturnFromJson(json);
  Map<String, dynamic> toJson() => _$UserReturnToJson(this);
}

@JsonSerializable()
class MoodReturn {
  Mood sucesso;

  MoodReturn({this.sucesso});

  factory MoodReturn.fromJson(Map<String, dynamic> json) =>
      _$MoodReturnFromJson(json);
  Map<String, dynamic> toJson() => _$MoodReturnToJson(this);
}

@JsonSerializable()
class ListMoodsReturn {
  List<Mood> sucesso;

  ListMoodsReturn({this.sucesso});

  factory ListMoodsReturn.fromJson(Map<String, dynamic> json) =>
      _$ListMoodsReturnFromJson(json);
  Map<String, dynamic> toJson() => _$ListMoodsReturnToJson(this);
}


