import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.transparent,
        border: Border.all(
          color: appColor,
          width: 1.4,
        ),
      ),
      child: Center(
        child: Consumer<MasbhaProvider>(
          builder: (context, value, child) {
            return Text(
           value.count.toString(),
            style: const TextStyle(
              color: appColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          );
          },
        ),
      ),
    );
  }
}
