import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/cache_helper.dart';
import 'package:quran/core/theme/bloc/app_color_bloc.dart';

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
                InkWell(
                  onTap: () async{
                    BlocProvider.of<AppColorBloc>(context)
                        .add(BlueColorEvent());
                  await CacheHelper.saveIntValue('appcolor', 0);
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromARGB(255, 9, 78, 135),
                  ),
                ),
                InkWell(
                  onTap: () async{
                    BlocProvider.of<AppColorBloc>(context)
                        .add(GreenColorEvent());
                        await CacheHelper.saveIntValue('appcolor', 1);
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.teal,
                  ),
                ),
                InkWell(
                  onTap: () async{
                    BlocProvider.of<AppColorBloc>(context)
                        .add(PurpleColorEvent());
                      await   CacheHelper.saveIntValue('appcolor', 2);
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
