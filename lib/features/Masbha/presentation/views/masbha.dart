import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';
import 'package:quran/features/Masbha/presentation/widgets/custom_masbha_button.dart';
import 'package:quran/features/Masbha/presentation/widgets/custom_masbha_container.dart';

import '../../../../core/constants.dart';

class Masbha extends StatelessWidget {
  const Masbha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'فَاذْكُرُونِي أَذْكُرْكُمْ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomContainer(),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Provider.of<MasbhaProvider>(context, listen: false)
                      .countNumber();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(appColor),
                ),
                label: const Text('count'),
                icon: const Icon(Icons.fingerprint),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Provider.of<MasbhaProvider>(context, listen: false)
                      .reset();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(appColor),
                ),
                label: const Text('reset'),
                icon: const Icon(Icons.fingerprint),
              ),
              // CustomMasbhaButton(
              //   text: 'count',
              //   onPressed: () {
              //     Provider.of<MasbhaProvider>(context, listen: false)
              //         .countNumber();
              //   },
              // ),
              // CustomMasbhaButton(
              //   text: 'reset',
              //   onPressed: () {
              //     Provider.of<MasbhaProvider>(context, listen: false).reset();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
