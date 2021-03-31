import 'package:flutter/material.dart';

//Text Styles section
const kTitleTextStyle = TextStyle(
  fontSize: 55.0,
  fontWeight: FontWeight.bold,
  color: Colors.black54,
  fontFamily: 'Raleway-Regular',
  letterSpacing: 3.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.normal,
  color: Colors.white,
  fontFamily: 'Raleway-Light'
);
const kSubTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);


//Decoration section
final kInputDecorationStyle = InputDecoration(
  filled: true,
  // fillColor: Colors.deepOrange.shade400.withOpacity(0.3),
  contentPadding: EdgeInsets.symmetric(horizontal: 10),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(
      color: Colors.deepOrange.shade400,
      width: 2.0,
    ),
  ),
  hintStyle: TextStyle(
    color: Colors.white, 
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepOrange.shade300, width: 2.0),
  ),
);

//Colors section
const kScaffoldColor = Color(0xFF444343);
const kOrangeColor = Colors.deepOrange;