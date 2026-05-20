import 'package:belajar_flutter/WorkInProgress/login_page_tugas6.dart';
import 'package:belajar_flutter/extension/navigator.dart';
import 'package:flutter/material.dart';

class WelcomingPage extends StatelessWidget {
  const WelcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_asongan (1).png"),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF5A623),
                  ),
                  onPressed: () {
                    context.push(LoginPage());
                  },
                  child: Text(
                    "Mulai Sekarang",
                    style: TextStyle(color: Color(0xFF1C1C1E)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
