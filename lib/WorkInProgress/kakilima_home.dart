import 'package:flutter/material.dart';

class KakiLima extends StatelessWidget {
  const KakiLima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: TextButton(onPressed: (){}, child: Icon(Icons.bac)),
        title: const Text(
          "KakiLima",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1C1C1E),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/map_grid.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
