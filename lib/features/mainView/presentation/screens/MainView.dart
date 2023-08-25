import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/core/routes/router.dart';
import 'package:quran/features/Masbha/presentation/views/masbha.dart';
import 'package:quran/features/adzan/presentation/screen/adzan_screen.dart';
import 'package:quran/features/askar/presentation/views/main_azkar_view.dart';
import 'package:quran/features/mainView/presentation/widgets/custom_grid_elemnt.dart';
import 'package:quran/features/qibla/presentation/views/qibla_view.dart';

import '../../../../core/connectivity/bloc/check_connectivity_bloc.dart';
import '../../../adzan/presentation/bloc/azan_bloc.dart';
import '../../../saurahs_list/presentation/view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckConnectivityBloc, CheckConnectivityState>(
      listener: (context, state) {
        if (state is MobileDataConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You are now using the online version of this app',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              showCloseIcon: true,
              backgroundColor: appColor,
              duration: Duration(
                seconds: 4,
              ),
              closeIconColor: Colors.white,
              padding: EdgeInsets.all(7),
            ),
          );
        } else if (state is WifiConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You are now using the online version of this app',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              showCloseIcon: true,
              backgroundColor: appColor,
              duration: Duration(
                seconds: 4,
              ),
              closeIconColor: Colors.white,
              padding: EdgeInsets.all(7),
            ),
          );
        } else if (state is NoInternetConnectionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You are now using the offline version of this app',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              showCloseIcon: true,
              backgroundColor: appColor,
              duration: Duration(
                seconds: 4,
              ),
              closeIconColor: Colors.white,
              padding: EdgeInsets.all(7),
            ),
          );
        }
      },
      child: Column(
        children: [
          ClipPath(
            clipper: UpperColumnClipper(),
            child: Container(
              padding: const EdgeInsets.only(bottom: 12),
              height: 88,
              width: double.infinity,
              color: appColor,
              child: const Center(
                child: Text(
                  'بّسًم ٱللۂ ٱلرحًمنٌ ٱلرحًيّم.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 4,
          // ),
          BlocBuilder<AzanBloc, AzanState>(
            builder: (context, state) {
              if (state is AzanLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                              color: appColor,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'الشروق',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .sunrise,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          child: Column(
                            children: [
                              const Text(
                                'الفجر',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .fajr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          child: Column(
                            children: [
                              const Text(
                                'الظهر',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .dhuhr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          child: Column(
                            children: [
                              const Text(
                                'العصر',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .asr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          child: Column(
                            children: [
                              const Text(
                                'الغروب',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .sunset,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          child: Column(
                            children: [
                              const Text(
                                'المغرب',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .maghrib,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: appColor,
                                width: 1,
                              )),
                          child: Column(
                            children: [
                              const Text(
                                'العشاء',
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  state
                                      .azanTimesModel[0][DateTime.now().day - 1]
                                      .isha,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),

          Expanded(
            child: GridView.builder(
              itemCount: gridInformation.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context)
                          .push(CustomRouter(const AllSaurahs()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const AllSaurahs(),
                      // ));
                    } else if (index == 1) {
                      Navigator.of(context)
                          .push(CustomRouterRotation(Masbha()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => Masbha(),
                      // ));
                    } else if (index == 2) {
                      Navigator.of(context)
                          .push(CustomRouterRotation(MainAzkarView()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => MainAzkarView(),
                      // ));
                    } else if (index == 4) {
                      Navigator.of(context)
                          .push(CustomRouterRotation(const AdzanScreen()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const AdzanScreen(),
                      // ));
                    } else if (index == 5) {
                      Navigator.of(context)
                          .push(CustomRouterRotation(const QiblaView()));
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const QiblaView(),
                      // ));
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
      ),
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

class LowerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    final myPath = Path();
    myPath.lineTo(0, 0);
    myPath.lineTo(0, height / 2);
    myPath.quadraticBezierTo(width / 2, height, width, height / 2);
    myPath.lineTo(width, 0);

    myPath.quadraticBezierTo(width / 2, height / 2, 0, 0);
    return myPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
