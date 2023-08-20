import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/askar/data/azkar_masaa.dart';
import 'package:quran/features/askar/data/azkar_sabah.dart';
import 'package:quran/features/askar/data/azkar_sala.dart';

import '../../model/azkar_model.dart';

part 'azkar_event.dart';
part 'azkar_state.dart';

class AzkarBloc extends Bloc<AzkarEvent, AzkarState> {
  AzkarBloc() : super(AzkarInitial()) {
    on<FetchingEvent>((event, emit) async {
      emit(AzkarLoading());
      try {
        final Map<String, dynamic> res1 =
            await FetchingAzkarSabah.fetchingData();
            final List<dynamic> p = res1['content'];
        List<AzkarModel> sabah =
            p.map((e) => AzkarModel.fromJson(e)).toList();
        final Map<String, dynamic> res2 =
            await FetchingAzkarMasaa.fetchingData();
        final List<dynamic> s = res2['content'];
        List<AzkarModel> masaa =
            s.map((e) => AzkarModel.fromJson(e)).toList();
        final Map<String, dynamic> res3 =
            await FetchingAzkarSala.fetchingData();
            final List<dynamic> d = res3['content'];
        List<AzkarModel> sala =
            d.map((e) => AzkarModel.fromJson(e)).toList();

        emit(
            AzkarLoaded(azkarSabah: sabah, azkarMasaa: masaa, azkarSala: sala));
      } catch (e) {
        emit(AzkarLoadingError(error: e.toString()));
      }
    });
  }
}
