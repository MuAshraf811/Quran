import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/main_screen/screens/mainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Surahs(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: 400,
            width: double.infinity,
            decoration: const BoxDecoration(color: appColor),
            child: const Center(
              child: Text(
                'بّسًم ٱللۂ ٱلرحًمنٌ ٱلرحًيّم.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.only(top: 50),
          height: 210,
          width: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/q/ssss.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final myPath = Path();
    myPath.lineTo(0, 0);
    myPath.lineTo(0, height);
    myPath.lineTo(width / 12, height);
    myPath.quadraticBezierTo(width / 3, height - 150, width / 1.5, height - 20);
    myPath.quadraticBezierTo(width - 80, height - 80, width, height - 40);

    myPath.lineTo(width, 0);
    myPath.close();
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
