import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/features/settings/presentation/view/settings.dart';
import '../features/mainView/presentation/screens/MainView.dart';
import '../features/saurah_content/models/saurah_content_mode.dart';

 Color appColor = Color.fromARGB(255, 9, 78, 135);
// Color.fromARGB(255, 2, 71, 127);
// Color.fromARGB(255, 4, 120, 108);

List<Widget> bottomNavScreens = [const MainView(), const SettingsVieew()];
bool isBoardingSeen = false;

List<String> screenTitle = [
  'Muslim',
  'Settings',
];

late List<List<Ayahs>> allAyahs;

List<String> gridInformation = [
  'القران الكريم',
  //'السنة النبوية',
  'الأذكار',
  'السبحة',
  'الاذان',
  'القبلة',
];
List<String> gridImages = [
  'assets/q/sbha.webp',
  //'assets/q/pngtree-holy-quran-with-blue-navy-background-png-image_3141352.jpg',
 // 'assets/q/night.webp',
  'assets/q/mor.webp',
  'assets/q/sebhaa.webp',
  'assets/q/azkar.webp',
  'assets/q/kaba.jpg',
];

//http://api.aladhan.com/v1/qibla/:latitude/:longitude

// http://api.aladhan.com/v1/calendarByCity/2023/8?city=Cairo&country=Egypt&method=2