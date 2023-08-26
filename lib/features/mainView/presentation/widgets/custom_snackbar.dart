import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

SnackBar customSnackbar({required String content}) {
  return  SnackBar(
    content: Text(
      content,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    showCloseIcon: true,
    backgroundColor: appColor,
    duration:const Duration(
      seconds: 4,
    ),
    closeIconColor: Colors.white,
    padding:const EdgeInsets.all(7),
  );
}
