import 'package:flutter/material.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/Masbha/presentation/views/masbha.dart';
import 'package:quran/features/askar/presentation/views/main_azkar_view.dart';
import 'package:quran/features/mainView/presentation/widgets/custom_grid_elemnt.dart';

import '../../../saurahs_list/presentation/view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(),
        ),
        GridView.builder(
          itemCount: gridInformation.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (index == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AllSaurahs(),
                  ));
                } else if (index == 3) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Masbha(),
                  ));
                }else if (index == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  MainAzkarView(),
                  ));
                }
              },
              child: CustomGridElemnt(
                indx: index,
              ),
            );
          },
        ),
      ],
    );
  }
}
