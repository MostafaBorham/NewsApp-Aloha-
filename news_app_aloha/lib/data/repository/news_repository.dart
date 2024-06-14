import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app_aloha/core/connection/connection_checker.dart';
import 'package:news_app_aloha/core/enums/news_categories.dart';
import 'package:news_app_aloha/core/errors/failures.dart';
import 'package:news_app_aloha/data/datasources/news_datasource.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/domain/repository/base_news_repository.dart';

class NewsRepository extends BaseNewsRepository {
  final BaseNewsDataSource baseNewsDataSource;

  NewsRepository({required this.baseNewsDataSource});

  @override
  Future<Either<Failure, List<News>>> getAllNewsByCategory(
      {NewsCategories? type}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final newsResult =
            await baseNewsDataSource.getAllNewsByCategory(type: type);
        return newsResult;
      } on DioException catch (e, _) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<News>>> filterAllNewsByKey({String? key}) async {
    if (await ConnectionChecker.isConnected) {
      try {
        final newsResult =
            await baseNewsDataSource.filterAllNewsByKey(key: key);
        return newsResult;
      } on DioException catch (e, _) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
