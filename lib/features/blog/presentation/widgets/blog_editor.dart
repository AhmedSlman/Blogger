import 'package:flutter/material.dart';

class BlogEditorTextFormField extends StatelessWidget {
  const BlogEditorTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      maxLines: null,
    );
  }
}
