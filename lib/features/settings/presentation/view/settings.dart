import 'package:flutter/material.dart';
import 'package:quran/core/theme/bloc/app_color_bloc.dart';
import 'package:quran/features/settings/presentation/widgets/custom_circle_avatar.dart';

import '../widgets/switch.dart';

class SettingsVieew extends StatelessWidget {
  const SettingsVieew({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CustomSwitch(),
          const Divider(
            indent: 22,
            endIndent: 22,
            thickness: 0.8,
            height: 24,
            color: Colors.black,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Main Color',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 48,
                ),
                CustomCircleAvatarClickable(
                    contxt: context,
                    event: BlueColorEvent(),
                    color: const Color.fromARGB(255, 9, 78, 135),
                    index: 0),
                CustomCircleAvatarClickable(
                    contxt: context,
                    event: GreenColorEvent(),
                    color: Colors.teal,
                    index: 1),
                CustomCircleAvatarClickable(
                    contxt: context,
                    event: PurpleColorEvent(),
                    color: Colors.purple,
                    index: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
