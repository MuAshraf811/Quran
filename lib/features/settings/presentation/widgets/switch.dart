import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/cache_helper.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/settings/presentation/cubit/theme_cubit.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => SwitchListTile(
              value: CacheHelper.getBoolValue('theme'),
              onChanged: (value) {
                CacheHelper.saveBoolValue('theme', value);
                BlocProvider.of<ThemeCubit>(context).controllingTheme();
              },
              activeColor: appColor,
              title: const Text(
                'Dark mode',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ));
  }
}
