import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/screens/home/welcome.dart';
import 'package:flutterx100/helpers/constants.dart';

import 'intro.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight(context),
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
              widthFactor: ResponsiveLayout.isSmallScreen(context) ? 0 : 0.5,
              alignment: Alignment.centerRight,
              child: Welcome()),
          FractionallySizedBox(
              widthFactor: ResponsiveLayout.isSmallScreen(context) ? 1 : 0.5,
              alignment: ResponsiveLayout.isSmallScreen(context)
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Intro()),
        ],
      ),
    );
  }
}
