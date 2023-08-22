import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/adzan/data/azan_remote.dart';

import '../../model/adzan_model.dart';

part 'azan_event.dart';
part 'azan_state.dart';

class AzanBloc extends Bloc<AzanEvent, AzanState> {
  AzanBloc() : super(AzanInitial()) {
    on<FetchingEvent>((event, emit) async {
      emit(AzanLoading());
      try {
        final Map<String, dynamic> res = await AzanRemote.fetchingData();
        final List<dynamic> listOfTimes = res['data'];
        final List<List<AzanModel>> finalRes = [];
        final List<String> meladi = [];
        final List<String> hejri = [];
        finalRes.add(
            listOfTimes.map((e) => AzanModel.fromJson(e['timings'])).toList());
        print(finalRes[0].length);
        print('dsdsds');

        if (kDebugMode) {
          print(finalRes);
          print(meladi);
          print(hejri);
        }
        emit(AzanLoaded(
          azanTimesModel: finalRes,
        ));
      } catch (e) {
        emit(AzanError(error: e.toString()));
      }
    });
  }
}
