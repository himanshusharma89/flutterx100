import 'package:flutter/material.dart';
import 'package:flutterx100/helpers/constants.dart';
import 'package:flutterx100/helpers/website_color.dart';
import 'package:flutterx100/widgets/screen_title.dart';

class FAQs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight(context),
      width: double.infinity,
      child: padding(
        context,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ScreenTitle(titleText: 'Frequently Asked Questions'),
            spacing(height),
            cardView(getFAQs())
          ],
        ),
      ),
    );
  }

  List<Widget> getFAQs() => faqs.map((e) => getFAQ(e)).toList();

  Widget getFAQ(FAQ faq) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
              hoverColor: Colors.transparent
            ),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.transparent,
              expandedAlignment: Alignment.centerLeft,
              backgroundColor: Colors.transparent,
              tilePadding: const EdgeInsets.symmetric(horizontal: 12.0),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              title: Text(
                "Q: ${faq.question}",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  color: WebsiteColor.googleGray,
                ),
              ),
              children: <Widget>[
                Text(
                  "A: ${faq.answer}.",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 15,
                    color: WebsiteColor.googleGray,
                  ),
                ),
              ],
            ),
          ),
          if (faqs.indexOf(faq) != faqs.length - 1)
            const Divider(
              color: Colors.black26,
              thickness: 1,
              height: 0.5,
            ),
        ],
      ),
    );
  }
}
