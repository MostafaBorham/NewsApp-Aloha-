import 'package:dartz/dartz.dart';
import 'package:news_app_aloha/core/enums/news_categories.dart';
import 'package:news_app_aloha/core/errors/failures.dart';
import 'package:news_app_aloha/core/services/remote/dio/dio_constants.dart';
import 'package:news_app_aloha/core/services/remote/dio/dio_endpoints.dart';
import 'package:news_app_aloha/core/services/remote/dio/dio_helper.dart';
import 'package:news_app_aloha/data/models/news_model.dart';

abstract class BaseNewsDataSource {
  Future<Either<Failure, List<NewsModel>>> getAllNewsByCategory(
      {NewsCategories? type});
  Future<Either<Failure, List<NewsModel>>> filterAllNewsByKey({String? key});
}

class NewsApiDataSource extends BaseNewsDataSource {
  @override
  Future<Either<Failure, List<NewsModel>>> getAllNewsByCategory(
      {NewsCategories? type}) async {
    final response = await DioHelper.getNewsClient
        .get(DioEndpoints.getNewsEndpoint, queryParameters: {
      'country': DioConstants.newsCountryCode,
      'category': type!.name,
      'apiKey': DioConstants.newsApiKey,
    });
    if (response.statusCode == DioConstants.successStatusCode) {
      var newsMapList = response.data[DioConstants.newsArticlesKeyMap] as List;
      var newsModelList = newsMapList
          .map<NewsModel>(
            (newsMap) => NewsModel.fromJson(newsMap),
          )
          .toList();
      return Right(newsModelList);
    } else {
      return Left(Failure(message: response.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> filterAllNewsByKey(
      {String? key}) async {
    final response = await DioHelper.getNewsClient
        .get(DioEndpoints.filterNewsEndpoint, queryParameters: {
      'q': key,
      'apiKey': DioConstants.newsApiKey,
    });
    if (response.statusCode == DioConstants.successStatusCode) {
      var newsMapList = response.data[DioConstants.newsArticlesKeyMap] as List;
      var newsModelList = newsMapList
          .map<NewsModel>(
            (newsMap) => NewsModel.fromJson(newsMap),
          )
          .toList();
      return Right(newsModelList);
    } else {
      return Left(Failure(message: response.statusMessage));
    }
  }
}
