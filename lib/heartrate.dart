import 'package:flutter/material.dart';

class HeartRatePage extends StatelessWidget {
  const HeartRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate Data'),
        backgroundColor: Colors.orange[700],
        elevation: 0, // Menghilangkan bayangan bawah app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange[50]!, Colors.orange[200]!], // Gradasi cream yang lebih lembut
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite, // Ikon detak jantung yang valid
                  size: 100,
                  color: Colors.red[800], // Warna ikonnya
                ),
                const SizedBox(height: 20),
                const Text(
                  'Current Heart Rate',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Teks berwarna hitam agar lebih kontras
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15), // Sudut lebih tumpul
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8, // Bayangan lebih lembut dan lebih besar
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(40), // Meningkatkan padding dalam kotak
                  child: Column(
                    children: [
                      Text(
                        '75 bpm', // Detak jantung
                        style: TextStyle(
                          fontSize: 56, // Ukuran font lebih besar
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[700],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Timestamp: 10:45 AM\nDate: 2024-12-10', // Tanggal dan Waktu
                        style: TextStyle(
                          fontSize: 16, // Ukuran font untuk tanggal
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Tombol refresh bisa ditambahkan jika diperlukan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
