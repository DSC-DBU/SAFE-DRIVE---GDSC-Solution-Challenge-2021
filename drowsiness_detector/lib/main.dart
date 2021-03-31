import 'package:drowsiness_detector/screens/authentication%20screens/login_screen.dart';
import 'package:drowsiness_detector/screens/authentication%20screens/registration_screen.dart';
import 'package:drowsiness_detector/screens/report_screen.dart';
import 'package:drowsiness_detector/screens/welcome_screen.dart';
import 'package:drowsiness_detector/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DrowsinessDetector());
}

class DrowsinessDetector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      initialRoute: Wrapper.id,
        routes:{
          Wrapper.id : (context) => Wrapper(),
          WelcomeScreen.id : (context) => WelcomeScreen(),
          ReportTiles.id : (context) => ReportTiles(),
          LoginScreen.id : (context) => LoginScreen(),
          RegistrationScreen.id : (context) => RegistrationScreen(),
        }
    );
  }
}

