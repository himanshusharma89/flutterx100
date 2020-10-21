import 'package:flutter/material.dart';
import 'package:flutterx100/navigation/bottom_bar.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/screens/about.dart';
import 'package:flutterx100/screens/home/home.dart';

import 'screens/faqs.dart';
import 'navigation/top_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScrollController scrollController;
  Widget bodyWidget;

  @override
  void initState() {
    scrollController = ScrollController();
    bodyWidget = Home(
      scrollController: scrollController,
    );
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

  Widget get desktopBody => bodyWidget;

  Widget get mobileBody => Stack(
        children: [
          bodyWidget,
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomBar(onFAQsTap, onAboutTap),
          )
        ],
      );

  void onLogoTap() {
    setState(() {
      bodyWidget = Home(
        scrollController: scrollController,
      );
    });
  }

  void onFAQsTap() {
    setState(() {
      bodyWidget = FAQs();
    });
  }

  void onAboutTap() {
    setState(() {
      bodyWidget = About();
    });
  }
}
