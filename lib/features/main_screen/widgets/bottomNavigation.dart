import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/main_screen/cubit/move_betwwen_screens_in_bottom_bar_cubit.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 4,
      iconSize: 25,
      selectedLabelStyle: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      currentIndex: index,
      onTap: (value) {
        BlocProvider.of<MoveBetwwenScreensInBottomBarCubit>(context)
            .indexControle(value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الرئيسية',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'الإعدادات',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.location_searching),
        //   label: ' الحديث',
        // ),
      ],
    );
  }
}
