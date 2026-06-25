import 'package:belajar_flutter/WorkInProgress/models/recipes.dart';
import 'package:belajar_flutter/WorkInProgress/views/detail_recipe.dart';
import 'package:belajar_flutter/extension/navigator.dart';
import 'package:belajar_flutter/services/api_services.dart';
import 'package:belajar_flutter/services/dio_client.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  late final ApiService _apiService;

  late Future<Recipes> _recipesFuture;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _recipesFuture = _apiService.getAllRecipes(10);
  }

  void _refreshRecipes() {
    setState(() {
      _recipesFuture = _apiService.getAllRecipes(30);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF147b5a),
      appBar: AppBar(
        flexibleSpace: Image.asset(
          'assets/images/banner.jpg',
          fit: BoxFit.cover,
        ),
      ),

      body: FutureBuilder<Recipes>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: '),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshRecipes,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.recipes.isEmpty) {
            return const Center(child: Text('No recipes found.'));
          }

          final recipes = snapshot.data!.recipes;

          return RefreshIndicator(
            onRefresh: () async => _refreshRecipes(),
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  color: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        recipe.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rating: ${recipe.rating} (${recipe.reviewCount} reviews)',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'Cuisine: ${recipe.cuisine} | Difficulty: ${recipe.difficulty.name}',
                    ),
                    onTap: () {
                      context.push(DetailRecipe(recipe: recipe));
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: Text(recipe.name),
                      //     content: SingleChildScrollView(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const Text(
                      //             'Ingredients:',
                      //             style: TextStyle(fontWeight: FontWeight.bold),
                      //           ),
                      //           ...recipe.ingredients.map(
                      //             (ingredient) => Text('- $ingredient'),
                      //           ),
                      //           const SizedBox(height: 16),
                      //           const Text(
                      //             'Instructions:',
                      //             style: TextStyle(fontWeight: FontWeight.bold),
                      //           ),
                      //           ...recipe.instructions.map(
                      //             (instruction) => Text('- $instruction'),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     actions: [
                      //       TextButton(
                      //         onPressed: () => Navigator.pop(context),
                      //         child: const Text('Close'),
                      //       ),
                      //     ],
                      //   ),
                      // );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
