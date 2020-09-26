import 'package:flutter/material.dart';
import 'package:flutterx100/screens/welcome.dart';

import 'top_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        body: Scrollbar(
          controller: scrollController,
          child: ListView(
            controller: scrollController,
            children: [
              Welcome()
            ],
          ),
        ),
      ),
    );
  }
}
