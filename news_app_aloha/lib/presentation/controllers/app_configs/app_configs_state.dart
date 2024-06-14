part of 'app_configs_bloc.dart';

@immutable
abstract class AppConfigsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppConfigsInitial extends AppConfigsState {}

class EnglishLocaleState extends AppConfigsState {}

class ArabicLocaleState extends AppConfigsState {}

class LightModeState extends AppConfigsState {}

class DarkModeState extends AppConfigsState {}
