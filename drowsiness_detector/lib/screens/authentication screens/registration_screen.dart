import 'package:drowsiness_detector/custom_paints/authentication_painter.dart';
import 'package:drowsiness_detector/screens/authentication%20screens/login_screen.dart';
import 'package:drowsiness_detector/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'authentication_screen.dart';

final auth = FirebaseAuth.instance;
class RegistrationScreen extends StatefulWidget {
  static const id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email, _password, _name;
  bool showSpinner = false;
  TextEditingController _pass = TextEditingController();
  TextEditingController _conPass = TextEditingController();
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
                      SizedBox(height: height * 0.15),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: kInputDecorationStyle.copyWith(
                          hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.person, color: kOrangeColor.shade400),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter your name' : null,
                        onChanged: (val) {
                          setState(() {
                            _name = val;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: kInputDecorationStyle.copyWith(
                          hintText: 'Enter an email',
                          prefixIcon: Icon(Icons.email, color: kOrangeColor.shade400),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            _email = val;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _pass,
                        decoration: kInputDecorationStyle.copyWith(
                          hintText: 'Enter a password',
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
                      SizedBox(height: height * 0.03),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _conPass,
                        decoration: kInputDecorationStyle.copyWith(
                          hintText: 'Confirm your password',
                          prefixIcon: Icon(Icons.lock, color: kOrangeColor.shade400),
                        ),
                        obscureText: true,
                        validator: (val) => _pass.text != _conPass.text
                            ? 'Password doesn\'t match'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            _password = val;
                          });
                        },
                      ),
                      SizedBox(height: height * 0.05),
                      Buttons(
                        text: 'Register',
                        onPress: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if (_formKey.currentState.validate()) {
                            try {
                              final newUser =
                                  await auth.createUserWithEmailAndPassword(
                                      email: _email, password: _password);
                              //  await getCurrentUser();
                              if (newUser != null) {
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
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.deepOrange.shade400,
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
