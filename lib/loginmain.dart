// import 'package:flutter/material.dart';
// import 'athleteinsight.dart';
// import 'history.dart';
// import 'coach.dart'; // Import halaman CoachPage

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Smartband App',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       home: const Smartband(),
//     );
//   }
// }

// // Smartband page (tampilan pertama)
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
//                 );
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
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // NextPage (halaman setelah klik tombol Go to Next Page)
// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange[700],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Login as:',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const AthletePage()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange[700],
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: const Text(
//               'Login as Athlete',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const CoachPage()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange[700],
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: const Text(
//               'Login as Coach',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // AthletePage (Fitur untuk atlet)
// class AthletePage extends StatelessWidget {
//   const AthletePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Athlete'),
//         backgroundColor: Colors.orange[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome, Athlete!',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               'You can join the forum/class with your coach here.',
//               style: TextStyle(fontSize: 18),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigasi ke halaman NextPage setelah klik tombol
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const NextPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange[700],
//                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text(
//                 'Join Forum/Class with Coach',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // CoachPage (Halaman Coach, daftar atlet)
// class CoachPage extends StatelessWidget {
//   const CoachPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Coach'),
//         backgroundColor: Colors.orange[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//               'Manage Your Athletes',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HistoryPage(athleteName: '',)),
//                 );
//               },
//               child: _buildAthleteBox('Athlete 1'),
//             ),
//             const SizedBox(height: 10),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HistoryPage(athleteName: '',)),
//                 );
//               },
//               child: _buildAthleteBox('Athlete 2'),
//             ),
//             const SizedBox(height: 10),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HistoryPage(athleteName: '',)),
//                 );
//               },
//               child: _buildAthleteBox('Athlete 3'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAthleteBox(String name) {
//     return Container(
//       width: double.infinity,
//       height: 60,
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.orange[100],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         name,
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'forumclass.dart'; // Pastikan path-nya benar
import 'coach.dart'; // Pastikan path-nya benar

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Main Page'),
        backgroundColor: Colors.orange[700],
      ),
      body: Center(  // Menggunakan Center untuk memastikan elemen berada di tengah
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Vertikal di tengah
          crossAxisAlignment: CrossAxisAlignment.center, // Horizontal di tengah
          children: [
            const Text(
              'Login as:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Gantilah dengan nama atlet yang sesuai
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForumClassPage(athleteName: 'John Doe'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login as Athlete',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoachPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login as Coach',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class LoginMainPage extends StatelessWidget {
//   const LoginMainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Main Page'),
//         backgroundColor: Colors.orange[700],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             'Login as:',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                   MaterialPageRoute(
//                   builder: (context) => const ForumClassPage(),
//                   ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange[700],
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: const Text(
//               'Login as Athlete',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const CoachPage()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange[700],
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//             child: const Text(
//               'Login as Coach',
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//   Widget _buildFeatureBox({required IconData icon, required String text}) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.orange[100],
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             blurRadius: 4,
//             offset: const Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           const SizedBox(width: 16),
//           Icon(icon, size: 40, color: Colors.black),
//           const SizedBox(width: 16),
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