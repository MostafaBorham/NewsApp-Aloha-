import 'package:flutter/material.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/presentation/components/news_list_item.dart';
import 'package:news_app_aloha/presentation/components/news_list_separator.dart';
import 'package:news_app_aloha/presentation/resources/app_responsive.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
    required this.newsList,
  });

  final List<News> newsList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsListItem(
              news: newsList[index],
            ),
        separatorBuilder: (context, index) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 15.w(), vertical: 10.w()),
              child: const NewsListSeparator(),
            ),
        itemCount: newsList.length);
  }
}
