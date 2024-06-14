import 'package:flutter/material.dart';

class NewsSubViewsGenerator extends StatelessWidget {
  const NewsSubViewsGenerator(
      {super.key,
        required this.newsViews, required this.currentViewIndex});

  final List<WidgetBuilder> newsViews;
  final int currentViewIndex;
  @override
  Widget build(BuildContext context) {
    return newsViews[currentViewIndex](context);
  }
}