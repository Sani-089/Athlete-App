import 'package:flutter/material.dart';
import 'dart:math';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Detak Jantung",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1E3A5F), // Warna serasi dengan HomePage
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon serasi
        elevation: 0, // Menghilangkan garis bawah
        centerTitle: true, // Menempatkan judul di tengah
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E3A5F), // Biru gelap
              Color(0xFF4A90E2), // Biru muda
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height:40),
            Container(
              width: 110, // Memperbesar lebar avatar
              height: 100, // Memperbesar tinggi avatar
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "images/profile.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Athlete App",
              style: TextStyle(
                fontSize: 30, // Sedikit memperbesar ukuran teks
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 50, // Memperbanyak jumlah item agar dapat di-scroll
                itemBuilder: (context, index) {
                  // Membuat detak jantung dan SPO2 bervariasi
                  int heartRate = Random().nextInt(50) + 50; // Detak jantung acak antara 50 dan 100
                  double spo2 = Random().nextInt(10) + 85.0; // SPO2 acak antara 85% dan 95%

                  bool isHeartRateNormal = heartRate >= 60 && heartRate <= 90; // Detak jantung normal antara 60 dan 90 BPM
                  bool isSpo2Normal = spo2 >= 90.0; // SPO2 normal lebih dari atau sama dengan 90%

                  // Jika salah satu nilai tidak normal, maka kotak menjadi merah
                  Color boxColor = (isHeartRateNormal && isSpo2Normal) 
                      ? Colors.green.withOpacity(0.1) 
                      : Colors.red.withOpacity(0.1);

                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    color: boxColor, // Warna kotak berdasarkan status normal/tidaknya
                    child: ListTile(
                      leading: Icon(Icons.favorite, color: isHeartRateNormal && isSpo2Normal ? Colors.green[400] : Colors.red[400]),
                      title: Text(
                        "Detak Jantung: $heartRate BPM - SPO2: ${spo2.toStringAsFixed(1)}%",
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "Tanggal: 2024-12-${20 - (index % 20)}",
                        style: const TextStyle(color: Colors.white60),
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