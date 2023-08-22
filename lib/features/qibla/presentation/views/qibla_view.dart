import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';
import 'package:quran/features/qibla/presentation/cubit/qibla_cubit.dart';

class QiblaView extends StatelessWidget {
  const QiblaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إتجاه القبلة'),
        centerTitle: true,
      ),
      body: BlocBuilder<QiblaCubit, QiblaState>(
        builder: (context, state) {
          if (state is LoadingQibla) {
            return const Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            );
          } else if (state is QiblaFetched) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.dir.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: appColor,
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: appColor),
                      ),
                      child: Center(
                        child: Transform.rotate(
                          angle: -state.dir - 1,
                          child: const Center(
                              child: Icon(
                            Icons.arrow_forward,
                            size: 100,
                            color: appColor,
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is QiblaError) {
            return Center(child: Text(state.error));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
