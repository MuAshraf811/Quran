import 'package:flutter/material.dart';
import 'package:quran/features/askar/presentation/bloc/azkar_bloc.dart';

import '../../../../core/constants.dart';

class ZekrMasa extends StatelessWidget {
  const ZekrMasa({super.key, required this.state ,});
  final AzkarLoaded state;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 12, left: 12, bottom: 24),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemCount: state.azkarMasaa.length,
        itemBuilder: (context, index) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.all(8),
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: appColor,
                    )),
                child: Column(
                  children: [
                    Text(
                      state.azkarMasaa[index].zekr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: appColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      endIndent: 16,
                      indent: 16,
                      color: appColor,
                      thickness: 1,
                    ),
                    Text(
                      '  ${state.azkarMasaa[index].bless.toString()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      endIndent: 16,
                      indent: 16,
                      color: appColor,
                      thickness: 1,
                    ),
                    Text(
                      'التكرار :${state.azkarMasaa[index].repeat.toString()}',
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: appColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
