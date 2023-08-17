import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quran/features/adzan/presentation/screen/adzan_screen.dart';
import 'package:quran/features/hadith/presentation/screen/hadith_screen.dart';
import 'package:quran/features/saurahs_list/presentation/view.dart';
import '../features/saurah_content/models/saurah_content_mode.dart';

const Color appColor =// Color.fromARGB(255, 2, 71, 127);
Color(0xff13a795);
List<Widget> bottomNavScreens = [
  const AllSaurahs(),
  const HadithScreen(),
  const AdzanScreen()
];

List<String> screenTitle = ['Quran', 'Hadith', 'Adzan'];

late List<List<Ayahs>> allAyahs;
