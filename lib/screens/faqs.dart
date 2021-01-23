import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/helpers/website_color.dart';
import 'package:flutterx100/widgets/constants.dart';
import 'package:flutterx100/widgets/screen_title.dart';

class FAQs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight(context),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: ResponsiveLayout.isSmallScreen(context) ? 30 : 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScreenTitle(titleText: 'Frequently Asked Questions'),
                SizedBox(
                  height: height * 0.02,
                ),
                ...getFAQs(),
                SizedBox(
                  height: height * 0.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getFAQs() => faqs.map((e) => getFAQ(e)).toList();

  Widget getFAQ(dynamic faq) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ExpansionTile(
            title: Text(
              "Q: ${faq['question']}. ",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16.5),
            ),
            children: [
              Text(
                "A: ${faq['answer']}. ",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.5),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          if (faqs.indexOf(faq) != faqs.length - 1)
            Divider(
              color: Colors.black,
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
        ],
      ),
    );
  }
}
