import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/Masbha/presentation/controller/masbha_provider.dart';

import 'package:quran/features/Masbha/presentation/widgets/custom_sebha_widget.dart';

class Masbha extends StatelessWidget {
  Masbha({super.key});
  final List<String> tit = ['سبحان الله', 'الله أكبر ', 'الحمدلله' , 'الصلاة علي النبي' ,'لا إله إلا الله'  , 'الحوقلة'];
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
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
        padding:
            const EdgeInsets.only(top: 150, left: 16, right: 12, bottom: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: ListView.separated(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (context, index) => const SizedBox(width: 24),
                itemBuilder: (context, index) => CustomSebhaContainer(
                  name: tit[index],
                  number: index + 1,
                ),
              ),
            ),
            Consumer<MasbhaProvider>(
              builder: (context, value, child) => GestureDetector(
                onTap: () {
                  Provider.of<MasbhaProvider>(context, listen: false).reset();
                },
                child: Container(
                  width: 156,
                  height: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: appColor,
                        width: 1.8,
                      )),
                  child:  Center(
                    child: Text(
                      'Reset all',
                      style: TextStyle(
                        color: appColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
