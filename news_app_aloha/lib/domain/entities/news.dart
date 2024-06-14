import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class News extends Equatable {
  String? source;
  String? title;
  String? description;
  String? webUrl;
  String? image;
  String? publishedAt;


  News({this.source, this.title, this.description, this.webUrl, this.image,
      this.publishedAt});

  News copyWith(
      {String? newSource,
      String? newTitle,
      String? newDescription,
      String? newWebUrl,
      String? newImage,
      String? newPublishedAt,}) =>
      News(
        description: newDescription,
        image: newImage,
        publishedAt: newPublishedAt,
        source: newSource,
        title: newTitle,
        webUrl: newWebUrl,
      );

  @override
  List<Object?> get props => [
   source,
   title,
   description,
   webUrl,
   image,
   publishedAt,
  ];
}
