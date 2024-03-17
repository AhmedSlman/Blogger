import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/functions/show_snackbar.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/core/utils/app_colors.dart';
import 'package:blogger/core/widgets/loading_widget.dart';
import 'package:blogger/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:blogger/features/blog/presentation/widgets/blog_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(BlogFetchAllBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: const Text("Blogger"),
        actions: [
          IconButton(
            onPressed: () {
              customNavigate(context, RouterNames.addNewBlogPage);
            },
            icon: const Icon(CupertinoIcons.add_circled),
          )
        ],
      ),
      body: BlocConsumer<BlogBloc, BlogState>(
        listener: (BuildContext context, Object? state) {
          if (state is BlogFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is BlogLoading) {
            return const LoaderWidget();
          }
          if (state is BlogDisplaySuccess) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return BlogCard(
                  blog: blog,
                  color: index % 3 == 0
                      ? AppColors.gradient1
                      : index % 3 == 1
                          ? AppColors.gradient2
                          : AppColors.gradient3,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
