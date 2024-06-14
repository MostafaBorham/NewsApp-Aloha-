import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_aloha/core/enums/news_categories.dart';
import 'package:news_app_aloha/core/services/local/app_injector.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/domain/usecases/filter_all_news_by_key.dart';
import 'package:news_app_aloha/domain/usecases/get_all_news_by_category.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final _getAllNewsByCategoryUseCase =
      AppInjector.instance<GetAllNewsByCategoryUseCase>();
  final _filterAllNewsByKeyUseCase =
      AppInjector.instance<FilterAllNewsByKeyUseCase>();
  List<News> businessNewsList = [];
  List<News> technologyNewsList = [];
  List<News> sportsNewsList = [];
  List<News> filterNewsList = [];
  static NewsBloc getInstance(BuildContext context) =>
      BlocProvider.of<NewsBloc>(context);

  NewsBloc() : super(NewsInitial()) {
    on<GetAllNewsEvent>(_getAllNewsByCategory);
    on<FilterAllNewsEvent>(_filterAllNewsByKey);
  }

  FutureOr<void> _getAllNewsByCategory(
      GetAllNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingAllNewsState());
    final newsResult = await _getAllNewsByCategoryUseCase(type: event.newsType);

    newsResult.fold(
      (failure) {
        emit(FailGetAllNewsState(
            failMessage: failure.message ?? AppStrings.error));
      },
      (newsList) {
        switch (event.newsType) {
          case NewsCategories.business:
            {
              businessNewsList = newsList;
              break;
            }
          case NewsCategories.technology:
            {
              technologyNewsList = newsList;
              break;
            }
          case NewsCategories.sports:
            {
              sportsNewsList = newsList;
              break;
            }
        }
        emit(SuccessGetAllNewsState());
      },
    );
  }

  FutureOr<void> _filterAllNewsByKey(
      FilterAllNewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadFilteringAllNewsState());
    final newsResult = await _filterAllNewsByKeyUseCase(key: event.key);

    newsResult.fold(
      (failure) {
        emit(FailFilterAllNewsState(
            failMessage: failure.message ?? AppStrings.error));
      },
      (newsList) {
        filterNewsList = newsList;
        emit(SuccessFilterAllNewsState());
      },
    );
  }
}
