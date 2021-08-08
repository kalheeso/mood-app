import 'package:mobx/mobx.dart';
part 'LoginController.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  bool obscureText = true;
  @action
  void changeVisibility() {
    obscureText = !obscureText;
  }
 
}
