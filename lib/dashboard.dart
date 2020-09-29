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

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TopBar(),
        body: ResponsiveLayout.isLargeScreen(context) ||
                ResponsiveLayout.isMediumScreen(context)
            ? Scrollbar(
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  children: [Welcome(), Intro()],
                ),
              )
            : Stack(
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
            ),
      ),
    );
  }
}
