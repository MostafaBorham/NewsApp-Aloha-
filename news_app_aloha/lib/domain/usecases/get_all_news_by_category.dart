import 'package:dartz/dartz.dart';
import 'package:news_app_aloha/core/enums/news_categories.dart';
import 'package:news_app_aloha/core/errors/failures.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/domain/repository/base_news_repository.dart';

class GetAllNewsByCategoryUseCase {
  final BaseNewsRepository baseNewsRepository;

  GetAllNewsByCategoryUseCase({required this.baseNewsRepository});

  Future<Either<Failure, List<News>>> call({NewsCategories? type}) async {
    return await baseNewsRepository.getAllNewsByCategory(type: type);
  }
}
