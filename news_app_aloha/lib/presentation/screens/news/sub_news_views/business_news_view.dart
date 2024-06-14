// ignore_for_file: file_names
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_aloha/core/enums/news_categories.dart';
import 'package:news_app_aloha/core/services/local/app_injector.dart';
import 'package:news_app_aloha/presentation/components/circular_loader.dart';
import 'package:news_app_aloha/presentation/components/news_list.dart';
import 'package:news_app_aloha/presentation/components/not_found_component.dart';
import 'package:news_app_aloha/presentation/controllers/news/news_bloc.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';

class BusinessNewsView extends StatelessWidget {
  const BusinessNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => AppInjector.instance<NewsBloc>()
        ..add(GetAllNewsEvent(newsType: NewsCategories.business)),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              NewsBloc.getInstance(context)
                  .add(GetAllNewsEvent(newsType: NewsCategories.business));
            },
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: ConditionalBuilder(
              condition: state is! LoadingAllNewsState,
              builder: (context) => ConditionalBuilder(
                condition:
                    NewsBloc.getInstance(context).businessNewsList.isNotEmpty,
                builder: (context) {
                  return NewsList(
                    newsList: NewsBloc.getInstance(context).businessNewsList,
                  );
                },
                fallback: (context) => NotFoundComponent(
                  message: state is FailGetAllNewsState
                      ? state.failMessage
                      : AppStrings.noNewsFound,
                ),
              ),
              fallback: (context) => const CircularLoader(),
            ),
          );
        },
      ),
    );
  }
}
