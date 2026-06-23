// To parse this JSON data, do
//
//     final recipes = recipesFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'recipes.g.dart';

Recipes recipesFromJson(String str) => Recipes.fromJson(json.decode(str));

String recipesToJson(Recipes data) => json.encode(data.toJson());

@JsonSerializable()
class Recipes {
  @JsonKey(name: "recipes")
  List<Recipe> recipes;
  @JsonKey(name: "total")
  int total;
  @JsonKey(name: "skip")
  int skip;
  @JsonKey(name: "limit")
  int limit;

  Recipes({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Recipes.fromJson(Map<String, dynamic> json) =>
      _$RecipesFromJson(json);

  Map<String, dynamic> toJson() => _$RecipesToJson(this);
}

@JsonSerializable()
class Recipe {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "ingredients")
  List<String> ingredients;
  @JsonKey(name: "instructions")
  List<String> instructions;
  @JsonKey(name: "prepTimeMinutes")
  int prepTimeMinutes;
  @JsonKey(name: "cookTimeMinutes")
  int cookTimeMinutes;
  @JsonKey(name: "servings")
  int servings;
  @JsonKey(name: "difficulty")
  Difficulty difficulty;
  @JsonKey(name: "cuisine")
  String cuisine;
  @JsonKey(name: "caloriesPerServing")
  int caloriesPerServing;
  @JsonKey(name: "tags")
  List<String> tags;
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "rating")
  double rating;
  @JsonKey(name: "reviewCount")
  int reviewCount;
  @JsonKey(name: "mealType")
  List<String> mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

enum Difficulty {
  @JsonValue("Easy")
  EASY,
  @JsonValue("Medium")
  MEDIUM,
}

final difficultyValues = EnumValues({
  "Easy": Difficulty.EASY,
  "Medium": Difficulty.MEDIUM,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
