//FIXX
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'home.dart';

// class IdentityAthletePage extends StatefulWidget {
//   const IdentityAthletePage({super.key});

//   @override
//   State<IdentityAthletePage> createState() => _IdentityAthletePageState();
// }

// class _IdentityAthletePageState extends State<IdentityAthletePage> {
//   final TextEditingController _umurController = TextEditingController();
//   final TextEditingController _beratBadanController = TextEditingController();
//   final TextEditingController _merokokController = TextEditingController();

//   Future<void> _submitData() async {
//     try {
//       final umur = int.tryParse(_umurController.text.trim());
//       final beratBadan = int.tryParse(_beratBadanController.text.trim());
//       final merokokInput = _merokokController.text.trim().toLowerCase();
      

//       // Validasi input
//       if (umur == null || beratBadan == null || (merokokInput != 'ya' && merokokInput != 'tidak')) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Input tidak valid! Pastikan semua data terisi dengan benar.')),
//           );
//         }
//         return;
//       }

//       // Konversi "ya" ke 1 dan "tidak" ke 0
//       final merokok = merokokInput == 'ya' ? 1 : 0;

//       debugPrint('Data dikirim ke Firestore: umur=$umur, berat_badan=$beratBadan, merokok=$merokok');

//       await FirebaseFirestore.instance.collection('athlete_data').add({
//         'umur': umur,
//         'berat_badan': beratBadan,
//         'merokok': merokok,
//         'created_at': FieldValue.serverTimestamp(),
//       });

//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Data berhasil disimpan!')),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomePage()),
//         );
//       }
//     } catch (e, stackTrace) {
//       debugPrint('Error saat menyimpan data ke Firestore: $e');
//       debugPrint('StackTrace: $stackTrace');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Gagal menyimpan data: ${e.toString()}')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Identity Athlete", style: TextStyle(color: Colors.white)),
//         backgroundColor: const Color(0xFF1E3A5F),
//         iconTheme: const IconThemeData(color: Colors.white),
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF1E3A5F),
//               Color(0xFF4A90E2),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Isi Data Diri Anda",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Umur Input Field
//               TextField(
//                 controller: _umurController,
//                 decoration: InputDecoration(
//                   labelText: 'Umur',
//                   labelStyle: const TextStyle(color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 20),

//               // Berat Badan Input Field
//               TextField(
//                 controller: _beratBadanController,
//                 decoration: InputDecoration(
//                   labelText: 'Berat Badan (kg)',
//                   labelStyle: const TextStyle(color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 20),

//               // Merokok Input Field
//               TextField(
//                 controller: _merokokController,
//                 decoration: InputDecoration(
//                   labelText: 'Merokok (ketik "ya" atau "tidak")',
//                   labelStyle: const TextStyle(color: Colors.white),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),

//               // Register Button
//               ElevatedButton(
//                 onPressed: _submitData,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 250, 249, 250),
//                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   'Register',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//menambahkan fitur cabang olahraga
//✅ Menautkan data atlet ke UID Firebase Authentication
//✅ Menggabungkan data atlet dengan data sensor sebelum dikirim ke server
//✅ Mengirim data ke server Flask untuk klasifikasi Naïve Bayes
//✅ Menampilkan hasil klasifikasi di UI aplikasi

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // DITAMBAHKAN
import 'home.dart';

class IdentityAthletePage extends StatefulWidget {
  const IdentityAthletePage({super.key});

  @override
  State<IdentityAthletePage> createState() => _IdentityAthletePageState();
}

class _IdentityAthletePageState extends State<IdentityAthletePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _beratBadanController = TextEditingController();
  final TextEditingController _merokokController = TextEditingController();
  final TextEditingController _cabangOlahragaController = TextEditingController();

  Future<void> _submitData() async {
    try {
      final nama = _namaController.text.trim();
      final umur = int.tryParse(_umurController.text.trim());
      final beratBadan = int.tryParse(_beratBadanController.text.trim());
      final merokokInput = _merokokController.text.trim().toLowerCase();
      final cabangOlahraga = _cabangOlahragaController.text.trim();

      if (nama.isEmpty || umur == null || beratBadan == null || (merokokInput != 'ya' && merokokInput != 'tidak') || cabangOlahraga.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Input tidak valid!')),
        );
        return;
      }

      final merokok = merokokInput == 'ya' ? 1 : 0;
      final uid = FirebaseAuth.instance.currentUser?.uid; // Ambil UID pengguna

      if (uid == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mendapatkan UID pengguna.')),
        );
        return;
      }

      await FirebaseFirestore.instance.collection('athletes').doc(uid).set({
        'uid': uid,
        'nama': nama,
        'umur': umur,
        'berat_badan': beratBadan,
        'merokok': merokok,
        'cabang_olahraga': cabangOlahraga,
        'created_at': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil disimpan!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menyimpan data: $e')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Identity Athlete", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E3A5F),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1E3A5F),
                  Color(0xFF4A90E2),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Isi Data Diri Anda",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                        
                  TextField(
                    controller: _namaController,
                    decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                        
                  TextField(
                    controller: _umurController,
                    decoration: InputDecoration(
                      labelText: 'Umur',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                        
                  TextField(
                    controller: _beratBadanController,
                    decoration: InputDecoration(
                      labelText: 'Berat Badan (kg)',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                        
                  TextField(
                    controller: _merokokController,
                    decoration: InputDecoration(
                      labelText: 'Merokok (ketik "ya" atau "tidak")',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                        
                  TextField(
                    controller: _cabangOlahragaController,
                    decoration: InputDecoration(
                      labelText: 'Cabang Olahraga',
                      labelStyle: const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                        
                  ElevatedButton(
                    onPressed: _submitData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 250, 249, 250),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
