import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/responsive_layout.dart';
import 'package:flutterx100/website_color.dart';

import 'launcher.dart';

final Launcher launcher = Launcher();

// ignore: must_be_immutable
class TopBar extends StatelessWidget with PreferredSizeWidget {
  VoidCallback _onLogoTap;
  VoidCallback _onFAQsTap;

  List socialPlatforms = [
    {
      'URL': 'https://github.com/himanshusharma89/flutterx100',
      'iconURL': 'https://img.icons8.com/fluent/50/000000/github.png'
    },
    {
      'URL': 'https://twitter.com/100xFlutter',
      'iconURL': 'https://img.icons8.com/color/48/000000/twitter.png'
    },
  ];

  TopBar(this._onLogoTap, this._onFAQsTap);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

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
                  onTap: this._onLogoTap,
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
                    topBarItem(
                        title: 'About',
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('This site is currently being built'),
                            duration: Duration(milliseconds: 4000),
                          ));
                        }),
                    topBarItem(title: 'FAQs', onTap: this._onFAQsTap),
                    topBarItem(
                        title: 'Community',
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
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

  Widget topBarItem({@required String title, @required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
          child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      )),
    );
  }
}
