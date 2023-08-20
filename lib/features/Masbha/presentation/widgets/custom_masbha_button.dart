import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';

class CustomMasbhaButton extends StatelessWidget {
  const CustomMasbhaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Provider.of<MasbhaProvider>(context, listen: false).countNumber();
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(appColor),
      ),
      label: const Text('Count'),
      icon: const Icon(Icons.fingerprint),
    );
  }
}
