import 'package:flutter/material.dart';

import 'package:quran/core/constants.dart';

import 'package:quran/features/askar/presentation/views/zekr_screen.dart';
import 'package:quran/features/askar/presentation/widgets/custom_azkar_container.dart';

class MainAzkarView extends StatelessWidget {
  MainAzkarView({super.key});
  final List<String> stringsOfContainer = [
    'أذكار الصباح',
    'أذكار المساء',
    'أذكار الصلاة'
  ];
  final List<String> assetsImage = [
    'assets/q/mor.webp',
    'assets/q/night.webp',
    'assets/q/hand-drawn.webp'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأذكار'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 36, right: 12, left: 12),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 24),
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              focusColor: appColor,
              hoverColor: appColor,
              splashColor: appColor,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  ZekrScreen( indx: index,),
                ));
              },
              child: CustomAzkarContainer(
                  assetImage: assetsImage[index],
                  containerText: stringsOfContainer[index]),
            );
          },
        ),
      ),
    );
  }
}
