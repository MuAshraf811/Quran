import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool value = false;
  controllingTheme() {
    if (value == true) {
      emit(DarkTheme());
    } else {
      emit(LightTheme());
    }
  }
}
