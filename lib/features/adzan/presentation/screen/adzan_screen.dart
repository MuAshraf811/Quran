import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';

import '../bloc/azan_bloc.dart';

class AdzanScreen extends StatelessWidget {
  const AdzanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('مواقيت الصلاة'),
          centerTitle: true,
        ),
        body: BlocConsumer<AzanBloc, AzanState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AzanLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: appColor,
                ),
              );
            } else if (state is AzanLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(4),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(color: appColor),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${index + 1}/${DateTime.now().month}/${DateTime.now().year}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'صلاة الفجر ${state.azanTimesModel[0][index].fajr}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' الشروق  ${state.azanTimesModel[0][index].sunrise}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'صلاة الظهر ${state.azanTimesModel[0][index].dhuhr}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'صلاة العصر ${state.azanTimesModel[0][index].asr}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'الغروب  ${state.azanTimesModel[0][index].sunset}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'صلاة المغرب ${state.azanTimesModel[0][index].maghrib}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'صلاة العشاء${state.azanTimesModel[0][index].isha}',
                                style: const TextStyle(
                                    color: appColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            endIndent: 48,
                            indent: 48,
                            color: Colors.black,
                            thickness: 1,
                          ),
                      itemCount: state.azanTimesModel[0].length),
                ),
              );
            } else if (state is AzanError) {
              return Center(
                child: Text(state.error),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
