import 'package:bullion/pages/Live%20chart/live_chart_screen.dart';
import 'package:bullion/pages/Rate%20alert/rate_alert_screen.dart';
import 'package:flutter/material.dart';

import 'components/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Bullion',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF231F20),
      ),
      debugShowCheckedModeBanner: false,
      home:  BottomNavBar(),
    );
  }
}
