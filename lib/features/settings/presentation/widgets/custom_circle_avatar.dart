import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/cache_helper.dart';

import '../../../../core/theme/bloc/app_color_bloc.dart';

class CustomCircleAvatarClickable extends StatelessWidget {
  const CustomCircleAvatarClickable(
      {super.key,
      required this.contxt,
      required this.event,
      required this.color,
      required this.index});
  final int index;
  final BuildContext contxt;
  final AppColorEvent event;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        BlocProvider.of<AppColorBloc>(contxt).add(event);
        await CacheHelper.saveIntValue('appcolor', index);
      },
      child:  CircleAvatar(
        radius: 15,
        backgroundColor: color,
      ),
    );
  }
}
