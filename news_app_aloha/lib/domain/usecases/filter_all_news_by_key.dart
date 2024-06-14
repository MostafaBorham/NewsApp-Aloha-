import 'package:dartz/dartz.dart';
import 'package:news_app_aloha/core/errors/failures.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/domain/repository/base_news_repository.dart';

class FilterAllNewsByKeyUseCase {
  final BaseNewsRepository baseNewsRepository;

  FilterAllNewsByKeyUseCase({required this.baseNewsRepository});

  Future<Either<Failure, List<News>>> call({String? key}) async {
    return await baseNewsRepository.filterAllNewsByKey(key: key);
  }
}
