import 'package:bookstore_recommendation_system_fyp/Widgets/text_field.dart';
import 'package:bookstore_recommendation_system_fyp/screens/signup_screen.dart';
import 'package:bookstore_recommendation_system_fyp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'screens/login_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FYP',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home:const WelcomeScreen());
  }
}

