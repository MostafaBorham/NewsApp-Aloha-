import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_aloha/core/routing/app_routes.dart';
import 'package:news_app_aloha/presentation/controllers/app_configs/app_configs_bloc.dart';
import 'package:news_app_aloha/presentation/resources/app_responsive.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';
import 'package:news_app_aloha/presentation/resources/app_styles.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({super.key, this.leading, this.withSearch=true});

  final Widget? leading;
  final bool? withSearch;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AutoSizeText(AppStrings.appName,style: AppStyles.getBoldStyle(color: Theme.of(context).colorScheme.onBackground,fontSize: 25.w()),),
      leading: leading,
      actions: [
        withSearch!? IconButton(
          icon: const Icon(
            Icons.search,
          ),
          color: Theme.of(context).colorScheme.surface,
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.newsSearchScreen);
          },
        ) : const SizedBox.shrink(),

        BlocBuilder<AppConfigsBloc, AppConfigsState>(
            builder: (context, state) {
              return AppConfigsBloc.appMode == ThemeMode.dark
                  ? IconButton(
                icon: const Icon(
                  Icons.brightness_medium,
                ),
                onPressed: () {
                  AppConfigsBloc.getInstance(context).add(LightModeEvent());
                },
              )
                  : IconButton(
                onPressed: () {
                  AppConfigsBloc.getInstance(context).add(DarkModeEvent());
                },
                icon: const Icon(Icons.brightness_2),
              );
            }),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 50);
}
