import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/askar/presentation/bloc/azkar_bloc.dart';
import 'package:quran/features/askar/presentation/widgets/zekr_data_sabah.dart';
import 'package:quran/features/askar/presentation/widgets/zekr_masaa.dart';
import 'package:quran/features/askar/presentation/widgets/zekr_sala.dart';

class ZekrScreen extends StatelessWidget {
  ZekrScreen({super.key, required this.indx});
  final int indx;
  final List<String> title = ['أذكار الصباح', 'أذكار المساء', 'أذكار الصلاة'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(title[indx]),
        centerTitle: true,
      ),
      body: BlocConsumer<AzkarBloc, AzkarState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AzkarLoading) {
            return  Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            );
          } else if (state is AzkarLoaded) {
            switch (indx) {
              case 0:
                {
                  return ZekrSobah(state: state);
                }

              case 1:
                {
                  return ZekrMasa(state: state);
                }
              case 2:
                {
                  return ZekrSala(state: state);
                }
              default:
                {
                  return ZekrSala(state: state);
                }
            }
          } else if (state is AzkarLoadingError) {
            return Center(
                child: Text(
              state.error,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
