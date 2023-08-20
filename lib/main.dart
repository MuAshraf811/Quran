// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/theme/apptheme.dart';
import 'package:quran/features/askar/presentation/bloc/azkar_bloc.dart';
import 'package:quran/features/mainView/presentation/screens/MainView.dart';
import 'package:quran/features/splash/splash.dart';
import 'core/constants.dart';
import 'features/askar/presentation/views/main_azkar_view.dart';
import 'features/main_screen/cubit/move_betwwen_screens_in_bottom_bar_cubit.dart';
import 'features/saurah_content/data/ayahs_remote.dart';
import 'features/saurah_content/models/saurah_content_mode.dart';
import 'features/saurah_content/presentation/bloc/all_ayahs_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  // try {
  //   final res = await AyahsRemote.fetchingAllAyahs();
  //   final List<dynamic> data = res['data']['surahs'];
  //   final List<List<dynamic>> delivred = [];
  //   final List finalAyahs = [];
  //   for (int i = 0; i <= data.length - 1; i++) {
  //     delivred.add(data[i]['ayahs']);
  //   }
  //   if (kDebugMode) {
  //     print(delivred);
  //   }
  //   for (int j = 0; j <= delivred.length - 1; j++) {
  //     final List<dynamic> response = delivred[j];
  //     finalAyahs.add(response.map((e) => Ayahs.fromJson(e)).toList());
  //   }
  //   if (kDebugMode) {
  //     print('Hello, this is it');
  //     print(finalAyahs);
  //   }
  // } catch (e) {
  //   if (kDebugMode) {
  //     print(e.toString());
  //   }
  // }
  // final List<List<Ayahs>> bb = [];
  // final res = await AyahsRemote.fetchingAllAyahs();
  // final List saurahRes = res['data']['surahs'];
  // final List aList = [];
  // for (int i = 0; i <= saurahRes.length - 1; i++) {
  //   aList.add(saurahRes[i]['ayahs']);
  // }
  // // if (kDebugMode) {
  // //   print('Hello , This Ayahs bloc which fetching data list of all ayahs');
  // //   print(aList);
  // // }
  // for (int x = 0; x <= aList.length - 1; x++) {
  //   final List inner = aList[x];

  //   final List<Ayahs> sAyahs = inner.map((e) => Ayahs.fromJson(e)).toList();
  //   bb.add(sAyahs);
  // }
  // print(bb);
  // final res = await AyahsRemote.fetchingAllAyahs();
  // final List saurahRes = res['data']['surahs'];
  // final List aList = [];
  // for (int i = 0; i <= saurahRes.length - 1; i++) {
  //   aList.add(saurahRes[i]['ayahs']);
  // }

  // allAyahs = aList.map((e) => Ayahs.fromJson(e)).toList();
  // print(allAyahs);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoveBetwwenScreensInBottomBarCubit>(
          create: (context) => MoveBetwwenScreensInBottomBarCubit(),
        ),
        BlocProvider<AllAyahsBloc>(
          create: (context) => AllAyahsBloc(),
        ),
        BlocProvider<AzkarBloc>(create: (context) => AzkarBloc()..add(FetchingEvent()),)
      ],
      child: MaterialApp(
        title: 'Quran app',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home:  
        const  SplashScreen(),
      ),
    );
  }
}
