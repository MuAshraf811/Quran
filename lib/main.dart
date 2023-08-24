// ignore_for_file: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/cache_helper.dart';
import 'package:quran/core/theme/apptheme.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';
import 'package:quran/features/adzan/presentation/bloc/azan_bloc.dart';
import 'package:quran/features/askar/presentation/bloc/azkar_bloc.dart';
import 'package:quran/features/mainView/presentation/screens/MainView.dart';
import 'package:quran/features/qibla/data/geolocator.dart';
import 'package:quran/features/qibla/data/remote_getQibla.dart';
import 'package:quran/features/qibla/presentation/cubit/qibla_cubit.dart';
import 'package:quran/features/settings/presentation/cubit/theme_cubit.dart';
import 'package:quran/features/splash/splash.dart';
import 'core/constants.dart';
import 'features/askar/presentation/views/main_azkar_view.dart';
import 'features/main_screen/cubit/move_betwwen_screens_in_bottom_bar_cubit.dart';
import 'features/saurah_content/data/ayahs_remote.dart';
import 'features/saurah_content/models/saurah_content_mode.dart';
import 'features/saurah_content/presentation/bloc/all_ayahs_bloc.dart';
void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.createInstance();
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
      ],
      child: ChangeNotifierProvider<MasbhaProvider>(
        create: (context) => MasbhaProvider(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
             title: 'Quran App',
             debugShowCheckedModeBanner: false,
             theme:state is LightTheme? appTheme : ThemeData.dark(),
             home: const SplashScreen(),
              );
          },
        ),
      ),
    );
  }
}
