import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Katalog Produk Pedagang", 
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: 
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: 
      Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), 
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         spacing: 12,
         children: [
          SizedBox(height: 4,),
          //Text("Nama: "),
          TextField(
            decoration: InputDecoration(
              labelText: "Nama: ",
              hintText: "Masukkan Nama Anda",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),prefixIcon: Icon(Icons.people)
            )
          ),
          SizedBox(height: 4,),
          //Text("Email: "),
          TextField(
            decoration: InputDecoration(
              labelText: "Email: ",
              hintText: "Masukkan Email Anda",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),prefixIcon: Icon(Icons.mail),
            ),
          ),
          SizedBox(height: 4,),
          //Text("No. HP: "),
          TextField(
            decoration: InputDecoration(
              labelText: "Nomor Handphone: ",
              hintText: "Masukkan No. HP",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: 4,),
          //Text("Password: "),
          TextField(
            decoration: InputDecoration(
              labelText: "Password: ",
              hintText: "Masukkan Password",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(Icons.visibility),
            ),
          ),
                   SizedBox(height: 4,),
          //Text("Password: "),
          TextField(
            obscureText: true,
            obscuringCharacter: "^",
            decoration: InputDecoration(
              labelText: "Konfirmasi Password: ",
              hintText: "Konfirmasi Password",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: Icon(Icons.visibility),
            ),
          ),
          SizedBox(height: 4,),
          //Text("Deskripsi: "),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              labelText: "Deskripsi: ",
              hintText: "Masukkan Deskripsi",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
            GridView.count(
            crossAxisCount:  3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,

            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Stack(
                alignment: AlignmentGeometry.bottomCenter,
                clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                  )
                ),
              ),
              Positioned.fill(child: 
              ClipRRect(
                child:  Image.asset("assets/images/bahlul.jpg", fit: BoxFit.cover,
               ),
              )
              ),
             Positioned(
              bottom: -8,
              child: Container(
                padding: EdgeInsets.all(2),
                color: Colors.deepOrangeAccent,
              child: Text("bahlul", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                ),
              ),
            ),
            ],
            ),
      
              Image.asset("assets/images/nyawit.jpg", fit: BoxFit.cover,),
              Image.asset("assets/images/windah.jpg", fit: BoxFit.cover,),
              Image.asset("assets/images/warung_rokok.jpg", fit: BoxFit.cover,),
            ],
            ),
            ],
          ),
        ),
      ),
      );

  }
}