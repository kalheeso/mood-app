import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mood_app/models/User.dart';
import 'package:mood_app/services/MoodAppService.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'UserController.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  BuildContext context;
  User loggedUser = User();
  MoodAppService service = GetIt.I.get<MoodAppService>();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @observable
  String email = "";
  @action
  void setEmail(value) => this.email = value;

  @observable
  String password = "";
  @action
  void setPassword(value) => this.password = value;

  @observable
  String name = "";
  @action
  void setName(value) => this.name = value;

  @computed
  bool get isRegisterValid =>
      email.contains("mail.com") &&
      email.contains("@") &&
      password.length > 2 &&
      !password.contains(" ") &&
      name.length > 2;

  void deleteFromPrefs() {
    _prefs.then((db) {
      db.remove("user");
    });
  }

  void userExists({Function() exists, Function() doesntExist}) {
    _prefs.then((db) {
      String jsonUser = db.getString("user");
      if (jsonUser != null) {
        loggedUser = User.fromJson(JsonCodec().decode(jsonUser));
        exists?.call();
      } else {
        doesntExist?.call();
      }
    });
  }

  void loginUser(User user, {Function() success, Function(String msg) error}) {
    if ((user.email?.isEmpty ?? true) || (user.password?.isEmpty ?? true)) {
      error?.call("Invalid password or email");
    } else {
      service.loginUser(user).then((user) {
        _prefs.then((db) {
          loggedUser = user.sucesso;
          db.setString("user", JsonCodec().encode(user.sucesso.toJson()));
          success?.call();
        });
      }).catchError((onError) {
        error?.call(onError.response.data["falha"]);
      });
    }
  }

  void registerUser(User user,
      {Function() success, Function(String msg) error}) {
    if (user.email?.isEmpty ?? true) {
      error?.call("Invalid email");
    } else if (user.name?.isEmpty ?? true) {
      error?.call("Invalid name");
    } else if (user.password?.isEmpty ?? true) {
      error?.call("Invalid password");
    } else {
      service.registerUser(user).then((userReturn) {
        loggedUser.id = userReturn.sucesso.id;
        _prefs.then((db) {
          db.setString("user", JsonCodec().encode(userReturn.toJson()));
          user = userReturn.sucesso;
          success?.call();
        });
      }).catchError((onError) {
        error?.call(onError.response.data["falha"]);
      });
    }
  }
}
