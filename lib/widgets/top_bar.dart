import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/helpers/website_color.dart';
import 'package:flutterx100/widgets/navigation_bar_item.dart';

import '../helpers/constants.dart';


// ignore: must_be_immutable
class TopBar extends StatelessWidget with PreferredSizeWidget {
  ScrollController controller;
  TopBar(this.controller);

  @override
  Size get preferredSize => const Size.fromHeight(TOP_BAR_HEIGHT);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              color: WebsiteColor.googleGraySecondary,
              blurRadius: 5)
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: ResponsiveLayout.isSmallScreen(context)
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => controller.animateTo(0,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: FadeInImage(
                          height: kToolbarHeight,
                          width: kToolbarHeight,
                          image: AssetImage('assets/flutter.png'),
                          placeholder: AssetImage('assets/Blocks.gif'),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '100DaysOfFlutter',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              if (ResponsiveLayout.isLargeScreen(context) ||
                  ResponsiveLayout.isMediumScreen(context))
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavigationBarItem(
                        title: 'About',
                        onTap: () => controller.animateTo(
                            1 * screenHeight(context),
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease)),
                    NavigationBarItem(
                        title: 'FAQs',
                        onTap: () => controller.animateTo(
                            2 * screenHeight(context),
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease)),
                    NavigationBarItem(
                        title: 'Community',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('This site is currently being built'),
                            duration: Duration(milliseconds: 4000),
                          ));
                        }),
                    for (int i = 0; i < socialPlatforms.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 12),
                          child: Material(
                            color: Theme.of(context).primaryColor,
                            child: InkWell(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: FadeInImage(
                                      placeholder:
                                          AssetImage('assets/Blocks.gif'),
                                      image: NetworkImage(
                                          socialPlatforms[i]['iconURL'])),
                                ),
                                onTap: () {
                                  launcher.launchURL(socialPlatforms[i]['URL']);
                                }),
                          ),
                        ),
                      ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: kTextTabBarHeight - 5,
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
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
