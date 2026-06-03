import 'package:belajar_flutter/WorkInProgress/database/db_helper.dart';
import 'package:belajar_flutter/WorkInProgress/login_page_tugas6.dart';
import 'package:belajar_flutter/WorkInProgress/models/user_model_sql.dart';
import 'package:belajar_flutter/extension/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool pembeli = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  void register() async {
    // print("register() dipanggil");
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final nama = namaController.text;
    final telepon = teleponController.text;

    if (email.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Isi form terlebih dahulu!")),
      );
      return;
    }

    final user = UserModelSql(
      email: email,
      password: pass,
      nama: nama,
      telepon: telepon,
    );
    bool success = await DBHelper().registerUser(user);
    // print(success);

    // Cek apakah widget masih terpasang (mounted) sebelum menggunakan context
    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Akun berhasil dibuat'),
          duration: Duration(seconds: 2),
        ),
      );
      await Future.delayed(Duration(seconds: 2));

      if (!mounted) return;
      context.push(LoginPage());

      // Tambahkan navigasi ke halaman login jika perlu
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     context.pushAndRemoveAll(WelcomingPage());
        //   },
        //   icon: Icon(Icons.close, color: Colors.white),
        // ),
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
                  "Masuk untuk membuat akun anda",
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
                          hintText: "Nama",
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
                        controller: namaController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong";
                          }
                          // else if (!value.contains('@')) {
                          //   return "Format email tidak valid";
                          // }

                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Email",
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
                            return "Email tidak boleh kosong";
                          } else if (!value.contains('@')) {
                            return "Format email tidak valid";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Nomor Telepon",
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
                        controller: teleponController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "No telepon tidak boleh kosong";
                          }
                          // else if (!value.contains('@')) {
                          //   return "Format email tidak valid";
                          // }
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
                // Align(
                //   alignment: AlignmentGeometry.centerRight,
                //   child: TextButton(
                //     onPressed: () {},
                //     child: Text(
                //       "Lupa Kata Sandi?",
                //       style: TextStyle(color: Color(0xFFF5A623)),
                //     ),
                //   ),
                // ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5A623),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("harap lengkapi form dengan benar"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    // () async {
                    //   await PreferenceHandler.setlogin(true);
                    //   if (_formKey.currentState!.validate()) {
                    //     //print("Sudah memenuhi syarat");
                    //     context.push(
                    //       Tugas7Flutter(
                    //         email: emailController.text,
                    //         password: passwordController.text,
                    //       ),
                    //     );
                    //   }
                    // },
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Color(0xFF1C1C1E)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    text: "Sudah punya akun?",
                    style: TextStyle(color: Color(0xFFAAAAAA)),
                    children: [
                      TextSpan(
                        text: "Masuk",
                        style: TextStyle(
                          color: Color(0xFFF5A623),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.push(LoginPage()),
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
