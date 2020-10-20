import 'package:flutter/material.dart';
import 'package:flutterx100/bottom_bar.dart';
import 'package:flutterx100/responsive_layout.dart';
import 'package:flutterx100/screens/about.dart';
import 'package:flutterx100/screens/intro.dart';
import 'package:flutterx100/screens/welcome.dart';

import 'screens/faqs.dart';
import 'top_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScrollController scrollController;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TopBar(onLogoTap, onFAQsTap, onAboutTap),
        body: ResponsiveLayout.isLargeScreen(context) ||
                ResponsiveLayout.isMediumScreen(context)
            ? desktopBody
            : mobileBody,
      ),
    );
  }

  Widget get desktopBody => PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Scrollbar(
            controller: scrollController,
            child: ListView(
              controller: scrollController,
              children: [Welcome(), Intro()],
            ),
          ),
          FAQs(),
          About(),
        ],
      );

  Widget get mobileBody => Stack(
        children: [
          PageView(
              controller: pageController,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  controller: scrollController,
                  children: [Welcome(), Intro()],
                ),
                FAQs(),
                About(),
              ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(onFAQsTap, onAboutTap),
          )
        ],
      );

  void onLogoTap() => this.pageController.animateToPage(0,
      duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  void onFAQsTap() => this.pageController.animateToPage(1,
      duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  void onAboutTap() => this.pageController.animateToPage(2,
      duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
}
