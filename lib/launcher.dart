import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Launcher {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      SnackBar(content: Text('Could not launch $url'));
      throw 'Could not launch $url';
    }
  }
}
