import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/helpers/website_color.dart';
import 'package:flutterx100/widgets/navigation_bar_item.dart';

import '../helpers/constants.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  BottomBar(this.controller);
  ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomVarHeight,
      width: double.infinity,
      color: WebsiteColor.googleGray,
      alignment: Alignment.bottomCenter,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FittedBox(
              child: Row(
                children: <Widget>[
                  NavigationBarItem(
                      title: 'About',
                      onTap: () => controller.animateTo(
                          1 * screenHeight(context),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease),
                      color: Colors.white),
                  NavigationBarItem(
                      title: 'FAQs',
                      onTap: () => controller.animateTo(
                          2 * screenHeight(context),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease),
                      color: Colors.white),
                  NavigationBarItem(
                      title: 'Community',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('This site is currently being built'),
                        ));
                      },
                      color: Colors.white),
                  for (int i = 0; i < socialPlatforms.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Material(
                        color: WebsiteColor.googleGray,
                        child: InkWell(
                            onTap: () {
                              launcher.launchURL(socialPlatforms[i]['URL']);
                            },
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: FadeInImage(
                                  placeholder: const AssetImage('assets/Blocks.gif'),
                                  image: NetworkImage(
                                      socialPlatforms[i]['iconURL'])),
                            ),),
                      ),
                    ),
                ],
              ),
            ),
            FittedBox(
              child: NavigationBarItem(
                  title: 'Start Challenge',
                  onTap: () {
                    launcher.launchURL(
                        'https://twitter.com/intent/tweet?text=I%27m%20officially%20starting%20to%20the%20100DaysOfFlutter%20Challenge%20starting%20today!%20@100xFlutter&url=https://100daysofflutter.azurewebsites.net/&hashtags=100DaysOfFlutter');
                  },
                  color: WebsiteColor.flutterBlueSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
