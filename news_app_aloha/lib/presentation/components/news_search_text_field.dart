import 'package:flutter/material.dart';
import 'package:news_app_aloha/presentation/resources/app_responsive.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';
import 'package:news_app_aloha/presentation/resources/app_styles.dart';

class NewsSearchTextField extends StatelessWidget {
  const NewsSearchTextField({
    super.key,
    this.onChanged,
  });
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: Theme.of(context).colorScheme.surface,
      style: AppStyles.getSemiBoldStyle(
          color: Theme.of(context).colorScheme.onBackground, fontSize: 20.s()),
      decoration: InputDecoration(
        labelText: AppStrings.newsSearch,
        labelStyle: AppStyles.getSemiBoldStyle(
            color: Theme.of(context).colorScheme.onSurface, fontSize: 20.s()),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.onBackground,
        ),
        enabledBorder: _buildBorder(Theme.of(context).colorScheme.onSurface),
        focusedBorder: _buildBorder(Theme.of(context).colorScheme.surface),
      ),
      keyboardType: TextInputType.text,
    );
  }

  InputBorder _buildBorder(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: 2,
      ));
}
