import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app_aloha/data/datasources/news_datasource.dart';
import 'package:news_app_aloha/data/repository/news_repository.dart';
import 'package:news_app_aloha/domain/repository/base_news_repository.dart';
import 'package:news_app_aloha/domain/usecases/filter_all_news_by_key.dart';
import 'package:news_app_aloha/domain/usecases/get_all_news_by_category.dart';
import 'package:news_app_aloha/presentation/controllers/app_configs/app_configs_bloc.dart';
import 'package:news_app_aloha/presentation/controllers/news/news_bloc.dart';

abstract class AppInjector {
  static final instance = GetIt.instance;

  static void init() {
    ///Blocs
    ///-> NewsBloc
    instance.registerFactory<NewsBloc>(() => NewsBloc());

    ///-> AppConfigsBloc
    instance.registerLazySingleton<AppConfigsBloc>(() => AppConfigsBloc());

    ///DataSources
    ///->News Api DataSource
    instance
        .registerLazySingleton<NewsApiDataSource>(() => NewsApiDataSource());

    ///Repositories
    ///->News Repository
    instance.registerLazySingleton<BaseNewsRepository>(() =>
        NewsRepository(baseNewsDataSource: instance<NewsApiDataSource>()));

    ///UseCases
    ///->GetAllNewsByCategory UseCase
    instance.registerLazySingleton<GetAllNewsByCategoryUseCase>(() =>
        GetAllNewsByCategoryUseCase(
            baseNewsRepository: instance<BaseNewsRepository>()));

    ///->FilterAllNewsByKey UseCase
    instance.registerLazySingleton<FilterAllNewsByKeyUseCase>(() =>
        FilterAllNewsByKeyUseCase(
            baseNewsRepository: instance<BaseNewsRepository>()));

    ///Network Connection
    instance.registerLazySingleton<InternetConnectionChecker>(
        () => InternetConnectionChecker());
  }
}
