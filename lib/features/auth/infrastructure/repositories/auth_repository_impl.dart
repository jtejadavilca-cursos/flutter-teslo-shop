import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDatasource;

  AuthRepositoryImpl({AuthDataSource? authDatasource})
      : authDatasource = authDatasource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return authDatasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return authDatasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password) {
    return authDatasource.register(email, password);
  }
}
