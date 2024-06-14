import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_aloha/core/services/local/app_injector.dart';
import 'package:news_app_aloha/presentation/components/circular_loader.dart';
import 'package:news_app_aloha/presentation/components/news_app_bar.dart';
import 'package:news_app_aloha/presentation/components/news_list.dart';
import 'package:news_app_aloha/presentation/components/news_search_text_field.dart';
import 'package:news_app_aloha/presentation/components/not_found_component.dart';
import 'package:news_app_aloha/presentation/controllers/news/news_bloc.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';

class NewsSearchScreen extends StatelessWidget {
  const NewsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) =>
          AppInjector.instance<NewsBloc>()..add(FilterAllNewsEvent(key: 'all')),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const NewsAppBar(
              withSearch: false,
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, NewsState state) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            NewsSearchTextField(
              onChanged: (inputKey) {
                NewsBloc.getInstance(context)
                    .add(FilterAllNewsEvent(key: inputKey));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ConditionalBuilder(
              condition: state is! LoadFilteringAllNewsState,
              builder: (context) => ConditionalBuilder(
                condition:
                    NewsBloc.getInstance(context).filterNewsList.isNotEmpty,
                builder: (context) {
                  return NewsList(
                    newsList: NewsBloc.getInstance(context).filterNewsList,
                  );
                },
                fallback: (context) => NotFoundComponent(
                  message: state is FailFilterAllNewsState
                      ? state.failMessage
                      : AppStrings.noNewsFound,
                ),
              ),
              fallback: (context) => const CircularLoader(),
            ))
          ],
        ),
      );
}
