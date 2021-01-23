import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';

class NavigationBarItem extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  NavigationBarItem({@required this.title, @required this.onTap, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveLayout.isSmallScreen(context) ? 5 : 10),
      child: Center(
          child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: color),
          ),
        ),
      )),
    );
  }
}
