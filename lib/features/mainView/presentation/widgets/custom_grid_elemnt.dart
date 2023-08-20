import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';

class CustomGridElemnt extends StatelessWidget {
  const CustomGridElemnt({super.key, required this.indx});
  final int indx;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 170,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(gridImages[indx]),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(24),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            width: 150,
            height: 35,
            decoration: const BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                gridInformation[indx],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
