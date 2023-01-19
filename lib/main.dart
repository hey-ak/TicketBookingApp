import 'package:flutter/material.dart';
import 'package:ticketbooking/screens/Login/login_screen.dart';
import 'package:ticketbooking/screens/Welcome/welcome_screen.dart';
import 'package:ticketbooking/utils/app_styles.dart';
import './screens/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: const WelcomeScreen(),
    );
  }
}
