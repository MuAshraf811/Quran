import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/constants.dart';

import '../../../../core/cache_helper.dart';
import '../controller/masbha_provider.dart';

class CustomSebhaContainer extends StatelessWidget {
  const CustomSebhaContainer(
      {super.key, required this.name, required this.number});
  final String name;
  final int number;
  @override
  Widget build(BuildContext context) {
    final List tex = [
      Provider.of<MasbhaProvider>(context).count1.toString(),
      Provider.of<MasbhaProvider>(context).count2.toString(),
      Provider.of<MasbhaProvider>(context).count3.toString()
    ];
    return Stack(
      //alignment: Alignment.topCenter,
      children: [
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: appColor,
                width: 2.4,
              )),
        ),
        Positioned(
          left: 62,
          child: Container(
            height: 48,
            width: 128,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: appColor,
                  width: 2.2,
                )),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: appColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 75,
          top: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: (context, value, child) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appColor,
                        width: 2,
                      )),
                  child: Center(
                      child: Text(
                        tex[number-1],
                    // number == 1
                    //     ? Provider.of<MasbhaProvider>(context).count1.toString()
                    //     : Provider.of<MasbhaProvider>(context)
                    //         .count2
                    //         .toString(),
                    //' ${Provider.of<MasbhaProvider>(context).count2.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Provider.of<MasbhaProvider>(context, listen: false)
                      .countNumber(number);
                  CacheHelper.saveIntValue(
                      'sebha1',
                      Provider.of<MasbhaProvider>(context, listen: false)
                          .count1);
                },
                child: Container(
                  width: 100,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: appColor,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Count',
                      style: TextStyle(
                        color: appColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
