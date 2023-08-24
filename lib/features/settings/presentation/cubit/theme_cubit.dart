import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/core/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool value = false;

  controllingTheme() async {
    if (CacheHelper.getBoolValue('theme') != null) {
      if (CacheHelper.getBoolValue('theme')) {
        emit(DarkTheme());
      } else {
        emit(LightTheme());
      }
    } else {
      emit(LightTheme());
    }

    // if (value == true) {
    //   CacheHelper.saveBoolValue('theme' , value);
    //   emit(DarkTheme());
    // } else {
    //    CacheHelper.saveBoolValue('theme' , value);
    //   emit(LightTheme());
    // }
  }
}
