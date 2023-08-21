part of 'azan_bloc.dart';

@immutable
sealed class AzanState {}

final class AzanInitial extends AzanState {}

class AzanLoading extends AzanState {}

class AzanLoaded extends AzanState {
  final List<List<AzanModel>> azanTimesModel;
  AzanLoaded({required this.azanTimesModel});

}

class AzanError extends AzanState {
  final String error;
  AzanError({required this.error});
}
