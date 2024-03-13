// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogger/core/error/exeption.dart';
import 'package:fpdart/fpdart.dart';

import 'package:blogger/core/error/failure.dart';
import 'package:blogger/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImple implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImple(this.remoteDataSource);
  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailAndPasswors(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
