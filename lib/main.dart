// ignore_for_file: unused_import
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/cache_helper.dart';
import 'package:quran/core/connectivity/bloc/check_connectivity_bloc.dart';
import 'package:quran/core/theme/apptheme.dart';
import 'package:quran/core/theme/bloc/app_color_bloc.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';
import 'package:quran/features/adzan/presentation/bloc/azan_bloc.dart';
import 'package:quran/features/askar/presentation/bloc/azkar_bloc.dart';
import 'package:quran/features/mainView/presentation/screens/MainView.dart';
import 'package:quran/features/onboarding/presentation/views/on_boarding.dart';
import 'package:quran/features/qibla/data/geolocator.dart';
import 'package:quran/features/qibla/data/remote_getQibla.dart';
import 'package:quran/features/qibla/presentation/cubit/qibla_cubit.dart';
import 'package:quran/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:quran/features/splash/splash.dart';
import 'package:quran/test.dart';
import 'core/constants.dart';
import 'features/askar/model/azkar_model.dart';
import 'features/askar/presentation/views/main_azkar_view.dart';
import 'features/main_screen/cubit/move_betwwen_screens_in_bottom_bar_cubit.dart';
import 'features/saurah_content/data/ayahs_remote.dart';
import 'features/saurah_content/models/saurah_content_mode.dart';
import 'features/saurah_content/presentation/bloc/all_ayahs_bloc.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path =await p.getApplicationDocumentsDirectory();
  await Hive
    .initFlutter(path.path);
   Hive.registerAdapter(AzkarModelAdapter());
  await Hive.openBox('azkarSobeh');
  await Hive.openBox('azkarMesa');
  await Hive.openBox('azkarSalah');
  await CacheHelper.createInstance();
  if (CacheHelper.getBoolValue('boarding') == null) {
    await CacheHelper.saveBoolValue('boarding', false);
  }
  if (CacheHelper.getIntValue('appcolor') == null) {
    await CacheHelper.saveIntValue('appcolor', 0);
  }

  AwesomeNotifications().initialize(
    //'resource://drawable/res_app_icon',
    null,
    [
      NotificationChannel(
        channelKey: 'MySecondKey',
        channelName: 'Basic app notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: appColor,
        playSound: true,
        channelShowBadge: true,
        ledColor: Colors.white,
      ),
      NotificationChannel(
        channelKey: 'My3Key',
        channelName: 'dhur',
        channelDescription: 'alarm at prey time',
        defaultColor: appColor,
        playSound: true,
        channelShowBadge: true,
        ledColor: Colors.white,
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
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
        BlocProvider<AzkarBloc>(
          create: (context) => AzkarBloc()..add(FetchingEvent1()),
        ),
        BlocProvider<AzanBloc>(
          create: (context) => AzanBloc()..add(FetchingEvent()),
        ),
        BlocProvider<QiblaCubit>(
          create: (context) => QiblaCubit()..getQiblaDirction(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit()..controllingTheme(),
        ),
        BlocProvider<CheckConnectivityBloc>(
          create: (context) => CheckConnectivityBloc(),
        ),
        BlocProvider<AppColorBloc>(
          create: (context) => AppColorBloc()..add(IntialColorEvent()),
        ),
      ],
      child: ChangeNotifierProvider<MasbhaProvider>(
        create: (context) => MasbhaProvider(),
        child: BlocBuilder<AppColorBloc, AppColorState>(
          builder: (context, state) {
            if (state is GreenColorState) {
              appColor = Colors.green;
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp(
                    title: 'Quran App',
                    debugShowCheckedModeBanner: false,
                    theme: state is LightTheme ? appTheme : ThemeData.dark(),
                    home: const SplashScreen(),
                    // const Test(),
                    // OnBoardingView(),
                  );
                },
              );
            } else if (state is PurpleColorState) {
              appColor = Colors.purple;
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp(
                    title: 'Quran App',
                    debugShowCheckedModeBanner: false,
                    theme: state is LightTheme ? appTheme : ThemeData.dark(),
                    home: const SplashScreen(),
                    // const Test(),
                    // OnBoardingView(),
                  );
                },
              );
            } else if (state is BlueColorState) {
              appColor = const Color.fromARGB(255, 9, 78, 135);
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp(
                    title: 'Quran App',
                    debugShowCheckedModeBanner: false,
                    theme: state is LightTheme ? appTheme : ThemeData.dark(),
                    home: const SplashScreen(),
                    // const Test(),
                    // OnBoardingView(),
                  );
                },
              );
            }
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return MaterialApp(
                  title: 'Quran App',
                  debugShowCheckedModeBanner: false,
                  theme: state is LightTheme ? appTheme : ThemeData.dark(),
                  home: const SplashScreen(),
                  // const Test(),
                  // OnBoardingView(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
