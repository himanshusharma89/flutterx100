import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/helpers/website_color.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({@required this.titleText});
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: ResponsiveLayout.isSmallScreen(context) ? 25 : 30,
        fontWeight: FontWeight.bold,
        color: WebsiteColor.googleGray,
      ),
    );
  }
}
