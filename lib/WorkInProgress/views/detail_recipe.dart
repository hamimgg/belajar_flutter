import 'package:belajar_flutter/WorkInProgress/models/recipes.dart';
import 'package:belajar_flutter/services/api_services.dart';
import 'package:belajar_flutter/services/dio_client.dart';
import 'package:flutter/material.dart';

class DetailRecipe extends StatefulWidget {
  final Recipe recipe;
  const DetailRecipe({super.key, required this.recipe});

  @override
  State<DetailRecipe> createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
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
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   // title: const Text('Recipe Details'),
      // ),
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

          // final recipe = snapshot.data!.recipes.first;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      widget.recipe.image,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 24,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.recipe.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Cuisine: ${widget.recipe.cuisine} | Difficulty: ${widget.recipe.difficulty.name}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
