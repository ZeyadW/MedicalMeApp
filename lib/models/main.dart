import 'package:flutter/material.dart';

import 'package:project_mobile/searchfaq.dart';
import 'package:project_mobile/viewjournals.dart';
import '../viewjournals.dart';
import 'package:project_mobile/journal.dart';
import '../welcomescreen (1).dart';
import '../Login.dart';
import '../contactus.dart';
import '../journal.dart';
import '../Home.dart';
import '../profile.dart';
import '../searchmedicine.dart';

import '../viewreminders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that yosu run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
      routes: {
        'home': (context) => HomePage(),
        'Contact Us': (context) => ContactUs(),
        'profile': (context) => ProfilePage(),
        'addjournal': (context) => Journal(),
        /* 'faqs': (context) => FAQPage(),
        'help': (context) => HelpPage(),
        'sign in': (context) => SignInPage(),
        'sign up': (context) => SignUpPage(),
        'recommend': (context) => RecommendPage(),
        'join us': (context) => JoinUsPage(),*/
      },
    );
  }
}
