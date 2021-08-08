import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mood_app/enums/Status.dart';
import 'package:mood_app/models/Mood.dart';
import 'package:mood_app/services/MoodAppService.dart';

import 'UserController.dart';
part 'MoodController.g.dart';

class MoodController = _MoodControllerBase with _$MoodController;

abstract class _MoodControllerBase with Store {
  MoodAppService service = GetIt.I.get<MoodAppService>();
  UserController _userController = GetIt.I.get<UserController>();

  @observable
  ObservableList<Mood> moods = ObservableList<Mood>();

  @observable
  Mood mood;

  @observable
  ConsultStatus consultStatus = ConsultStatus.LOADING;

  @observable
  ConsultStatus consultStatusMood = ConsultStatus.LOADING;

  void loadMoods(
      {Function() success,
      Function() loading,
      Function(String message) error}) {
    loading?.call();
    consultStatusMood = ConsultStatus.LOADING;
    service.listMoods(_userController.loggedUser.id).then((responseMoods) {
      moods.clear();
      moods.addAll(responseMoods.sucesso);
      success?.call();
      consultStatusMood = ConsultStatus.SUCCESS;
    }).catchError((onError) {
      consultStatusMood = ConsultStatus.ERROR;
      error?.call(onError.response.data["falha"]);
    });
  }

  void postEditMood(Mood mood,
      {Function() success, Function(String message) error}) {
    consultStatus = ConsultStatus.LOADING;
    service.postEditMood(mood).then((responseMood) {
      consultStatus = ConsultStatus.SUCCESS;
      success?.call();
    }).catchError((onError) {
      consultStatus = ConsultStatus.ERROR;
      error?.call(onError.response.data["falha"]);
    });
  }

  void deleteMood(Mood mood,
      {Function() success, Function(String message) error}) {
    service.deleteMood(mood.id).then((value) {
      moods.removeWhere((value) => value.id == mood.id);
      success?.call();
    }).catchError((onError) {
      error?.call(onError.response.data["falha"]);
    });
  }
}
