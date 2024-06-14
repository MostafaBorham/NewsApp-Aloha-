part of 'app_configs_bloc.dart';

@immutable
abstract class AppConfigsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeAppLocaleEvent extends AppConfigsEvent {
  final BuildContext context;

  ChangeAppLocaleEvent(this.context);

  @override
  List<Object?> get props => [
        context,
      ];
}

class LightModeEvent extends AppConfigsEvent {}

class DarkModeEvent extends AppConfigsEvent {}