import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app_aloha/app_init.dart';
import 'package:news_app_aloha/core/services/local/app_injector.dart';
import 'package:news_app_aloha/core/services/local/cache_helper.dart';
import 'package:news_app_aloha/core/services/remote/dio/dio_helper.dart';

import 'presentation/controllers/app_configs/app_configs_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInjector.init();
  DioHelper.init();
  await CacheHelper.init();
  DioHelper.init();
  AppConfigsBloc.appMode = CacheHelper.getAppMode();

  ///init App Mode
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const NewsApp()));
}
