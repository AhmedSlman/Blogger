import 'package:blogger/core/error/failure.dart';
import 'package:blogger/core/usecase/use_case.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/user_entity.dart';

class UserLogin implements UseCase<User, UserloginParams> {
  final AuthRepository authRepository;

  UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserloginParams params) async {
    return await authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserloginParams {
  final String email;
  final String password;

  UserloginParams({
    required this.email,
    required this.password,
  });
}
