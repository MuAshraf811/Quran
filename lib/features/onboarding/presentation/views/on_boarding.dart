// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quran/core/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:quran/core/constants.dart';

import '../../../main_screen/screens/mainScreen.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();

  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: OnBoardingClipper(),
          //   child: Container(
          //     width: 200,
          //     height: 200,
          //     decoration: BoxDecoration(
          //       color: appColor.withOpacity(0.9),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 64,
            right: 32,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Surahs(),
                  ),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: appColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: PageView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return PageView(
                    onPageChanged: (value) {
                      val = value;
                      if (val == 1) {
                        setState(() {});
                      }
                    },
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    children: [
                      Column(
                        children: [
                           Text(
                            ' تطبيق أنا مسلم',
                            style: TextStyle(
                              color: appColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 230,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              //border: Border.all(color: appColor),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/q/mor.webp',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            ' يٌعد هذا التطبيق مرجعاً شاملاً ومهماً للعديد من الأمور الدينية المختلفة للمسلم',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: appColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          // RichText(
                          //   text: TextSpan(
                          //       text:
                          //           'يحتوي التطبيق علي قسم للقران الكريم والسنة النبوية بالإضافة للأذكار اليومية للمسلم',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //       )),
                          // ),
                        ],
                      ),
                      Column(
                        children: [
                           Text(
                            ' تطبيق أنا مسلم',
                            style: TextStyle(
                              color: appColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            height: 230,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              //border: Border.all(color: appColor),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/q/hand-drawn.webp',
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Text(
                              'ومنها القران الكريم والسنة النبوية وأذكار المسلم اليومية كأذكار الصباح والمساء والصلاة كما يحتوي علي سبحة إالكترونية',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                          // RichText(
                          //   text: TextSpan(
                          //       text:
                          //           'يحتوي التطبيق علي قسم للقران الكريم والسنة النبوية بالإضافة للأذكار اليومية للمسلم',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //       )),
                          // ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: 100,
              right: 180,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: JumpingDotEffect(
                  activeDotColor: appColor,
                  jumpScale: 1.7,
                ),
              )),
          val == 1
              ? Positioned(
                  bottom: 32,
                  left: 300,
                  child: TextButton(
                    onPressed: () async {
                      // _controller.jumpToPage(1);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Surahs(),
                        ),
                      );
                      await CacheHelper.saveBoolValue('boarding', true);
                      print(CacheHelper.getBoolValue('boarding'));
                      print('done');
                    },
                    child:  Text(
                      'Next',
                      style: TextStyle(
                        color: appColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class OnBoardingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final myPath = Path();
    myPath.lineTo(0, 0);
    myPath.lineTo(160, 0);

    myPath.quadraticBezierTo(150, 150, 0, 160);

    myPath.close();
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
