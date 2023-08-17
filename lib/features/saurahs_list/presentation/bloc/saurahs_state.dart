part of 'saurahs_bloc.dart';

@immutable
sealed class SaurahsState {}

final class SaurahsInitial extends SaurahsState {}

class FetchingSaurahs extends SaurahsState {}

class FetchingSaurahsDone extends SaurahsState {
  final List<DataModel> list;
  FetchingSaurahsDone({required this.list});
}

class FetchingSaurahsError extends SaurahsState {}
