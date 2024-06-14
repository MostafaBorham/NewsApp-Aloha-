part of 'news_bloc.dart';

@immutable
abstract class NewsEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetAllNewsEvent extends NewsEvent{
  final NewsCategories newsType;

  GetAllNewsEvent({required this.newsType});

  @override
  List<Object?> get props => [
    newsType,
  ];
}

class FilterAllNewsEvent extends NewsEvent{
  final String? key;

  FilterAllNewsEvent({required this.key});

  @override
  List<Object?> get props => [
    key,
  ];
}