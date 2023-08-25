part of 'check_connectivity_bloc.dart';

@immutable
sealed class CheckConnectivityState {}

final class CheckConnectivityInitial extends CheckConnectivityState {}

final class MobileDataConnectionState extends CheckConnectivityState {}

final class WifiConnectionState extends CheckConnectivityState {}

final class NoInternetConnectionState extends CheckConnectivityState {}

final class WrongWhileCheckingState extends CheckConnectivityState {}

final class CheckingConnectionState extends CheckConnectivityState {}
