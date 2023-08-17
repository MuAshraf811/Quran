import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'move_betwwen_screens_in_bottom_bar_state.dart';

class MoveBetwwenScreensInBottomBarCubit
    extends Cubit<MoveBetwwenScreensInBottomBarState> {
  MoveBetwwenScreensInBottomBarCubit()
      : super(MoveBetwwenScreensInBottomBarInitial());

  int index = 0;

  indexControle(int current) {
    index = current;
  
    emit(ChangeIndex());
  }
}
