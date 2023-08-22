// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/qibla/data/remote_getQibla.dart';

import '../../data/geolocator.dart';

part 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit() : super(QiblaInitial());

  getQiblaDirction() async {
    emit(LoadingQibla());
    try {
      GPS.checkServicesLocation();

      GPS.askPermission();

      // Future.delayed(const Duration(seconds: 3), () {
      //   if (kDebugMode) {
      //     print(GPS.myDevPos!.longitude);
      //     print(GPS.myDevPos!.latitude);
      //   }
      // });
      // await RemoteGetQiblaDirection.getQiblaDirection();
      final double dir = await RemoteGetQiblaDirection.getQiblaDirection();
     
      emit(QiblaFetched(dir: dir));
    } catch (e) {
      emit(QiblaError(error: e.toString()));
    }
  }
}
