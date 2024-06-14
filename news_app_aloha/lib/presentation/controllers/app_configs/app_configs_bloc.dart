import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_aloha/core/services/local/cache_helper.dart';


part 'app_configs_event.dart';
part 'app_configs_state.dart';

class AppConfigsBloc extends Bloc<AppConfigsEvent, AppConfigsState> {
  static late ThemeMode appMode;

  static AppConfigsBloc getInstance(BuildContext context) =>
      BlocProvider.of<AppConfigsBloc>(context);

  AppConfigsBloc() : super(AppConfigsInitial()) {
    on<LightModeEvent>(_setLightMode);
    on<DarkModeEvent>(_setDarkMode);
  }

  Future<FutureOr<void>> _setLightMode(
      LightModeEvent event, Emitter<AppConfigsState> emit) async {
    appMode = ThemeMode.light;
    await CacheHelper.saveAppMode(mode: appMode).then((value) {
      emit(LightModeState());
    });
  }

  Future<FutureOr<void>> _setDarkMode(
      DarkModeEvent event, Emitter<AppConfigsState> emit) async {
    appMode = ThemeMode.dark;
    await CacheHelper.saveAppMode(mode: appMode);
    emit(DarkModeState());
  }
}
