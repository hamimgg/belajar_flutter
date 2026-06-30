import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/api_response.dart';
import '../../data/models/auth_response.dart';
import '../../data/models/login_request.dart';
import '../../data/models/register_request.dart';
import '../../data/models/user_model.dart';
import '../../data/models/training_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://appabsensi.mobileprojp.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/api/register")
  Future<ApiResponse<AuthResponse>> register(@Body() RegisterRequest request);

  @POST("/api/login")
  Future<ApiResponse<AuthResponse>> login(@Body() LoginRequest request);

  @GET("/api/profile")
  Future<ApiResponse<UserModel>> getProfile(@Header("Authorization") String token);

  @PUT("/api/profile")
  Future<ApiResponse<UserModel>> updateProfile(
    @Header("Authorization") String token,
    @Field("name") String name,
    @Field("email") String email,
    @Field("jenis_kelamin") String jenisKelamin,
    @Field("batch_id") int batchId,
    @Field("training_id") int trainingId,
  );

  @PUT("/api/profile/photo")
  Future<ApiResponse<UserModel>> updateProfilePhoto(
    @Header("Authorization") String token,
    @Field("profile_photo") String photoBase64,
  );

  @GET("/api/trainings")
  Future<ApiResponse<List<TrainingModel>>> getTrainings();
}
