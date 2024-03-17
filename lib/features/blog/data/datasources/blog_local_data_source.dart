import 'package:hive/hive.dart';

import '../model/blog_model.dart';

abstract interface class BlogLocalDataSource {
  void uploadLocalBlogs({required List<BlogModel> blogs});
  List<BlogModel> loadBlogs();
}

class BlogLocalDataSourceImple implements BlogLocalDataSource {
  final Box box;

  BlogLocalDataSourceImple(this.box);
  @override
  List<BlogModel> loadBlogs() {
    List<BlogModel> blogs = [];
    box.read(() {
      for (var i = 0; i < box.length; i++) {
        blogs.add(
          BlogModel.fromJson(
            box.get(
              i.toString(),
            ),
          ),
        );
      }
    });
    return blogs;
  }

  @override
  void uploadLocalBlogs({required List<BlogModel> blogs}) {
    box.clear();
    box.write(() {
      for (var i = 0; i < blogs.length; i++) {
        box.put(i.toString(), blogs[i].toJson());
      }
    });
  }
}
