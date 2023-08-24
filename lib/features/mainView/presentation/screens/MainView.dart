import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/Masbha/presentation/views/masbha.dart';
import 'package:quran/features/adzan/presentation/screen/adzan_screen.dart';
import 'package:quran/features/askar/presentation/views/main_azkar_view.dart';
import 'package:quran/features/mainView/presentation/widgets/custom_grid_elemnt.dart';
import 'package:quran/features/qibla/presentation/views/qibla_view.dart';

import '../../../saurahs_list/presentation/view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: UpperColumnClipper(),
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
            height: 160,
            width: double.infinity,
            color: appColor,
            child: const Center(
              child: Text(
                'بّسًم ٱللۂ ٱلرحًمنٌ ٱلرحًيّم.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: gridInformation.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AllSaurahs(),
                    ));
                  } else if (index == 3) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Masbha(),
                    ));
                  } else if (index == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MainAzkarView(),
                    ));
                  } else if (index == 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AdzanScreen(),
                    ));
                  } else if (index == 5) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const QiblaView(),
                    ));
                  }
                },
                child: CustomGridElemnt(
                  indx: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class UpperColumnClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final myPath = Path();
    myPath.lineTo(0, 0);
    myPath.lineTo(0, height / 2);
    myPath.quadraticBezierTo(width / 2, height, width, height / 2);
    myPath.lineTo(width, 0);
    myPath.close();
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
