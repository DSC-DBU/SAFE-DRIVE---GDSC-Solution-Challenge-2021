import 'package:drowsiness_detector/screens/authentication%20screens/login_screen.dart';
import 'package:drowsiness_detector/screens/report_screen.dart';
import 'package:drowsiness_detector/screens/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'custom_paints/green_painter.dart';
import 'custom_paints/green_painter_Landscape.dart';

//The widget below is used for buttons on the app
class Buttons extends StatelessWidget {
  final String text;
  final Function onPress;
  Buttons({@required this.text, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.deepOrange.shade400.withOpacity(0.8),
      onPressed: onPress,
      child: Text(
        text,
        style: kButtonTextStyle,
      ),
    );
  }
}

void signOutDialoge(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text(
      "Sign out",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    content: Text(
      "Are you sure you want to sign out?",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    actions: [
      FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginScreen.id);
        },
        child: Text(
          "Yes",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, WelcomeScreen.id);
        },
        child: Text(
          "No",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
    elevation: 7.0,
    backgroundColor: kOrangeColor.shade400,
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}

//The widget below is for welcome page portarit style
CustomPaint portraitWelcomePage() {
  return CustomPaint(
    painter: GreenPainter(),
    child: SizedBox.expand(
      child: Container(
        child: Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text(
                    'SAFE',
                    textAlign: TextAlign.start,
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'DRIVE',
                    textAlign: TextAlign.start,
                    style: kTitleTextStyle.copyWith(
                      fontSize: 30,
                      fontFamily: 'Lato',
                      color: Colors.white,
                    ),
                  ),
                
                  SizedBox(height: constraints.maxHeight * 0.5),
                  Flexible(
                    child: Buttons(
                      text: 'Active Report',
                      onPress: () {
                        Navigator.pushNamed(context, ReportTiles.id);
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        signOutDialoge(context);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.deepOrange.shade400.withOpacity(0.8),
                        radius: 20,
                        child: Icon(
                          Icons.person,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text("Sign out", style: kButtonTextStyle),
                ],
              );
            }),
          ),
        ),
      ),
    ),
  );
}

//The widget below is for landscape welcome page style
CustomPaint landscapeWelcomePage() {
  return CustomPaint(
    painter: GreenPainterLandscape(),
    child: SizedBox.expand(
      child: Container(
        child: Flexible(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
            child: LayoutBuilder(builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: constraints.maxHeight * 0.15),
                  Text(
                    'SAFE',
                    textAlign: TextAlign.start,
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'DRIVE',
                    textAlign: TextAlign.start,
                    style: kTitleTextStyle.copyWith(
                      fontSize: 40,
                      fontFamily: 'Lato',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.33),
                  Row(
                    children: <Widget>[
                      Buttons(
                        text: 'Active Report',
                        onPress: () {
                          Navigator.pushNamed(context, ReportTiles.id);
                        },
                      ),
                      SizedBox(width: constraints.maxWidth * 0.6),
                      GestureDetector(
                        onTap: () {
                          signOutDialoge(context);
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              Colors.deepOrange.shade400.withOpacity(0.8),
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Text("Sign out", style: kButtonTextStyle),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    ),
  );
}
