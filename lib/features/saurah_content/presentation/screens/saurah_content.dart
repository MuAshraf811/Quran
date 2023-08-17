// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/constants.dart';

import '../bloc/all_ayahs_bloc.dart';

class SaurahContent extends StatelessWidget {
  const SaurahContent(
      {super.key,
      required this.name,
      required this.indexx,
      required this.ayahsNumber});
  final String name;
  final int indexx;
  final int ayahsNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 26,
            ),
          )),
      body: BlocConsumer<AllAyahsBloc, AllAyahsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingAyahs) {
            return const Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            );
          } else if (state is LoadedAyahs) {
            // return Center(
            //   child: Text(
            //     state.ayahs[0][1].text,
            //   ),
            // );
            return ListView.builder(
              itemCount: ayahsNumber,
              // state.ayahs[1].length,
              // separatorBuilder: (context, index) {
              //   return CircleAvatar(
              //     radius: 15,
              //     backgroundColor: appColor,
              //     child: CircleAvatar(
              //       radius: 14,
              //       backgroundColor: Colors.white,
              //       child: Text(
              //         state.ayahs[0][index].number.toString(),
              //         style: const TextStyle(
              //             color: appColor, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   );
              // },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: Text(
                  //   '${state.ayahs[indexx - 1][index].text}',
                  //   textAlign: TextAlign.end,
                  //   style: const TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: appColor,
                        child: CircleAvatar(
                          radius: 14.3,
                          backgroundColor: Colors.white,
                          child: Text(
                            state.ayahs[indexx - 1][index].number.toString(),
                            style: const TextStyle(
                                color: appColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        '${state.ayahs[indexx - 1][index].text}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is LoadingAyahsError) {
            return const Center(
              child: Text('Some thing went wrong while fetching ayahs'),
            );
          }
          return const Center(
            child: Text('bloc has been skipped'),
          );
        },
      ),
    );
  }
}
