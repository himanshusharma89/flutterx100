import 'package:flutter/material.dart';
import 'package:flutterx100/widgets/bottom_bar.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/screens/about.dart';
import 'package:flutterx100/screens/home/home.dart';
import 'package:flutterx100/helpers/constants.dart';

import 'screens/faqs.dart';
import 'widgets/top_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScrollController desktopController, mobileController;
  List<Widget> pageList;

  @override
  void initState() {
    desktopController = ScrollController();
    mobileController = ScrollController();
    pageList = <Widget>[Home(), About(), FAQs()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TopBar(desktopController),
        body: Stack(
          children: <Widget>[
            Scrollbar(
              controller: ResponsiveLayout.isSmallScreen(context)
                  ? mobileController
                  : desktopController,
              child: ResponsiveLayout.isLargeScreen(context) ||
                      ResponsiveLayout.isMediumScreen(context)
                  ? desktopBody
                  : mobileBody,
            ),
            if (ResponsiveLayout.isSmallScreen(context))
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomBar(mobileController),
              )
          ],
        ),
      ),
    );
  }

  Widget get desktopBody => ListView(
        controller: desktopController,
        // physics: ClampingScrollPhysics(),
        children: pageList,
      );

  Widget get mobileBody => Container(
    margin: const EdgeInsets.only(bottom: bottomVarHeight,),
    child: ListView(
          controller: mobileController,
          children: pageList,
        ),
  );
}
