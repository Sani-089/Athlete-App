// import 'package:flutter/material.dart';

// class NextPage extends StatelessWidget {
//   const NextPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orange[700],
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings),
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
//                       MaterialPageRoute(
//                           builder: (context) => const HeartRatePage()),
//                     );
//                   },
//                   child: _buildFeatureBox(
//                     icon: Icons.favorite,
//                     text: 'Heart Rate Data',
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const AthleteInsightPage()),
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
//                       MaterialPageRoute(
//                         builder: (context) => const HistoryPage(
//                           athleteName: '',
//                         ),
//                       ),
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

//   Widget _buildFeatureBox({required IconData icon, required String text}) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             size: 32,
//             color: Colors.orange[700],
//           ),
//           const SizedBox(width: 16),
//           Text(
//             text,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HeartRatePage extends StatelessWidget {
//   const HeartRatePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Heart Rate Data'),
//       ),
//       body: const Center(
//         child: Text('Heart Rate Page Content'),
//       ),
//     );
//   }
// }

// class AthleteInsightPage extends StatelessWidget {
//   const AthleteInsightPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Athlete Insight'),
//       ),
//       body: const Center(
//         child: Text('Athlete Insight Page Content'),
//       ),
//     );
//   }
// }

// class HistoryPage extends StatelessWidget {
//   final String athleteName;

//   const HistoryPage({super.key, required this.athleteName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Heart & Sleep History'),
//       ),
//       body: Center(
//         child: Text('History for $athleteName'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'heartrate.dart';  // Pastikan untuk mengimpor HeartRatePage
import 'athleteinsight.dart'; 
import 'history.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Tambahkan logika untuk pengaturan di sini
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16), // Spasi atas
          Center(
            child: Image.asset(
              "images/menu.png",
              width: 200, // Lebar gambar
              height: 200, // Tinggi gambar
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                ); // Tampilkan ikon jika gambar gagal dimuat
              },
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'OUR FEATURE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HeartRatePage()),  // Navigasi ke HeartRatePage
                    );
                  },
                  child: _buildFeatureBox(
                    icon: Icons.favorite,
                    text: 'Heart Rate Data',
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AthleteInsightPage()),
                    );
                  },
                  child: _buildFeatureBox(
                    icon: Icons.insights,
                    text: 'Athlete Insight',
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(
                          athleteName: '',
                        ),
                      ),
                    );
                  },
                  child: _buildFeatureBox(
                    icon: Icons.history,
                    text: 'Heart & Sleep History',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBox({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
            color: Colors.orange[700],
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
