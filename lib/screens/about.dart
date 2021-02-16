import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterx100/helpers/constants.dart';
import 'package:flutterx100/helpers/responsive_layout.dart';
import 'package:flutterx100/helpers/website_color.dart';
import 'package:flutterx100/widgets/screen_title.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  Widget getBenefits(BuildContext context) {
    final List<Widget> benefitWidgets = <Widget>[];

    for (final String benefit in benefits) {
      benefitWidgets.add(getBenefit(benefit));
    }

    return cardView(benefitWidgets);
  }

  Widget getBenefit(String benefit) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          const Icon(
            Icons.circle,
            size: 8,
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              benefit,
              textAlign: TextAlign.left,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 15,
                color: WebsiteColor.googleGray,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
            const ScreenTitle(titleText: 'About'),
            const Text(
              'More about the challenge',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: WebsiteColor.googleGrayPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            spacing(height),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                
                style: GoogleFonts.nunitoSans(
                  fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Check out the repository of this website on ',
                  ),
                  TextSpan(
                      text: 'GitHub',
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launcher.launchURL(
                              'https://github.com/himanshusharma89/flutterx100');
                        }),
                ],
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.nunitoSans(
                  fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  const TextSpan(
                    text:
                        'If you have any questions you may also want to have a look at our ',
                  ),
                  TextSpan(
                      text: 'FAQ',
                      style: const TextStyle(
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
              'Benefits: What the #100DaysOfFlutter Challenge can do for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveLayout.isSmallScreen(context) ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: WebsiteColor.googleGrayPrimary,
              ),
            ),
            spacing(height),
            getBenefits(context),
          ],
        ),
      ),
    );
  }
}
