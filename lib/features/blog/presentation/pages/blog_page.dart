import 'package:blogger/core/functions/custom_navigat.dart';
import 'package:blogger/core/routes/router_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

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
    );
  }
}
