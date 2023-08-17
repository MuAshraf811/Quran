import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/main_screen/cubit/move_betwwen_screens_in_bottom_bar_cubit.dart';

import 'package:quran/features/main_screen/widgets/bottomNavigation.dart';

class Surahs extends StatelessWidget {
  const Surahs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoveBetwwenScreensInBottomBarCubit,
        MoveBetwwenScreensInBottomBarState>(
      listener: (context, sSMoveBetwwenScreensInBottomBarState) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const Drawer(
            backgroundColor: appColor,
            width: 250,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(128)),
            ),
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search)),
              )
            ],
            title: Text(
              screenTitle[
                  BlocProvider.of<MoveBetwwenScreensInBottomBarCubit>(context)
                      .index],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomNavigation(
            index: BlocProvider.of<MoveBetwwenScreensInBottomBarCubit>(context)
                .index,
          ),
          body: bottomNavScreens[
              BlocProvider.of<MoveBetwwenScreensInBottomBarCubit>(context)
                  .index],
        );
      },
    );
  }
}
