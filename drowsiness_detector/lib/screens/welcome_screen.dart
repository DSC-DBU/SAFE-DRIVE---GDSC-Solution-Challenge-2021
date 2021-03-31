import 'package:drowsiness_detector/services/responsive_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class WelcomeScreen extends StatelessWidget {
  static const id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: ResponsiveHelper(
          mobile: portraitWelcomePage(),
          tab: landscapeWelcomePage(),
        )
      ),
    );
  }
}
