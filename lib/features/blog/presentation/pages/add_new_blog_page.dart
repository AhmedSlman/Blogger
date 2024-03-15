// ignore_for_file: sized_box_for_whitespace

import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:blogger/features/blog/presentation/widgets/blog_editor.dart';
import 'package:flutter/material.dart';

import '../widgets/topic_sroll_widget.dart';
import '../widgets/select_image_widget.dart';

class AddNewBlogPage extends StatefulWidget {
  const AddNewBlogPage({super.key});

  @override
  State<AddNewBlogPage> createState() => _AddNewBlogPageState();
}

class _AddNewBlogPageState extends State<AddNewBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            customReplacementNavigate(context, RouterNames.blogPage);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SelectImageWidget(),
              const SizedBox(height: 20),
              const TopicsScrollWidget(),
              const SizedBox(height: 10),
              BlogEditorTextFormField(
                controller: titleController,
                hintText: 'Blog Title',
              ),
              const SizedBox(height: 10),
              BlogEditorTextFormField(
                controller: contentController,
                hintText: 'Blog Content',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
