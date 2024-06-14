import 'package:flutter/material.dart';

class NewsListSeparator extends StatelessWidget {
  const NewsListSeparator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: Theme.of(context).colorScheme.surface,
    );
  }
}