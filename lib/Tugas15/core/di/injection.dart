import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/api_service.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

class Injection {
  static final AuthRepository authRepository = AuthRepositoryImpl(
    apiService: ApiService(
      Dio()..interceptors.add(LogInterceptor(responseBody: true, requestBody: true)),
    ),
    secureStorage: const FlutterSecureStorage(),
  );
}
