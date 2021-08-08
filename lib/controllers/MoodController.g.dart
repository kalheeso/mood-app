// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MoodController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoodController on _MoodControllerBase, Store {
  final _$moodsAtom = Atom(name: '_MoodControllerBase.moods');

  @override
  ObservableList<Mood> get moods {
    _$moodsAtom.reportRead();
    return super.moods;
  }

  @override
  set moods(ObservableList<Mood> value) {
    _$moodsAtom.reportWrite(value, super.moods, () {
      super.moods = value;
    });
  }

  final _$moodAtom = Atom(name: '_MoodControllerBase.mood');

  @override
  Mood get mood {
    _$moodAtom.reportRead();
    return super.mood;
  }

  @override
  set mood(Mood value) {
    _$moodAtom.reportWrite(value, super.mood, () {
      super.mood = value;
    });
  }

  final _$consultStatusAtom = Atom(name: '_MoodControllerBase.consultStatus');

  @override
  ConsultStatus get consultStatus {
    _$consultStatusAtom.reportRead();
    return super.consultStatus;
  }

  @override
  set consultStatus(ConsultStatus value) {
    _$consultStatusAtom.reportWrite(value, super.consultStatus, () {
      super.consultStatus = value;
    });
  }

  final _$consultStatusMoodAtom =
      Atom(name: '_MoodControllerBase.consultStatusMood');

  @override
  ConsultStatus get consultStatusMood {
    _$consultStatusMoodAtom.reportRead();
    return super.consultStatusMood;
  }

  @override
  set consultStatusMood(ConsultStatus value) {
    _$consultStatusMoodAtom.reportWrite(value, super.consultStatusMood, () {
      super.consultStatusMood = value;
    });
  }

  @override
  String toString() {
    return '''
moods: ${moods},
mood: ${mood},
consultStatus: ${consultStatus},
consultStatusMood: ${consultStatusMood}
    ''';
  }
}
