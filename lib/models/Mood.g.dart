// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Mood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mood _$MoodFromJson(Map<String, dynamic> json) {
  return Mood(
    idCreator: json['idCreator'] as String,
    id: json['id'] as String,
    note: json['note'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    mood: json['mood'] as String,
    creator: json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoodToJson(Mood instance) => <String, dynamic>{
      'creator': instance.creator,
      'idCreator': instance.idCreator,
      'id': instance.id,
      'note': instance.note,
      'date': instance.date?.toIso8601String(),
      'mood': instance.mood,
    };
