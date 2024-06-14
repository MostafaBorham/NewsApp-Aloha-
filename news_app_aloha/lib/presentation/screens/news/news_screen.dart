// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:news_app_aloha/presentation/components/news_app_bar.dart';
import 'package:news_app_aloha/presentation/components/news_sub_views_generator.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';
import 'package:news_app_aloha/presentation/screens/news/sub_news_views/business_news_view.dart';
import 'package:news_app_aloha/presentation/screens/news/sub_news_views/technology_news_view.dart';
import 'package:news_app_aloha/presentation/screens/news/sub_news_views/sports_news_view.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int _currentNewsViewIndex = 0;

  final List<BottomNavigationBarItem> _newsBottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_sharp,
      ),
      label: AppStrings.businessCategory,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: AppStrings.sportsCategory,
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.laptop,
      ),
      label: AppStrings.technologyCategory,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildBody(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _newsBottomBarItems,
      currentIndex: _currentNewsViewIndex,
      onTap: (index) {
        setState(() {
          _currentNewsViewIndex = index;
        });
      },
    );
  }

  Widget _buildBody() {
    return NewsSubViewsGenerator(newsViews: [
      (context) => const BusinessNewsView(),
      (context) => const SportsNewsView(),
      (context) => const TechnologyNewsView(),
    ], currentViewIndex: _currentNewsViewIndex);
  }
}
