import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/controllers/UserController.dart';
import 'package:mood_app/controllers/LoginController.dart';
import 'package:mood_app/models/User.dart';
import 'package:mood_app/util/UtilDialog.dart';
import 'package:mood_app/widgets/CustomIconButton.dart';
import 'package:mood_app/widgets/StandardButton.dart';
import 'package:mood_app/widgets/PasswordTextField.dart';
import 'package:mood_app/widgets/StandardTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController _loginController = GetIt.I.get<LoginController>();
  UserController _userController = GetIt.I.get<UserController>();
  User _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.teal[50],
              Colors.teal[100],
            ])),
            height: MediaQuery.of(context).size.height +
                (MediaQuery.of(context).padding.top),
            padding: EdgeInsets.fromLTRB(55.0, 0.0, 55.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Log in or create an account",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StandardTextField(
                                  prefix: Icon(
                                    Icons.alternate_email,
                                  ),
                                  hintText: "Email",
                                  onChanged: (text) {
                                    _user.email = text;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Observer(
                                  builder: (_) => PasswordTextField(
                                      suffix: CustomIconButton(
                                        radius: 32,
                                        iconData: _loginController.obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        onTap: () {
                                          _loginController.changeVisibility();
                                        },
                                      ),
                                      prefix: Icon(Icons.lock),
                                      hintText: "Password",
                                      obscureText: _loginController.obscureText,
                                      onChanged: (text) {
                                        _user.password = text;
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StandardButton(
                                  color: Colors.teal[400],
                                  title: "Login",
                                  onPressed: () {
                                    _userController.loginUser(_user,
                                        success: () {
                                      Navigator.pushReplacementNamed(
                                          context, "/homeScreen");
                                    }, error: (message) {
                                      UtilDialog.showInfo(context,
                                          title: "Ops", message: message);
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Divider(
                                      thickness: 1,
                                    )),
                                    Text(
                                      "Or",
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Expanded(
                                        child: Divider(
                                      thickness: 1,
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                StandardButton(
                                  color: Colors.teal[400],
                                  title: "Sign up",
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, "/signUpScreen");
                                  },
                                ),
                              ]),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
