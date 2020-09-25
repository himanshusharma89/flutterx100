import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'launcher.dart';

final Launcher launcher = Launcher();

// ignore: must_be_immutable
class TopBar extends StatelessWidget with PreferredSizeWidget {
  List socialPlatforms = [
    {
      'URL': 'https://github.com/himanshusharma89',
      'iconURL': 'https://img.icons8.com/fluent/50/000000/github.png'
    },
    {
      'URL': 'https://twitter.com/_SharmaHimanshu',
      'iconURL': 'https://img.icons8.com/color/48/000000/twitter.png'
    },
  ];

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return PreferredSize(
      preferredSize: Size.fromHeight(height * 0.1),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(offset: Offset(0, 3), color: Colors.grey, blurRadius: 10)
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: FadeInImage(
                      image: AssetImage('assets/flutter.png'),
                      placeholder: AssetImage('assets/Blocks.gif'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '100DaysOfFlutter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'About',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  for (int i = 0; i < socialPlatforms.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
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
                    height: kTextTabBarHeight - 5,
                    child: MaterialButton(
                      color: const Color(0xff08599d),
                      onPressed: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Start Challenge',
                            style: TextStyle(color: Colors.white),
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
