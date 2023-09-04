import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';

ThemeData appTheme = ThemeData(
  focusColor: appColor,
  scaffoldBackgroundColor: Colors.white.withOpacity(0.99),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: appColor,
    ),
    selectedLabelStyle: TextStyle(
      color: appColor,
    ),
    selectedItemColor: appColor,
  ),
);
