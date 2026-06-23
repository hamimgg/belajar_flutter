import 'package:belajar_flutter/WorkInProgress/models/recipes.dart';
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

  // 1. UPDATE: Change this to expect the wrapper 'Recipes' object instead of a List
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
      appBar: AppBar(
        title: const Text('Recipes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      // 2. UPDATE: Change the FutureBuilder type to 'Recipes'
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
                  Text('Error: ${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshRecipes,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // 3. UPDATE: Check if the internal '.recipes' list is empty
          if (!snapshot.hasData || snapshot.data!.recipes.isEmpty) {
            return const Center(child: Text('No recipes found.'));
          }

          // 4. UPDATE: Extract the actual list from the wrapper object
          final recipes = snapshot.data!.recipes;

          return RefreshIndicator(
            onRefresh: () async => _refreshRecipes(),
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(recipe.name),
                    subtitle: Text(
                      'Cuisine: ${recipe.cuisine} | Difficulty: ${recipe.difficulty.name}',
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(recipe.name),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ingredients:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ...recipe.ingredients.map(
                                  (ingredient) => Text('- $ingredient'),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Instructions:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ...recipe.instructions.map(
                                  (instruction) => Text('- $instruction'),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
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
