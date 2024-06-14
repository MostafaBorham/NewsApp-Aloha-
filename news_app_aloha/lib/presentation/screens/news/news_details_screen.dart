import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/presentation/components/news_app_bar.dart';
import 'package:news_app_aloha/presentation/resources/app_images.dart';
import 'package:news_app_aloha/presentation/resources/app_responsive.dart';
import 'package:news_app_aloha/presentation/resources/app_strings.dart';
import 'package:news_app_aloha/presentation/resources/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key, required this.news});

  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) => Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                    image: NetworkImage(
                        news.image ?? AppImages.newsImagePlaceholder),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  news.title ?? '',
                  style: AppStyles.getBoldStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20.s()),
                ),
                const SizedBox(
                  height: 5,
                ),
                AutoSizeText(
                  news.description ?? '',
                  style: AppStyles.getSemiBoldStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15.s()),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        news.source ?? '',
                        style: AppStyles.getBoldStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 15.s()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        news.publishedAt ?? '',
                        style: AppStyles.getMediumStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 15.s()),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextButton.icon(
                          label: Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          onPressed: () async {
                            await launchUrl(Uri.parse(news.webUrl ?? ''));
                          },
                          icon: AutoSizeText(
                            AppStrings.visitSite,
                            style: AppStyles.getSemiBoldStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 20.s()),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
}
