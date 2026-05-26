import 'package:belajar_flutter/WorkInProgress/my_profile.dart';
import 'package:belajar_flutter/WorkInProgress/tugas9_flutter.dart';
import 'package:flutter/material.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    MyProfile(),
    KakiLima(),

    Center(child: Text("HALAMAN PROFILE", style: TextStyle(fontSize: 30))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "katalog"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "profile"),
        ],
      ),
    );
  }
}
