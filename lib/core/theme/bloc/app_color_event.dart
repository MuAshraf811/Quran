part of 'app_color_bloc.dart';

@immutable
sealed class AppColorEvent {}
class GreenColorEvent extends AppColorEvent{} 
class BlueColorEvent extends AppColorEvent{} 
class PurpleColorEvent extends AppColorEvent{}
