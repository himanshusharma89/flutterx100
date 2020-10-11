import 'package:flutter/material.dart';
import 'package:flutterx100/launcher.dart';
import 'package:flutterx100/responsive_layout.dart';

final Launcher launcher = Launcher();

// ignore: must_be_immutable
class FAQs extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  List _faqs = [
    {
      'question':
          'How do I connect with the people who are also doing this challenge?',
      'answer':
          'Search for #100DaysOfCode on Twitter :) Also, for other ways to connect, go to the Connect page'
    },
    {
      'question':
          'I am new to coding (or just deciding to learn to code) and can’t build projects yet, what should I do?',
      'answer':
          'The best way to start would be to follow the FreeCodeCamp’s Front End Curriculum from the very beginning. The further you get during the 100 days, the better.'
    },
    {
      'question':
          'I’ve already started the challenge, and I’m currently on Day 8 [*for example]. How can I start using this repo to track my progress?',
      'answer':
          'Don’t worry. Restore as much info on the previous days, but if you can’t then just continue from where you are right now. If you have been tweeting about your progress every day, put the links to your tweets in the Log for each day. Then, follow the format.'
    },
    {
      'question': 'I’ve missed a day, does it mean I’ve failed the challenge?',
      'answer':
          'Absolutely not. You are allowed to miss one day (then make it up by adding one more day to the end of the 100), but never miss two days in a row. This is a great piece of advice on habit formation that I got from Leo Babauta at zen habits.'
    },
    {
      'question':
          'I come home late, and by the time I am finished with my hour, it’s past midnight, does it count?',
      'answer':
          'Of course it counts! The rule of thumb is: have you coded for at least an hour before going to sleep that day? If yes, you are on track. The reason for this is that we all have different schedules and different life periods (kids, school, work, and what have you) so don’t hold yourself to some arbitrary time standard. You will not experience what Cinderella experienced once the clock strikes midnight. Don’t worry whether you get a point on GitHub on that particular day. Yes, it’s nice to have them in a streak one by one, but don’t do yourself a disservice by measuring your efforts to a clock.'
    },
    {
      'question': 'Should I keep a journal?',
      'answer':
          'Yes you should, and the best way to do that is to fork this repo, and commit to the Log daily. It’s helpful in two major ways: you will be able to look at the progress each day and see how far you’ve already come and it will be easier to find the motivation to continue, and the second one is that after you’ve done your 100 days, you will be able to analyze your experience better and see what worked and what didn’t.'
    },
    {
      'question': 'Should I put my projects online?',
      'answer':
          'Definitely. It’s great for accountability and motivation to know that the stuff you’ve worked on is accessible online to anyone who may wish to look at it. It will make you care about the end product more, and will lead to a more impressive result in the end. I suggest you put them on GitHub.'
    },
    {
      'question': 'Should I worry about streaks?',
      'answer':
          'Streaks are nice and helpful, but as I mentioned above — don’t worry about them too much and don’t criticize yourself over missing a day. Instead, make sure you do everything to not let that happen again, and know that worrying and scolding yourself will not give you any results. (Ok, It will give you results, but only negative. I would call them consequences, not results) The best way to get out of that negative emotional state is to sit down and code.'
    },
    {
      'question': 'What is the most difficult part of this challenge?',
      'answer':
          'The part where you have to sit down and start coding. Don’t postpone that or think about it at all, because you will rationalize yourself out of it. Approach it mechanically: sit down, open your laptop, launch your coding editor, and start typing. After 5 minutes, you will not feel any problems/procrastination/desire to stop.'
    },
    {
      'question':
          'If everyone started on a certain day, should I join them on the day they are? For example, from Day 12?',
      'answer':
          'This challenge is individual, so when you join you start at day 1. Whenever you’ll be posting an update on Twitter or elsewhere, make sure to mention which day you are on and use the hashtag so that people can find and support you!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: ListView(
        controller: _scrollController,
        shrinkWrap: false,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: ResponsiveLayout.isSmallScreen(context) ? 30 : 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Frequently Asked Questions',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
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

  List<Widget> getFAQs() => _faqs.map((e) => getFAQ(e)).toList();

  Widget getFAQ(dynamic faq) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Q: ${faq['question']}. ",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "A: ${faq['answer']}. ",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          if (_faqs.indexOf(faq) != _faqs.length - 1)
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
