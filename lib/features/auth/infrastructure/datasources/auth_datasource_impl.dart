import 'package:dio/dio.dart';
import 'package:teslo_shop/config/config.dart';
import 'package:teslo_shop/features/auth/domain/domain.dart';
import 'package:teslo_shop/features/auth/infrastructure/infrastructure.dart';

class AuthDatasourceImpl implements AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
    //return authRepository.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final user = UserMapper.fromJson(response.data);
      return user;
    } on DioError catch (e) {
      _verifyDioError(e);

      throw CustomException(message: 'Error desconocido', errorCode: 1);
    } catch (e) {
      throw CustomException(message: 'Error desconocido', errorCode: 2);
    }
  }

  _verifyDioError(DioError e) {
    if (e.response?.statusCode == 401) {
      throw WrongCredentialsException();
    }

    if (e.type == DioErrorType.connectionTimeout) {
      throw ConnectionTimeoutException();
    }
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
