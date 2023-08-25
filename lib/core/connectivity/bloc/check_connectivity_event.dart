part of 'check_connectivity_bloc.dart';

@immutable
sealed class CheckConnectivityEvent {}

final class IntialConnectionEvent extends CheckConnectivityEvent {}

final class InternetConnectionEvent extends CheckConnectivityEvent {}

final class WifiConnectionEvent extends CheckConnectivityEvent {}

final class NoInternetConnectionEvent extends CheckConnectivityEvent {}
