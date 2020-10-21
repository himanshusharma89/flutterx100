import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/screens/home/welcome.dart';

import 'intro.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  ScrollController scrollController;
  Home({this.scrollController});

  @override
  Widget build(BuildContext context) {
    if (ResponsiveLayout.isLargeScreen(context) ||
        ResponsiveLayout.isMediumScreen(context))
      return Scrollbar(
        controller: scrollController,
        child: ListView(
          controller: scrollController,
          children: [Welcome(), Intro()],
        ),
      );
    else
      return ListView(
        controller: scrollController,
        children: [Welcome(), Intro()],
      );
  }
}
