import 'package:drowsiness_detector/screens/authentication%20screens/authentication_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  static const id = 'wrapper';
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    return AuthenticationScreen();
  }
}
