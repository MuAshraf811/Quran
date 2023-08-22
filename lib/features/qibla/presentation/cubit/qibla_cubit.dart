import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit() : super(QiblaInitial());
}
