// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReturn _$UserReturnFromJson(Map<String, dynamic> json) {
  return UserReturn(
    sucesso: json['sucesso'] == null
        ? null
        : User.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserReturnToJson(UserReturn instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

MoodReturn _$MoodReturnFromJson(Map<String, dynamic> json) {
  return MoodReturn(
    sucesso: json['sucesso'] == null
        ? null
        : Mood.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoodReturnToJson(MoodReturn instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

ListMoodsReturn _$ListMoodsReturnFromJson(Map<String, dynamic> json) {
  return ListMoodsReturn(
    sucesso: (json['sucesso'] as List)
        ?.map(
            (e) => e == null ? null : Mood.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListMoodsReturnToJson(ListMoodsReturn instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };
