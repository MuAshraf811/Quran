import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';
import 'package:quran/features/Masbha/presentation/widgets/custom_masbha_button.dart';
import 'package:quran/features/Masbha/presentation/widgets/custom_masbha_container.dart';

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
      body: ChangeNotifierProvider(
        create: (context) => MasbhaProvider(),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(),
                SizedBox(
                  height: 32,
                ),
                CustomMasbhaButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
