import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:quran/core/constants.dart';

part 'app_color_event.dart';
part 'app_color_state.dart';

class AppColorBloc extends Bloc<AppColorEvent, AppColorState> {
  AppColorBloc() : super(AppColorInitial()) {
    on<GreenColorEvent>((event, emit) {
      appColor = Colors.green;
      emit(GreenColorState());
    });

    on<PurpleColorEvent>(
      (event, emit) {
        appColor = Colors.purple;
        emit(PurpleColorState());
      },
    );
    on<BlueColorEvent>(
      (event, emit) {
        appColor =const Color.fromARGB(255, 9, 78, 135);
        emit(BlueColorState());
      },
    );
  }
}
