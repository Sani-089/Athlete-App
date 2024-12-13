import 'package:flutter/material.dart';
import 'history.dart'; // Pastikan Anda sudah membuat halaman HistoryPage

class CoachPage extends StatelessWidget {
  const CoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coach'),
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Manage Your Athletes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Daftar atlet yang bisa diklik untuk melihat riwayatnya
            GestureDetector(
              onTap: () {
                // Ketika nama atlet 1 diklik, buka halaman HistoryPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage(athleteName: 'Athlete 1')),
                );
              },
              child: _buildAthleteBox('Athlete 1'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Ketika nama atlet 2 diklik, buka halaman HistoryPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage(athleteName: 'Athlete 2')),
                );
              },
              child: _buildAthleteBox('Athlete 2'),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Ketika nama atlet 3 diklik, buka halaman HistoryPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage(athleteName: 'Athlete 3')),
                );
              },
              child: _buildAthleteBox('Athlete 3'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan kotak atlet
  Widget _buildAthleteBox(String name) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}


