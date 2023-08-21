part of 'azan_bloc.dart';

@immutable
sealed class AzanEvent {}
final class FetchingEvent extends AzanEvent{}
