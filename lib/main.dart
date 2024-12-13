// import 'package:flutter/material.dart';
// import 'heartrate.dart';
// import 'athleteinsight.dart';
// import 'history.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Menghilangkan banner debug
//       title: 'Smartband App',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: const Smartband(),
//     );
//   }
// }

// class Smartband extends StatelessWidget {
//   const Smartband({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "images/logo.png",
//               width: 250, // Ukuran logo proporsional
//               height: 250,
//               errorBuilder: (context, error, stackTrace) {
//                 return const Icon(
//                   Icons.broken_image,
//                   size: 100,
//                   color: Colors.grey,
//                 ); // Tampilkan ikon jika gambar gagal dimuat
//               },
//             ),
//             const SizedBox(height: 20), // Spasi antara gambar dan tombol
//             ElevatedButton(
//               onPressed: () {
//                 // Navigasi ke halaman NextPage
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const NextPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange[700], // Warna tombol
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 40, vertical: 15), // Ukuran tombol lebih besar
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10), // Tombol membulat
//                 ),
//               ),
//               child: const Text(
//                 'Go to Next Page',
//                 style: TextStyle(fontSize: 18, color: Colors.white), // Teks tombol
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange[700],
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings), // Ikon pengaturan di pojok kanan
//             onPressed: () {
//               // Tambahkan logika untuk pengaturan di sini
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 16), // Spasi atas
//           Center(
//             child: Image.asset(
//               "images/menu.png",
//               width: 200, // Lebar gambar
//               height: 200, // Tinggi gambar
//               errorBuilder: (context, error, stackTrace) {
//                 return const Icon(
//                   Icons.broken_image,
//                   size: 100,
//                   color: Colors.grey,
//                 ); // Tampilkan ikon jika gambar gagal dimuat
//               },
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'OUR FEATURE',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const HeartRatePage()),
//                     );
//                   },
//                   child: _buildFeatureBox(
//                     icon: Icons.favorite,
//                     text: 'Heart Rate Data',
//                   ),
//                 ),
//                 const SizedBox(height: 16), // Jarak antar kotak
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const AthleteInsightPage()),
//                     );
//                   },
//                   child: _buildFeatureBox(
//                     icon: Icons.insights,
//                     text: 'Athlete Insight',
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HistoryPage(athleteName: '',)),
//                     );
//                   },
//                   child: _buildFeatureBox(
//                     icon: Icons.history,
//                     text: 'Heart & Sleep History',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeatureBox({
//     required IconData icon,
//     required String text,
//   }) {
//     return Container(
//       width: double.infinity,
//       height: 80, // Tinggi kotak
//       decoration: BoxDecoration(
//         color: Colors.orange[100], // Warna oranye muda
//         borderRadius: BorderRadius.circular(10), // Sudut tumpul
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             blurRadius: 4,
//             offset: const Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const SizedBox(width: 16), // Spasi kiri
//           Icon(icon, size: 40, color: Colors.black), // Ikon warna hitam
//           const SizedBox(width: 16), // Spasi antara ikon dan teks
//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'loginmain.dart'; // Pastikan file ini diimpor dengan benar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smartband App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const Smartband(),
    );
  }
}

class Smartband extends StatelessWidget {
  const Smartband({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              width: 250,
              height: 250,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginMainPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
