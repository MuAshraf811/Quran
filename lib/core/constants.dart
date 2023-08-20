import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/features/adzan/presentation/screen/adzan_screen.dart';
import 'package:quran/features/hadith/presentation/screen/hadith_screen.dart';
import '../features/mainView/presentation/screens/MainView.dart';
import '../features/saurah_content/models/saurah_content_mode.dart';

const Color appColor = // Color.fromARGB(255, 2, 71, 127);
    Color.fromARGB(255, 4, 120, 108);
List<Widget> bottomNavScreens = [
  const MainView(),
  const HadithScreen(),
  const AdzanScreen()
];

List<String> screenTitle = ['Quran', 'Hadith', 'Adzan'];

late List<List<Ayahs>> allAyahs;

List<String> gridInformation = [
  'القران الكريم',
  'السنة النبوية',
  'الأذكار',
  'السبحة',
  'معلومات السور',
  'الاذان'
];
List<String> gridImages = [
  'assets/q/sbha.webp',
  //'assets/q/pngtree-holy-quran-with-blue-navy-background-png-image_3141352.jpg',
  'assets/q/night.webp',
  'assets/grid/صور-اذكار-يومية-1.png',
  'assets/grid/مسبحة.jpg',
  'assets/grid/OIP.jpg',
  'assets/grid/R2.png'
];


// https://ahegazy.github.io/muslimKit/json/azkar_sabah.json 
//https://ahegazy.github.io/muslimKit/json/azkar_massa.json
//https://ahegazy.github.io/muslimKit/json/PostPrayer_azkar.json

// http://api.aladhan.com/v1/calendarByCity/2023/8?city=Cairo&country=Egypt&method=2