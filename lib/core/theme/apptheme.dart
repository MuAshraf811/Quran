import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white.withOpacity(0.99),
  appBarTheme: const AppBarTheme(backgroundColor: appColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: appColor,
    ),
    selectedLabelStyle: TextStyle(
      color: appColor,
    ),
    selectedItemColor: appColor,
  ),
);
