import 'package:belajar_flutter/WorkInProgress/database/db_helper.dart';
import 'package:belajar_flutter/WorkInProgress/models/user_model_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //   final TextEditingController emailController = TextEditingController();
  //    final TextEditingController passwordController = TextEditingController();
  //     final TextEditingController namaController = TextEditingController();
  //      final TextEditingController teleponController = TextEditingController();

  // void register() async{
  //   final email = emailController.text.trim();
  //   final pass = passwordController.text;
  //   final telepon = teleponController.text;
  //   final nama = namaController.text;

  //   if (email.isEmpty || pass.isEmpty || telepon.isEmpty||nama.isEmpty){
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("isi semua form")));
  //     return;
  //   }
  //   final user = UserModelSql(email: email, password: pass, telepon: telepon, nama: nama);
  //   bool success = await DBHelper().registerUser(user);

  //   if (!mounted) return;
  //   if (success){
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("akun berhasil dibuat")));
  //   }else {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("email sudah terdaftar")));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Temukan Pedagang",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        backgroundColor: Color(0xff1c1c1e),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/images/logo_asongan.svg",
            width: 32,
            height: 32,
            semanticsLabel: "Logo Asongan",
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xfff5a623)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Color(0xff666666)),
                        ),
                        Text(
                          "Cari pedagang atau produk ...",
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: FutureBuilder<List<UserModelSql>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text("Terjadi kesalahan: ${snapshot.error}"),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("Tidak ada data pengguna."));
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(user.email),
                        subtitle: Text("Password: ${user.password}"),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.edit_document,
                            color: Color(0xfff5a623),
                          ),
                          onPressed: () => _showBottomsheet(context, user),
                        ),
                        onTap: () => _showBottomsheet(context, user),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // DeafultButton(text: "Lihat Database", onPressed: (){
          //   context.push(DatabaseList());
          // })
        ],
      ),
    );
  }

  void _showBottomsheet(BuildContext context, UserModelSql user) {
    final emailController = TextEditingController(text: user.email);
    final passwordController = TextEditingController(text: user.password);
    final teleponController = TextEditingController(text: user.telepon);
    final namaController = TextEditingController(text: user.nama);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Kelola data pengguna",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff5a623),
                    ),
                    icon: const Icon(Icons.edit, color: Color(0xff1c1c1e)),
                    onPressed: () async {
                      if (user.id != null) {
                        final updatedUser = UserModelSql(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          id: user.id,
                          telepon: teleponController.text,
                          nama: namaController.text,
                        );
                        bool success = await DBHelper().updateUser(updatedUser);
                        if (success && context.mounted) {
                          Navigator.pop(context);
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data berhasil diperbarui"),
                            ),
                          );
                        }
                      }
                    },
                    label: const Text("Update"),
                  ),
                ],
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: () async {
                  if (user.id != null) {
                    await DBHelper().deleteUser(user.id!);
                    if (context.mounted) {
                      Navigator.pop(context);
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Data berhasil dihapus")),
                      );
                    }
                  }
                },
                label: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
