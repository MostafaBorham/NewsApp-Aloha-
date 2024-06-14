import 'package:news_app_aloha/domain/entities/news.dart';

// ignore: must_be_immutable
class NewsModel extends News {
  NewsModel({
    super.description,
    super.title,
    super.image,
    super.publishedAt,
    super.source,
    super.webUrl,
  });

  factory NewsModel.fromJson(Map json) => NewsModel(
        source: json['source']['name'],
        title: json['title'],
        description: json['description'],
        webUrl: json['url'],
        publishedAt: json['publishedAt'],
        image: json['urlToImage'],
      );
}
