part of 'qibla_cubit.dart';

@immutable
sealed class QiblaState {}

final class QiblaInitial extends QiblaState {}

final class LoadingQibla extends QiblaState {}

final class QiblaFetched extends QiblaState {
  final double dir;
  QiblaFetched({required this.dir});
}

final class QiblaError extends QiblaState {

  final String error;
  QiblaError({required this.error});
}
