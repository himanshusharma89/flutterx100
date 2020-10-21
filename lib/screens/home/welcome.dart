import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';

import '../../helpers/website_color.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: ResponsiveLayout.isSmallScreen(context)
          ? height * 0.4
          : height * 0.46,
      color: WebsiteColor.flutterBluePrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   'Welcome to',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 25,
          //     fontWeight: FontWeight.normal,
          //   ),
          // ),
          Text(
            '#100DaysOfFlutter',
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveLayout.isSmallScreen(context) ? 40 : 55,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                height: 1.5),
          ),
          Text(
            'Challenge',
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveLayout.isSmallScreen(context) ? 22 : 30,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
