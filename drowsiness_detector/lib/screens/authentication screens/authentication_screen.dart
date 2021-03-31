import 'package:drowsiness_detector/constants.dart';
import 'package:drowsiness_detector/screens/authentication%20screens/login_screen.dart';
import 'package:drowsiness_detector/screens/authentication%20screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../welcome_screen.dart';


class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }

}