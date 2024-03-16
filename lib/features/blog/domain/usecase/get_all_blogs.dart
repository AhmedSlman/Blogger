import 'package:blogger/core/error/failure.dart';
import 'package:blogger/core/usecase/use_case.dart';
import 'package:blogger/features/blog/domain/entities/blog_entity.dart';
import 'package:blogger/features/blog/domain/repository/blog_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams> {
  final BlogRepository blogRepository;

  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async {
    return await blogRepository.getAllBlogs();
  }
}
