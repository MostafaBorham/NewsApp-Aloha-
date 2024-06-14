import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app_aloha/presentation/resources/app_responsive.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';
import 'package:news_app_aloha/presentation/resources/app_styles.dart';

class NotFoundComponent extends StatelessWidget {
  const NotFoundComponent({
    super.key, this.message=AppStrings.noNewsFound,
  });

  final String? message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AutoSizeText(
        message!,
        style: AppStyles.getSemiBoldStyle(
          fontSize: 20.s(),
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}