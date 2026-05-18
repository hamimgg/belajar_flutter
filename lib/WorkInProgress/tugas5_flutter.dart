import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  int nilai = 0;
  bool status = true;
  bool kontak = false;
  bool showKata = false;
  bool suka = false;
  bool paragraf = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          nilai--;
          print("anda menekan tombol pengurang nilai: $nilai");
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Detail Pedagang",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      showKata
                          ? Image.asset(
                              "assets/images/bahlul.jpg",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(height: 0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                        ),
                        onPressed: () {
                          setState(() {
                            showKata = !showKata;
                          });
                        },
                        child: Text(
                          showKata
                              ? "Sembunyikan Foto Profil"
                              : "Tampilkan Foto Profil",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: [
                      Text(
                        "Cilok Mang Ujang",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 4),

                      TextButton(
                        onPressed: () {
                          setState(() {
                            status = !status;
                          });
                          print(
                            "status berubah ${status ? "Online" : "offline"}",
                          );
                        },
                        child: Text(
                          status ? "🟢 Ngider" : "🔴 Ngaso",
                          style: TextStyle(
                            color: status ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      suka
                          ? Padding(
                              padding: EdgeInsetsGeometry.all(2),
                              child: Text("Tersimpan di Favorit"),
                            )
                          : SizedBox(height: 0),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            suka = !suka;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          size: 24,
                          color: suka ? Colors.red : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  /*kontak
                      ? Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "📧 ujangcilok@asongan.id\n📞 0812-3456-7890\n📍 Jl. Tanah Abang, Jakarta Pusat",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      : SizedBox(height: 0),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        kontak = !kontak;
                      });
                    },
                    child: Text(kontak ? "tutup" : "lihat kontak"),
                  ),*/
                  SizedBox(height: 4),
                ],
              ),

              SizedBox(height: 4),

              Text(
                "Mang Ujang telah berdagang Cilok sejak 2019. ...",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              paragraf
                  ? Padding(
                      padding: EdgeInsetsGeometry.all(2),
                      child: Text(
                        "Di kawasan Tanah Abang. Rasanya tidak kalah dengan bakso."
                        "Harga Cilok yang dijajakan Mang Ujang juga ramah di kantong anda.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  : SizedBox(height: 0),
              TextButton(
                onPressed: () {
                  setState(() {
                    paragraf = !paragraf;
                  });
                },
                child: Text(paragraf ? "Tutup" : "Lihat Deskrpisi Pedagang"),
              ),

              SizedBox(height: 4),
              Container(
                height: 4,
                decoration: BoxDecoration(color: Colors.grey),
              ),

              InkWell(
                splashColor: Colors.yellow,
                onTap: () {
                  print("Sentuhan Terdeteksi");
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.all(4),
                  child: Image.asset(
                    "assets/images/cilok_kacang.jpg",
                    height: 400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  nilai++;
                  print("anda menekan : $nilai");
                },
                onLongPress: () {
                  nilai++;
                  print("anda menahan: $nilai");
                },
                onDoubleTap: () {
                  nilai++;
                  print("anda menekan dua kali: $nilai");
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.all(4),
                  child: Image.asset("assets/images/cilok_kuah.jpg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
