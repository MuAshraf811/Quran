import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quran/core/cache_helper.dart';


part 'app_color_event.dart';
part 'app_color_state.dart';

class AppColorBloc extends Bloc<AppColorEvent, AppColorState> {
  AppColorBloc() : super(AppColorInitial()) {
    on<IntialColorEvent>((event, emit) {
      if (CacheHelper.getIntValue('appcolor') == 0) {
        emit(BlueColorState());
      } else if (CacheHelper.getIntValue('appcolor') == 1) {
        emit(GreenColorState());
      } else {
        emit(PurpleColorState());
      }
    });
    on<GreenColorEvent>((event, emit) {
      emit(GreenColorState());
    });

    on<PurpleColorEvent>(
      (event, emit) {
        emit(PurpleColorState());
      },
    );
    on<BlueColorEvent>(
      (event, emit) {
        emit(BlueColorState());
      },
    );
  }
}
