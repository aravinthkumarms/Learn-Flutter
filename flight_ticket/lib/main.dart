import 'package:flight_ticket/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'screens/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primary,
          fontFamily: 'SF',
        ),
        home: const BottomBar());
  }
}
