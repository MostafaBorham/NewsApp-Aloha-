import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_aloha/core/routing/app_routes.dart';
import 'package:news_app_aloha/core/routing/router.dart';
import 'package:news_app_aloha/core/services/local/app_injector.dart';
import 'package:news_app_aloha/presentation/controllers/news/news_bloc.dart';
import 'presentation/controllers/app_configs/app_configs_bloc.dart';
import 'presentation/resources/app_responsive.dart';
import 'presentation/resources/app_strings.dart';
import 'presentation/resources/app_themes.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Responsive Init
    AppResponsive.context = context;

    ///init bloc providers
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppInjector.instance<NewsBloc>()),
        BlocProvider(
            create: (context) => AppInjector.instance<AppConfigsBloc>()),
      ],
      child: BlocBuilder<AppConfigsBloc, AppConfigsState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.getLightModeTheme(),
            darkTheme: AppThemes.getDarkModeTheme(),
            themeMode: AppConfigsBloc.appMode,
            onGenerateRoute: onGenerate,
            initialRoute: AppRoutes.newsScreen,
          );
        },
      ),
    );
  }
}
