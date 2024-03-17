import 'package:blogger/core/functions/calculate_reading_time.dart';
import 'package:blogger/core/utils/app_styles.dart';
import 'package:blogger/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/blog_entity.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
    required this.color,
  });
  final Blog blog;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, BlogViewerPage.route(blog));
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(16).copyWith(bottom: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: blog.topics
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                label: Text(e),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          )
                          .toList()),
                ),
                Text(
                  blog.title,
                  style: AppStyles.s22,
                ),
              ],
            ),
            Text("${calculateReadingTime(blog.title)} min"),
          ],
        ),
      ),
    );
  }
}
