import 'package:flutter/cupertino.dart';
import 'package:news_app_aloha/core/routing/app_routes.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/presentation/screens/news/news_details_screen.dart';
import 'package:news_app_aloha/presentation/screens/news/news_screen.dart';
import 'package:news_app_aloha/presentation/screens/news/news_search_screen.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.newsScreen:
      return CupertinoPageRoute(builder: (_) => const NewsScreen());
    ////////////////////////////////////////////////////////////////
    case AppRoutes.newsSearchScreen:
      return CupertinoPageRoute(builder: (_) => const NewsSearchScreen());
    ////////////////////////////////////////////////////////////////
    case AppRoutes.newsDetailsScreen:
      return CupertinoPageRoute(
          builder: (_) => NewsDetailsScreen(
                news: (settings.arguments as News),
              ));
    ////////////////////////////////////////////////////////////////
    default:
      return CupertinoPageRoute(builder: (_) => const SizedBox.shrink());
  }
}
