import 'package:teslo_shop/features/auth/domain/domain.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        fullName: json['fullName'],
        roles: List<String>.from(json['roles']),
        token: json['token'],
      );

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'email': user.email,
        'fullName': user.fullName,
        'roles': user.roles,
        'token': user.token,
      };
}
