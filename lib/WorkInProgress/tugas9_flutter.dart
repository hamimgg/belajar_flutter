import 'dart:math';

import 'package:belajar_flutter/models/produk.dart';
import 'package:faker/faker.dart' as faker_lib;
import 'package:flutter/material.dart';

class KakiLima extends StatefulWidget {
  const KakiLima({super.key});

  @override
  State<KakiLima> createState() => _KakiLimaState();
}

class _KakiLimaState extends State<KakiLima> {
  final faker = faker_lib.Faker();
  final List<String> namaMakanan = [
    'Bumbu kacang',
    "Kuah kaldu",
    "Bumbu Kecap",
    "Bumbu Balado",
  ];
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "Ujang",
      "Produk": "Cilok",
      "Harga": 1000,
      "Address": "Jl. Rawa Kopi",
    },
    {
      "Name": "Dedi",
      "Produk": "Siomay",
      "Harga": 5000,
      "Address": "Jl. Pasar Baru",
    },
    {
      "Name": "Irul",
      "Produk": "Ketoprak",
      "Harga": 15000,
      "Address": "Jl. Cibadak",
    },
    {
      "Name": "Asep",
      "Produk": "Batagor",
      "Harga": 8000,
      "Address": "Jl. Kebon Jeruk",
    },
    {
      "Name": "Siti",
      "Produk": "Mie Ayam",
      "Harga": 12000,
      "Address": "Jl. Sudirman",
    },
    {
      "Name": "Rudi",
      "Produk": "Bakso",
      "Harga": 10000,
      "Address": "Jl. Gatot Subroto",
    },
    {
      "Name": "Yanti",
      "Produk": "Nasi Uduk",
      "Harga": 7000,
      "Address": "Jl. Kramat Raya",
    },
    {
      "Name": "Budi",
      "Produk": "Sate Ayam",
      "Harga": 20000,
      "Address": "Jl. Mangga Besar",
    },
    {
      "Name": "Rina",
      "Produk": "Gado-Gado",
      "Harga": 13000,
      "Address": "Jl. Tanah Abang",
    },
    {
      "Name": "Hendra",
      "Produk": "Es Teh Manis",
      "Harga": 3000,
      "Address": "Jl. Cempaka Putih",
    },
  ];
  List<Product> dummyData = [];
  @override
  void initState() {
    super.initState();
    dummyData = List.generate(50, (index) {
      return Product(
        "https://picsum.photos/id/${index + 1}/200",
        faker.person.firstName(),
        1000 + Random().nextInt(100000),
        faker.lorem.sentence(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: Drawer(
      //   child: Column(
      //     children: [
      //       DrawerHeader(
      //         decoration: const BoxDecoration(
      //           gradient: LinearGradient(
      //             colors: [Color(0xffF5A623), Color(0xfff5b900)],
      //             begin: Alignment.topLeft,
      //             end: Alignment.bottomRight,
      //           ),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Icon(Icons.widgets_rounded, color: Colors.white, size: 32),
      //             SizedBox(height: 8),
      //             Text(
      //               "Menu Navigasi",
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 20,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //             Text(
      //               "Pilih Halaman",
      //               style: TextStyle(color: Colors.white70, fontSize: 12),
      //             ),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.home, color: Color(0xffF5A623)),
      //         title: const Text(
      //           "page 1",
      //           style: TextStyle(color: Color(0xff1c1c1e)),
      //         ),
      //         onTap: () {
      //           setState(() {
      //             context.pop(KakiLima());
      //           });
      //         },
      //       ),
      //       const Divider(height: 1),
      //       ListTile(
      //         leading: const Icon(Icons.home, color: Color(0xffF5A623)),
      //         title: const Text(
      //           "page 2",
      //           style: TextStyle(color: Color(0xff1c1c1e)),
      //         ),
      //         onTap: () {
      //           setState(() {
      //             context.pop(Tugas2Flutter());
      //           });
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        // leading: TextButton(onPressed: (){}, child: Icon(Icons.bac)),
        title: const Text(
          "Katalog Pedagang",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1C1C1E),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Pilihan Bumbu:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfff5a623),
                ),
              ),
              SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                // physics: const AlwaysScrollableScrollPhysics(),
                itemCount: namaMakanan.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Text(
                      namaMakanan[index],
                      style: TextStyle(fontSize: 12),
                      softWrap: true,
                    ),
                  );
                },
              ),
              SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return GridTile(child: Image.network(dummyData[index].image));
                },
                itemCount: dummyData.length,
              ),
              SizedBox(height: 12),
              ListView(
                shrinkWrap: true,
                // physics: const BouncingScrollPhysics(),
                children: myList.map((data) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/id/${myList.indexOf(data) + 1}/200',
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama Pedagang: ${data['Name']}"),
                                Text("Produk: ${data['Produk']}"),
                                Text("Harga/pcs: ${data['Harga']}"),
                              ],
                            ),
                          ],
                        ),
                        // Row(children: [Container(child: Text(""))]),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),

      // body: Center(child: Padding(padding: EdgeInsetsGeometry.all(12),
      // child: Column(
      //   children: [
      //     _SectionCard(cardColor: cardColor, textColor: textColor, icon: icon, title: "Info Produk", child: )
      //   ],
      // ),),)
    );
  }
}

// class _SectionCard extends StatelessWidget {
//   final Color cardColor;
//   final Color textColor;
//   final IconData icon;
//   final String title;
//   final Widget child;

//   const _SectionCard({
//     super.key,
//     required this.cardColor,
//     required this.textColor,
//     required this.icon,
//     required this.title,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, color: Colors.indigo, size: 20),
//                 const SizedBox(width: 8),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: textColor,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),
//             child,
//           ],
//         ),
//       ),
//     );
//   }
// }
