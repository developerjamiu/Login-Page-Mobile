import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/constants.dart';
import '../widgets/custom_flat_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String emailAddress;

  void forgotPassword() => scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Coming Soon...'),
          behavior: SnackBarBehavior.floating,
        ),
      );

  void login() {
    FocusScope.of(context).unfocus();

    if (formKey.currentState.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeScreen(emailAddress: emailAddress),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Hero(
                  tag: 'Image',
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      'assets/login.png',
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: kGreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CustomTextField(
                        label: 'Email Address',
                        hintText: 'example@gmail.com',
                        validator: validateEmail,
                        onChanged: (val) => emailAddress = val,
                      ),
                      kSmallHorizontalSpacing,
                      CustomTextField(
                        label: 'Passwword',
                        hintText: 'password',
                        validator: validatePassword,
                        obscureText: true,
                      ),
                      kSmallHorizontalSpacing,
                      GestureDetector(
                        onTap: forgotPassword,
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      kBigHorizontalSpacing,
                      CustomFlatButton(
                        color: kPinkColor,
                        onPressed: login,
                        text: Text('Log In'),
                        textColor: Colors.white,
                      ),
                      kSmallHorizontalSpacing,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String validateEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String validatePassword(String value) =>
      value.length < 6 ? 'Password should be more than 5 Characters' : null;
}
