import 'package:belajar_flutter/WorkInProgress/views/get_post_screen.dart';
import 'package:belajar_flutter/extension/navigator.dart';
import 'package:flutter/material.dart';

class WelcomingPage extends StatefulWidget {
  const WelcomingPage({super.key});

  @override
  State<WelcomingPage> createState() => _WelcomingPageState();
}

class _WelcomingPageState extends State<WelcomingPage> {
  @override
  void initState() {
    super.initState();
    // _checkLoginStatus();
  }

  // Future<void> _checkLoginStatus() async {
  //   await Future.delayed(const Duration(seconds: 3));

  //   if (!mounted) return;
  //   context.pushAndRemoveAll(RecipesScreen());

  //   // if (PreferenceHandler.isLogin) {
  //   //   context.pushAndRemoveAll(RecipesScreen());
  //   // } else {
  //   //   context.pushAndRemoveAll(LoginPage());
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned.fill(
            // bottom: 200,
            // left: 16,
            // right: 16,
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Image.asset(
              "assets/images/telur.png",
              width: 600,
              height: 600,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Text(
                    "Discover Delicious Recipes",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF147b5a),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF129575),
                    ),
                    onPressed: () {
                      context.pushAndRemoveAll(const RecipesScreen());
                    },
                    child: const Text(
                      "How to Basic?",
                      style: TextStyle(
                        color: Color(0xFFffffff),
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Color(0xFFF5A623),
          //     ),
          //     onPressed: () {
          //       context.pushAndRemoveAll(RecipesScreen());
          //     },
          //     child: Text(
          //       "Mulai Sekarang",
          //       style: TextStyle(color: Color(0xFF1C1C1E)),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
