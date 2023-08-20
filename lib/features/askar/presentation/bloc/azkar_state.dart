part of 'azkar_bloc.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarLoaded extends AzkarState {
  final List<AzkarModel> azkarSabah;
  final List<AzkarModel> azkarMasaa;
  final List<AzkarModel> azkarSala;
  AzkarLoaded(
      {required this.azkarSabah,
      required this.azkarMasaa,
      required this.azkarSala});
}

final class AzkarLoadingError extends AzkarState {
  final String error;
  AzkarLoadingError({required this.error});
}
