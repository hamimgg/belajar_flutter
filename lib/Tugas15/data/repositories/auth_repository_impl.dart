import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../core/network/api_service.dart';
import '../../data/models/login_request.dart';
import '../../data/models/register_request.dart';
import '../../data/models/user_model.dart';
import '../../data/models/training_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({required this.apiService, required this.secureStorage});

  static const String _tokenKey = 'auth_token';

  @override
  Future<void> login(String email, String password) async {
    final response = await apiService.login(
      LoginRequest(email: email, password: password),
    );
    final token = response.data?.token;
    if (token != null) {
      await secureStorage.write(key: _tokenKey, value: token);
    } else {
      throw Exception(response.message ?? "Login failed");
    }
  }

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String jenisKelamin,
    required int batchId,
    required int trainingId,
    String? profilePhoto,
  }) async {
    final response = await apiService.register(
      RegisterRequest(
        name: name,
        email: email,
        password: password,
        jenisKelamin: jenisKelamin,
        batchId: batchId,
        trainingId: trainingId,
        profilePhoto: profilePhoto,
      ),
    );
    final token = response.data?.token;
    if (token != null) {
      await secureStorage.write(key: _tokenKey, value: token);
    }
  }

  @override
  Future<UserModel> getProfile() async {
    final token = await getToken();
    if (token == null) throw Exception("Unauthorized");
    
    final response = await apiService.getProfile('Bearer $token');
    if (response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message ?? "Failed to get profile");
    }
  }

  @override
  Future<void> updateProfile({
    required String name,
    required String email,
    required String jenisKelamin,
    required int batchId,
    required int trainingId,
  }) async {
    final token = await getToken();
    if (token == null) throw Exception("Unauthorized");

    final response = await apiService.updateProfile(
      'Bearer $token',
      name,
      email,
      jenisKelamin,
      batchId,
      trainingId,
    );
    if (response.data == null) {
      throw Exception(response.message ?? "Failed to update profile");
    }
  }

  @override
  Future<void> updateProfilePhoto(File photo) async {
    final token = await getToken();
    if (token == null) throw Exception("Unauthorized");

    final bytes = await photo.readAsBytes();
    String base64Image = "data:image/png;base64,${base64Encode(bytes)}";

    final response = await apiService.updateProfilePhoto('Bearer $token', base64Image);
    if (response.data == null) {
      throw Exception(response.message ?? "Failed to update profile photo");
    }
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: _tokenKey);
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }

  @override
  Future<List<TrainingModel>> getTrainings() async {
    final response = await apiService.getTrainings();
    if (response.data != null) {
      return response.data!;
    } else {
      throw Exception(response.message ?? "Failed to get trainings");
    }
  }
}
