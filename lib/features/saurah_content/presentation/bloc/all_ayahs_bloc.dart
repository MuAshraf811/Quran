// ignore_for_file: unused_local_variable, unnecessary_import, depend_on_referenced_packages, unused_import

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/saurah_content/data/ayahs_remote.dart';
import 'package:quran/features/saurah_content/models/saurah_content_mode.dart';
part 'all_ayahs_event.dart';
part 'all_ayahs_state.dart';

class AllAyahsBloc extends Bloc<AllAyahsEvent, AllAyahsState> {
  final List<List<Ayahs>> blocList = [];
  AllAyahsBloc() : super(AllAyahsInitial()) {
    on<IntialEventToLoadAyas>((event, emit) async {
      emit(LoadingAyahs());
      try {
        final res = await AyahsRemote.fetchingAllAyahs();
        final List<dynamic> data = res['data']['surahs'];
        final List<List<dynamic>> delivred = [];
        final List<List<Ayahs>> finalAyahs = [];
        for (int i = 0; i <= data.length - 1; i++) {
          delivred.add(data[i]['ayahs']);
        }
        if (kDebugMode) {
          print(delivred);
        }
        for (int j = 0; j <= delivred.length - 1; j++) {
          final List<dynamic> response = delivred[j];
          finalAyahs.add(response.map((e) => Ayahs.fromJson(e)).toList());
        }
        emit(LoadedAyahs(ayahs: finalAyahs));
        
        if (kDebugMode) {
          print('Hello, this is it');
          print(finalAyahs);
          print(finalAyahs[0][0].text);
        }
        
      } catch (e) {
        emit(LoadingAyahsError(error: e.toString()));
        if (kDebugMode) {
          print(e.toString());
        }
      }

      // final res = await AyahsRemote.fetchingAllAyahs();
      // final List saurahRes = res['data']['surahs'];
      // final List aList = [];
      // for (int i = 0; i <= saurahRes.length - 1; i++) {
      //   aList.add(saurahRes[i]['ayahs']);
      // }
      // if (kDebugMode) {
      //   print('Hello , This Ayahs bloc which fetching data list of all ayahs');
      //   print(aList);
      // }
      // for (int x = 0; x <= aList.length-1 ; x++) {
      //   final List inner = aList[x];

      //   final sAyahs = inner.map((e) => Ayahs.fromJson(e)).toList();
      //   blocList.add(sAyahs);
      // }
     // emit(LoadedAyahs(ayahs: blocList));
      // allAyahs = aList.map((e) => Ayahs.fromJson(e)).toList();
    });
  }
}
