import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_app/controllers/LoginController.dart';
import 'package:mood_app/controllers/UserController.dart';
import 'package:mood_app/screens/HomeScreen.dart';
import 'package:mood_app/util/UtilDialog.dart';
import 'package:mood_app/widgets/CustomIconButton.dart';
import 'package:mood_app/widgets/StandardButton.dart';
import 'package:mood_app/widgets/PasswordTextField.dart';
import 'package:mood_app/widgets/StandardTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  UserController _userController = GetIt.I.get<UserController>();
  LoginController _loginController = GetIt.I.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.teal[50],
                Colors.teal[100],
              ])),
              height: MediaQuery.of(context).size.height +
                  (MediaQuery.of(context).padding.top),
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 55.0, 18.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                            color: Colors.white,
                            elevation: 30,
                            shadowColor: Colors.teal[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  primaryColor: Colors.teal[400],
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Register now",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Observer(
                                        builder: (_) => StandardTextField(
                                            prefix: Icon(
                                              Icons.person_outline_outlined,
                                            ),
                                            hintText: "Name",
                                            onChanged: _userController.setName),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Observer(
                                          builder: (_) => StandardTextField(
                                                prefix: Icon(
                                                  Icons.alternate_email,
                                                ),
                                                hintText: "Email",
                                                onChanged: (text) {
                                                  _userController
                                                      .setEmail(text);
                                                },
                                              )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Observer(
                                        builder: (_) => PasswordTextField(
                                            suffix: CustomIconButton(
                                              radius: 32,
                                              iconData:
                                                  _loginController.obscureText
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                              onTap: () {
                                                _loginController
                                                    .changeVisibility();
                                              },
                                            ),
                                            prefix: Icon(Icons.lock),
                                            hintText: "Password",
                                            obscureText:
                                                _loginController.obscureText,
                                            onChanged: (text) {
                                              _userController.setPassword(text);
                                            }),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Observer(
                                        builder: (_) => StandardButton(
                                            color: Colors.teal[400],
                                            title: "Sign up",
                                            onPressed: _userController
                                                    .isRegisterValid
                                                ? () {
                                                    _userController
                                                            .loggedUser.name =
                                                        _userController.name;
                                                    _userController.loggedUser
                                                            .password =
                                                        _userController
                                                            .password;
                                                    _userController
                                                            .loggedUser.email =
                                                        _userController.email;
                                                    _userController
                                                        .registerUser(
                                                            _userController
                                                                .loggedUser,
                                                            success: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  HomeScreen(
                                                                    user: _userController
                                                                        .loggedUser,
                                                                  )));
                                                    }, error: (message) {
                                                      UtilDialog.showInfo(
                                                          context,
                                                          title: "Ops!",
                                                          message: message);
                                                    });
                                                  }
                                                : () {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Please, insert valid values for the fields",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.BOTTOM,
                                                        timeInSecForIosWeb: 10);
                                                  }),
                                      ),
                                    ]),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
