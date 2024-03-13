import 'package:blogger/core/error/exeption.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailAndPasswors({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImple implements AuthRemoteDataSource {
  final SupabaseClient supabase;

  AuthRemoteDataSourceImple(this.supabase);
  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPasswors({
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
      return response.user!.id;
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
