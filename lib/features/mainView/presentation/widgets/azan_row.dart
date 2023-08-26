
import 'package:flutter/material.dart';

import '../../../adzan/presentation/bloc/azan_bloc.dart';
import 'custom_azan_row.dart';

class RowPresentingAzanTimings extends StatelessWidget {
  const RowPresentingAzanTimings({
    super.key,
    required this.state
  });
  final AzanLoaded state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CustomRowElemnt(
                firstText: 'الشروق',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].sunrise),
            const SizedBox(width: 8),
            CustomRowElemnt(
                firstText: 'الفجر',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].fajr),
            const SizedBox(width: 8),
            CustomRowElemnt(
                firstText: 'الظهر',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].dhuhr),
            const SizedBox(width: 8),
            CustomRowElemnt(
                firstText: 'العصر',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].asr),
            const SizedBox(width: 8),
            CustomRowElemnt(
                firstText: 'الغروب',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].sunset),
            const SizedBox(width: 8),
            CustomRowElemnt(
                firstText: 'المغرب',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].maghrib),
            const SizedBox(width: 8),
            CustomRowElemnt(
                firstText: 'العشاء',
                secondText:
                    state.azanTimesModel[0][DateTime.now().day - 1].isha),
          ],
        ),
      ),
    );
  }
}