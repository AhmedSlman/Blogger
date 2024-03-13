import 'package:blogger/features/auth/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });
  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'] ?? "",
      email: jsonData['email'] ?? "",
      name: jsonData['name'] ?? "",
    );
  }
}
