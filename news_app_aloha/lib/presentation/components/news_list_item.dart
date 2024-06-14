import 'package:flutter/material.dart';
import 'package:news_app_aloha/core/routing/app_routes.dart';
import 'package:news_app_aloha/domain/entities/news.dart';
import 'package:news_app_aloha/presentation/resources/app_images.dart';
import 'package:news_app_aloha/presentation/resources/app_responsive.dart';
import 'package:news_app_aloha/presentation/resources/app_styles.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    super.key,
    required this.news,
  });

  final News news;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.newsDetailsScreen,
            arguments: news);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                            news.image ?? AppImages.newsImagePlaceholder),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: AppStyles.getSemiBoldStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20.s()),
                  ),
                  Text(
                    news.publishedAt ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.getSemiBoldStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 17.s()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
