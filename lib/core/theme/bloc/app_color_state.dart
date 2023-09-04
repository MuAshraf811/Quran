part of 'app_color_bloc.dart';

@immutable
sealed class AppColorState {}

final class AppColorInitial extends AppColorState {}
class PurpleColorState extends AppColorState{} 
class GreenColorState extends AppColorState{}
class BlueColorState extends AppColorState{}
