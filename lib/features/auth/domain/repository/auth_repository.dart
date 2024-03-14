import 'package:blogger/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/commen/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
}
