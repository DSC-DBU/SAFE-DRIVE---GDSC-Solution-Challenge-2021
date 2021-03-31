import 'package:flutter/material.dart';

class ResponsiveHelper extends StatelessWidget {
  final Widget mobile;
  final Widget tab;

  const ResponsiveHelper({this.mobile, this.tab});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth < 540) {
            return mobile;
          } else {
            return tab;
          }
        });
  }
}