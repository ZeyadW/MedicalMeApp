import 'package:flutter/material.dart';

import 'package:project_mobile/Screens/searchfaq.dart';
import 'package:project_mobile/Screens/viewjournals.dart';
import 'Screens/viewjournals.dart';
import 'package:project_mobile/Screens/journal.dart';
import 'Screens/welcomescreen (1).dart';
import 'Screens/Login.dart';
import 'Screens/contactus.dart';
import 'Screens/journal.dart';
import 'Home.dart';
import 'Screens/profile.dart';
import 'Screens/searchmedicine.dart';

import 'Screens/viewreminders.dart';

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
