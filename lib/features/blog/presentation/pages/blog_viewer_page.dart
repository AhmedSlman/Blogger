import 'package:blogger/core/functions/calculate_reading_time.dart';
import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/functions/format_date.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/core/utils/app_colors.dart';
import 'package:blogger/core/utils/app_styles.dart';
import 'package:blogger/features/blog/domain/entities/blog_entity.dart';
import 'package:flutter/material.dart';

class BlogViewerPage extends StatelessWidget {
  static route(Blog blog) =>
      MaterialPageRoute(builder: (context) => BlogViewerPage(blog: blog));
  const BlogViewerPage({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              customReplacementNavigate(context, RouterNames.blogPage);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: AppStyles.s24,
                ),
                const SizedBox(height: 20),
                Text(
                  "By ${blog.posterName}",
                  style: AppStyles.s16,
                ),
                const SizedBox(height: 5),
                Text(
                  '${formatDateBydMMMYYYY(blog.updatedAt)} . ${calculateReadingTime(blog.title)} min',
                  style: AppStyles.s16.copyWith(
                      color: AppColors.greyColor, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(blog.imageUrl),
                ),
                const SizedBox(height: 20),
                Text(
                  blog.content,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
