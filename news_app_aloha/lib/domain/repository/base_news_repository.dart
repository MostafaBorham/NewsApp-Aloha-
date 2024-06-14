import 'package:dartz/dartz.dart';
import 'package:news_app_aloha/core/enums/news_categories.dart';
import 'package:news_app_aloha/core/errors/failures.dart';
import 'package:news_app_aloha/domain/entities/news.dart';

abstract class BaseNewsRepository {
  Future<Either<Failure, List<News>>> getAllNewsByCategory(
      {NewsCategories? type});

  Future<Either<Failure, List<News>>> filterAllNewsByKey({String? key});
}
