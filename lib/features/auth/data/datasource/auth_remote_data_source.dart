import 'package:blogger/core/error/exeption.dart';
import 'package:blogger/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPasswors({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImple implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImple(this.supabase);
  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerException("User is null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPasswors({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
        data: {
          "name": name,
        },
      );
      if (response.user == null) {
        throw ServerException("User is null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
