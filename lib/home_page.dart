import 'package:flutter/material.dart';
import 'detail_upn.dart';
import 'dummy-fakultas.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, $username'),
        backgroundColor: Colors.green, // Warna hijau untuk app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Card yang bisa diklik
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman DetailUpn saat card ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailUPNVY(),
                  ),
                );
              },
              child: Card(
                color: Colors.green, // Warna hijau untuk card
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      'Sudahkah kamu mengenal upn jogja \nUPN Yogya itu favorit lhoo!!! \nkenalan lebih jauh yuk'),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tulisan "List Fakultas UPNVYK" di samping kiri
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'List Fakultas UPNVYK',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: facultyList.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.yellow, // Warna kuning untuk card
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                              facultyList[index].imageUrls.last,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(facultyList[index].name),
                              Text(
                                  'Jumlah Jurusan: ${facultyList[index].numberOfMajors}'),
                              Text(
                                  'Jumlah Mahasiswa: ${facultyList[index].numberOfStudents}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
