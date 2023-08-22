import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: appColor),
                    ),
                    child: const Center(
                        child: Text(
                      'سبحان الله',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: appColor),
                    ),
                    child: const Center(
                        child: Text(
                      'الحمدلله',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: appColor),
                    ),
                    child: const Center(
                        child: Text(
                      ' الله أكبر',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Consumer(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 77,
                      height: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: appColor),
                      ),
                      child: Center(
                          child: Text(
                        Provider.of<MasbhaProvider>(context ).count1.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                    Container(
                      width: 77,
                      height: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: appColor),
                      ),
                      child: Center(
                          child: Text(
                        Provider.of<MasbhaProvider>(context).count2.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                    Container(
                      width: 77,
                      height: 77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: appColor),
                      ),
                      child: Center(
                          child: Text(
                        Provider.of<MasbhaProvider>(context).count3.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              // const CustomContainer(),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<MasbhaProvider>(context , listen: false).countNumber(1);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: appColor, width: 1.5),
                      ),
                      child: const Center(
                        child: Text(
                          'count',
                          style: TextStyle(
                            color: appColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<MasbhaProvider>(context, listen: false).countNumber(2);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: appColor, width: 1.5),
                      ),
                      child: const Center(
                        child: Text(
                          'count',
                          style: TextStyle(
                            color: appColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<MasbhaProvider>(context, listen: false).countNumber(3);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: appColor, width: 1.5),
                      ),
                      child: const Center(
                        child: Text(
                          'count',
                          style: TextStyle(
                            color: appColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              InkWell(
                onTap: () {
                  Provider.of<MasbhaProvider>(context, listen: false).reset();
                },
                child: Container(
                  width: 180,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: appColor, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      'Reset all',
                      style: TextStyle(
                        color: appColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     Provider.of<MasbhaProvider>(context, listen: false).reset();
              //   },
              //   style: const ButtonStyle(
              //     backgroundColor: MaterialStatePropertyAll(appColor),
              //   ),
              //   label: const Text('reset'),
              //   icon: const Icon(Icons.fingerprint),
              // ),
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
