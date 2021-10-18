import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';
import 'screens/screens.dart';

void main() {
  runApp(const NotLetterboxdApp());
}

class NotLetterboxdApp extends StatelessWidget {
  const NotLetterboxdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Letterboxd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Palette.scaffold,
        dividerColor: Palette.divider,
        indicatorColor: Palette.boxdGreen,
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.zero,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.primary,
        ),
      ),
      home: const PopularScreen(),
    );
  }
}
