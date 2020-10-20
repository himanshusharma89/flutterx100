import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/launcher.dart';
import 'package:flutterx100/responsive_layout.dart';
import 'package:flutterx100/website_color.dart';

final Launcher launcher = Launcher();

// ignore: must_be_immutable
class About extends StatelessWidget {
  About({Key key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  List<String> _benefits = [
    "Coding will become a daily habit for you — a habit that you can easily maintain after you’ve finished the challenge.",
    "Every day that you consistently code, you’ll build momentum. That momentum will make it easier for you to learn more advanced topics. You won’t have to spend extra time trying to remember what you did previously. You can stay in the “flow” of coding.",
    "You will learn to use many packages to expand the functionality of Flutter.",
    "You’ll make friends and meet like-minded people who are also working through this challenge alongside you. They’ll help you find the strength to keep coding even on the days when you don’t feel like you’re making progress. They can also help you when you inevitably get stuck.",
    "The projects that you’ll build will be small in scope, so by the time you finish, you’ll have completed several of them — and gained a wide range of experience.",
    "If you were just working through tutorials, you wouldn’t have much to show for it. But with #100DaysOfFlutter, you’ll build real portfolio projects that you can show to potential employers and share with your family and friends.",
    "These projects will give you practice with concepts that frequently come up during developer job interviews.",
    "Your GitHub profile will look extremely active. And yes, hiring managers and recruiters do look at these.",
    "You’ll greatly diminish your fear of starting a new coding project. It will become a natural, ordinary thing to do.",
    "You’ll have a good reason to stop procrastinating and start coding every day.",
  ];

  List<Widget> getBenefits() {
    List<Widget> benefitWidgets = List<Widget>();

    for (String benefit in _benefits) {
      benefitWidgets.add(getBenefit(benefit));
    }

    return benefitWidgets;
  }

  Widget getBenefit(String benefit) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Icon(
            Icons.circle,
            size: 8,
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            child: Flexible(
              child: Text(
                benefit,
                textAlign: TextAlign.left,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget spacing(double height) {
    return SizedBox(
      height: height * 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: ListView(
        shrinkWrap: false,
        controller: _scrollController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: ResponsiveLayout.isSmallScreen(context) ? 30 : 200),
            child: Column(
              children: [
                Text(
                  'About',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spacing(height),
                Text(
                  "More about the chalenge",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: WebsiteColor.googleGrayPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spacing(height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Check out the repository of this website on ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          launcher.launchURL(
                              "https://github.com/himanshusharma89/flutterx100");
                        },
                        child: Text(
                          'Github',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'If you have any questions you may also want to have a look at our ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    MouseRegion(
                      //cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to FAQ page
                        },
                        child: Text(
                          'FAQ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                spacing(height),
                Text(
                  "Benefits: What the #100DaysOfFlutter Challenge can do for you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: WebsiteColor.googleGrayPrimary,
                  ),
                ),
                ...getBenefits(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
