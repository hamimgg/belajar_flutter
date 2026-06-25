import 'package:belajar_flutter/WorkInProgress/models/recipes.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/recipes')
  Future<Recipes> getAllRecipes(@Query('limit') int limit);
}
