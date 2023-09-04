import 'package:flutter/material.dart';

import 'package:quran/core/constants.dart';

class CustomMasbhaButton extends StatelessWidget {
  const CustomMasbhaButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style:  ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(appColor),
      ),
      label: Text(text),
      icon: const Icon(Icons.fingerprint),
    );
  }
}
