// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogger/core/error/exeption.dart';
import 'package:blogger/core/network/connection_checker.dart';
import 'package:blogger/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

import 'package:blogger/core/error/failure.dart';
import 'package:blogger/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';

import '../../../../core/commen/entities/user_entity.dart';

class AuthRepositoryImple implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  final ConnectionChecker connectionChecker;
  AuthRepositoryImple(
    this.remoteDataSource,
    this.connectionChecker,
  );

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final session = remoteDataSource.currentUserSession;
        if (session == null) {
          return left(Failure("User not logged in"));
        }
        return right(UserModel(
          id: session.user.id,
          email: session.user.email ?? '',
          name: '',
        ));
      }
      final user = await remoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failure("User not logged in"));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _getUser(
      () async => await remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signUpWithEmailAndPasswors(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failure("No internet connection"));
      }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
