//import 'package:belajar_flutter/main.dart';
import 'package:flutter/material.dart';


class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
      ), centerTitle: true,
       ), 
        body: 
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Nama: Hamim Abdillah', style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: const[Icon(
                Icons.location_pin, color: Colors.white, size: 20,
              ),
              Text(
                'Jakarta, ID', style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: const [
              Text(
                'Saya seorang pelajar yang sedang belajar flutter.\nSEMANGAT!!!', style: TextStyle(color: Colors.white),
              )
              ],
            )
          ],
      )
       );

  }
}