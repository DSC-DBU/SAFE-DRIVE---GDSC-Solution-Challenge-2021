import 'package:drowsiness_detector/constants.dart';
import 'package:drowsiness_detector/custom_paints/authentication_painter.dart';
import 'package:drowsiness_detector/screens/authentication%20screens/registration_screen.dart';
import 'package:drowsiness_detector/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'authentication_screen.dart';
import 'package:drowsiness_detector/screens/authentication screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  bool showSpinner = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: CustomPaint(
            painter: RegisterPainter(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: ModalProgressHUD(
                  inAsyncCall: showSpinner,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome to',
                        style: kTitleTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Lato'),
                      ),
                      Text(
                        'SafeDrive',
                        style: kTitleTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Raleway-Regular'),
                      ),
                      SizedBox(height: height * 0.2),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: kInputDecorationStyle.copyWith(
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email, color: kOrangeColor.shade400),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter a valid email' : null,
                        onChanged: (val) {
                          setState(() {
                            _email = val;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: kInputDecorationStyle.copyWith(
                          hintText: 'Enter your password',
                          prefixIcon: Icon(Icons.lock, color: kOrangeColor.shade400),
                        ),
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            _password = val;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.05),
                      Buttons(
                        text: 'Sign in',
                        onPress: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if (_formKey.currentState.validate()) {
                            try {
                              final user =
                                  await auth.signInWithEmailAndPassword(
                                      email: _email, password: _password);
                              if (user != null) {
                                Navigator.pushNamed(context, WelcomeScreen.id);
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          }
                        },
                      ),
                      SizedBox(height: height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Doesn\'t have an account?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegistrationScreen.id);
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color:kOrangeColor.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
