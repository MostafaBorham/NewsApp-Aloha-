import 'package:news_app_aloha/data/models/news_model.dart';
import 'package:news_app_aloha/domain/entities/news.dart';

extension NewsModelExt on NewsModel {
  News toEntity() => News(
        image: image,
        publishedAt: publishedAt,
        webUrl: webUrl,
        title: title,
        source: source,
        description: description,
      );
}

extension NewsExt on News {
  NewsModel toModel() => NewsModel(
        image: image,
        publishedAt: publishedAt,
        webUrl: webUrl,
        title: title,
        source: source,
        description: description,
      );
}
