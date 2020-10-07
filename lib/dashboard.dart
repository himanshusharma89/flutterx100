import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterx100/bottom_bar.dart';
import 'package:flutterx100/responsive_layout.dart';
import 'package:flutterx100/screens/intro.dart';
import 'package:flutterx100/screens/welcome.dart';

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
        appBar: TopBar(onFAQsTap),
        body: ResponsiveLayout.isLargeScreen(context) ||
                ResponsiveLayout.isMediumScreen(context)
            ? desktopBody
            : mobileBody,
      ),
    );
  }

  Widget get desktopBody => PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        physics: new NeverScrollableScrollPhysics(),
        children: [
          Scrollbar(
            controller: scrollController,
            child: ListView(
              controller: scrollController,
              children: [Welcome(), Intro()],
            ),
          ),
          Container(
            color: Colors.blue,
            child: Text("derp"),
          )
        ],
      );

  Widget get mobileBody => Stack(
        children: [
          ListView(
            controller: scrollController,
            children: [Welcome(), Intro()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(),
          )
        ],
      );

  void onFAQsTap() {
    this.pageController.jumpToPage(1);
  }
}
