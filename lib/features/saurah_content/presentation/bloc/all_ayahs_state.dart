part of 'all_ayahs_bloc.dart';

@immutable
sealed class AllAyahsState {}

final class AllAyahsInitial extends AllAyahsState {}

final class LoadingAyahs extends AllAyahsState {}

final class LoadedAyahs extends AllAyahsState {
  final List<List<Ayahs>> ayahs;
  LoadedAyahs({required this.ayahs});
}

final class LoadingAyahsError extends AllAyahsState {
  final String error;
  LoadingAyahsError({required this.error});
}
