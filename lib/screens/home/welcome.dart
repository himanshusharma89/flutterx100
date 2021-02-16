import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';

import '../../helpers/website_color.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: Text(
              '#100DaysOfFlutter',
              style: TextStyle(
                  color: WebsiteColor.flutterBluePrimary,
                  fontSize: ResponsiveLayout.isSmallScreen(context) ? 40 : 55,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  height: 1.5),
            ),
          ),
          FittedBox(
            child: Text(
              'Challenge'.toUpperCase(),
              style: TextStyle(
                color: WebsiteColor.googleGrayPrimary.withOpacity(0.4),
                fontSize: ResponsiveLayout.isSmallScreen(context) ? 22 : 50,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
