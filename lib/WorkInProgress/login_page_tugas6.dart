import 'package:belajar_flutter/WorkInProgress/tugas2_flutter.dart';
import 'package:belajar_flutter/WorkInProgress/tugas7_flutter.dart';
import 'package:belajar_flutter/WorkInProgress/welcoming_page.dart';
import 'package:belajar_flutter/extension/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool pembeli = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushAndRemoveAll(WelcomingPage());
          },
          icon: Icon(Icons.close, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1C1C1E),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: AlignmentGeometry.bottomLeft,
            radius: 0.6,
            colors: [Color.fromARGB(255, 75, 50, 9), Color(0xFF1C1C1E)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo_asongan (1).png", width: 80),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5A623),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              pembeli = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: pembeli
                                  ? Color(0xFFF5A623)
                                  : Color(0xFF303030),

                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Pembeli",
                                style: TextStyle(
                                  color: pembeli
                                      ? Color(0xFF1C1C1E)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              pembeli = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: !pembeli
                                  ? Color(0xFFF5A623)
                                  : Color(0xFF303030),

                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                "Pedagang",
                                style: TextStyle(
                                  color: !pembeli
                                      ? Color(0xFF1C1C1E)
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Selamat Datang di Asongan",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Masuk untuk mulai menemukan pedagang terdekat",
                  style: TextStyle(color: Color(0xFFAAAAAA)),
                ),
                SizedBox(height: 32),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Nomor Telepon atau Email",
                          hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF5A623)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF5A623)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Icon(Icons.mail_outline_sharp),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama/Email tidak boleh kosong";
                          } else if (!value.contains('@')) {
                            return "Format email tidak valid";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        obscuringCharacter: "X",
                        decoration: InputDecoration(
                          hintText: "Kata Sandi",
                          hintStyle: TextStyle(color: Color(0xFFAAAAAA)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF5A623)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF5A623)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: Icon(Icons.lock_outline_sharp),
                          suffixIcon: Icon(Icons.visibility),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Kata sandi tidak boleh kosong";
                          } else if (value.length < 6) {
                            return "Kata sandi terlalu singkat";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lupa Kata Sandi?",
                      style: TextStyle(color: Color(0xFFF5A623)),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5A623),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //print("Sudah memenuhi syarat");
                        context.push(
                          Tugas7Flutter(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(color: Color(0xFF1C1C1E)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Atau masuk dengan",
                  style: TextStyle(color: Color(0xFFAAAAAA)),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      //width: 140,
                      height: 32,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            "assets/images/logo_google.png",
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    SizedBox(
                      //width: 140,
                      height: 32,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Belum punya akun?",
                    style: TextStyle(color: Color(0xFFAAAAAA)),
                    children: [
                      TextSpan(
                        text: "Daftar",
                        style: TextStyle(
                          color: Color(0xFFF5A623),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push(Tugas2Flutter()),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
