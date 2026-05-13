import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manajemen Toko",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 40,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 233, 188, 53),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 8),
          Text(
            'Data Produk:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 8),

          TextField(
            decoration: InputDecoration(
              labelText: "nama",
              hintText: "input nama",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: "jenis barang",
              hintText: "jenis barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: "berat",
              hintText: "input berat (kg)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              labelText: "jumlah",
              hintText: "input jumlah barang",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/nasi_padang.jpeg",
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),

                title: Text("menu $index"),
                subtitle: Text("Nasi + Rendang/Ayam Pop/Ayam Dangdutt"),
                trailing: Icon(Icons.arrow_forward),
              );
            },
          ),
        ],
      ),
    );
  }
}
