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
      // backgroundColor: Color(0xFF194d3a),
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   // title: const Text('Recipe Details'),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF117b5a), Color(0xFF194d3a)],
          ),
        ),
        child: FutureBuilder<Recipes>(
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF147b5a).withValues(alpha: 0.7),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.recipe.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Cuisine: ${widget.recipe.cuisine} | Difficulty: ${widget.recipe.difficulty.name}',
                            //   style: const TextStyle(fontSize: 16),
                            // ),
                            // SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                const SizedBox(width: 4),
                                Text(
                                  '${widget.recipe.rating} (${widget.recipe.reviewCount} reviews)',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Divider(),

                            const Text(
                              'Ingredients:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            ...widget.recipe.ingredients.map(
                              (ingredient) => Text(
                                '- $ingredient',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Instructions:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  ...widget.recipe.instructions.map(
                                    (instruction) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 2.0,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            '- $instruction',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
