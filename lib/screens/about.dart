import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/helpers/website_color.dart';
import 'package:flutterx100/widgets/constants.dart';
import 'package:flutterx100/widgets/screen_title.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  Widget getBenefits(BuildContext context) {
    List<Widget> benefitWidgets = List<Widget>();

    for (String benefit in benefits) {
      benefitWidgets.add(getBenefit(benefit));
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                color: WebsiteColor.googleGraySecondary,
                blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Scrollbar(
          controller: scrollController,
          isAlwaysShown: true,
          thickness: 2,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: benefitWidgets.length,
            primary: false,
            shrinkWrap: true,
            physics: !ResponsiveLayout.isSmallScreen(context)
                ? NeverScrollableScrollPhysics()
                : null,
            controller: scrollController,
            itemBuilder: (context, index) => benefitWidgets[index],
          ),
        ),
      ),
    );
  }

  Widget getBenefit(String benefit) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
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
                  fontSize: 15,
                  color: WebsiteColor.googleGray,
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
    return Container(
      height: screenHeight(context),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: ResponsiveLayout.isSmallScreen(context) ? 25 : 190),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScreenTitle(titleText: 'About'),
            Text(
              "More about the challenge",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: WebsiteColor.googleGrayPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            spacing(height),
            RichText(
              text: TextSpan(
                style: GoogleFonts.nunitoSans(
                  fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Check out the repository of this website on ",
                  ),
                  TextSpan(
                      text: "GitHub",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launcher.launchURL(
                              "https://github.com/himanshusharma89/flutterx100");
                        }),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: GoogleFonts.nunitoSans(
                  fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "If you have any questions you may also want to have a look at our ",
                  ),
                  TextSpan(
                      text: "FAQ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to FAQ page
                        }),
                ],
              ),
            ),
            Text(
              "Benefits: What the #100DaysOfFlutter Challenge can do for you",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 22,
                fontWeight: FontWeight.bold,
                color: WebsiteColor.googleGrayPrimary,
              ),
            ),
            spacing(height),
            Flexible(flex: 4, fit: FlexFit.loose, child: getBenefits(context)),
          ],
        ),
      ),
    );
  }
}
