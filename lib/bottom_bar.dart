import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/launcher.dart';
import 'package:flutterx100/website_color.dart';

final Launcher launcher = Launcher();

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      color: WebsiteColor.googleGray,
      child: Row(
        children: [
          bottomBarItem(
              title: 'About',
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('This site is currently being built'),
                  duration: Duration(milliseconds: 4000),
                ));
              },
              color: Colors.white),
          bottomBarItem(
              title: 'Community',
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('This site is currently being built'),
                  duration: Duration(milliseconds: 4000),
                ));
              },
              color: Colors.white),
          for (int i = 0; i < socialPlatforms.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Material(
                color: WebsiteColor.googleGray,
                child: InkWell(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: FadeInImage(
                          placeholder: AssetImage('assets/Blocks.gif'),
                          image: NetworkImage(socialPlatforms[i]['iconURL'])),
                    ),
                    onTap: () {
                      launcher.launchURL(socialPlatforms[i]['URL']);
                    }),
              ),
            ),
          SizedBox(
            width: 5,
          ),
          bottomBarItem(
              title: 'Start Challenge',
              onTap: () {
                launcher.launchURL(
                    'https://twitter.com/intent/tweet?text=I%27m%20officially%20starting%20to%20the%20100DaysOfFlutter%20Challenge%20starting%20today!%20@100xFlutter&url=https://100daysofflutter.azurewebsites.net/&hashtags=100DaysOfFlutter');
              },
              color: WebsiteColor.flutterBlueSecondary),
        ],
      ),
    );
  }

  Widget bottomBarItem(
      {@required String title,
      @required Function onTap,
      @required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
          child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.normal, color: color),
          ),
        ),
      )),
    );
  }
}
