import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/widgets/constants.dart';

import '../../helpers/website_color.dart';

// ignore: must_be_immutable
class Intro extends StatelessWidget {
  List rules = [
    'Work on any Flutter technology for the next 100 Days.',
    'Share your progress everyday to the Flutter Community with the #100DaysOfFlutter hashtag.'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveLayout.isSmallScreen(context) ? 20 : 40),
      child: Column(
        crossAxisAlignment: ResponsiveLayout.isSmallScreen(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the #100DaysOfFlutter Challenge! Here you can learn the rules, get answers to your questions by reading the FAQ, and find out more about the Flutter Community',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'Rules',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          for (int i = 0; i < rules.length; i++)
            Text(
              '${i + 1}. ' + rules[i],
              style: TextStyle(fontSize: 18),
            ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            'Officially start the challenge',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            'Willing to start the challenge and share your journey? Click below to tweet it to the world!',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: kTextTabBarHeight - 5,
            width: 200,
            child: MaterialButton(
              color: WebsiteColor.flutterBlueSecondary,
              onPressed: () {
                launcher.launchURL(
                    'https://twitter.com/intent/tweet?text=I%27m%20officially%20starting%20to%20the%20100DaysOfFlutter%20Challenge%20starting%20today!%20@100xFlutter&url=https://100daysofflutter.azurewebsites.net/&hashtags=100DaysOfFlutter');
              },
              hoverElevation: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Start Challenge',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
