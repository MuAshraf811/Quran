import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/main_screen/cubit/move_betwwen_screens_in_bottom_bar_cubit.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (value) {
        BlocProvider.of<MoveBetwwenScreensInBottomBarCubit>(context)
            .indexControle(value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.book_rounded),
          label: 'القران',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ad_units_outlined),
          label: ' الحديث',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.multitrack_audio_rounded),
          label: 'الأذان',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.location_searching),
        //   label: ' الحديث',
        // ),
      ],
    );
  }
}
