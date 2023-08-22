import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/qibla/presentation/cubit/qibla_cubit.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<QiblaCubit, QiblaState>(
        builder: (context, state) {
          if (state is LoadingQibla) {
            return const Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            );
          } else if (state is QiblaFetched) {
            return Center(child: Text(state.dir.toString()));
          } else if (state is QiblaError) {
            return Center(child: Text(state.error));
          }
          return const SizedBox() ;
        },
      ),
    );
  }
}
