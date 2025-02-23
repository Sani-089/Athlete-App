// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;
// import 'package:logger/logger.dart';
// import 'dart:convert';

// class DataService {
//   final Logger logger = Logger();

//   // URL server Flask
//   static const String _serverUrl = 'http://127.0.0.1:5000/predict';

//   // Fungsi untuk mengambil data dari Firestore dan Realtime Database, kemudian mengirimkannya ke server Flask
//   Future<void> fetchAndSendData(String userId) async {
//     try {
//       // Ambil data dari Firestore
//       final DocumentSnapshot userData = await FirebaseFirestore.instance.collection('athlete_data').doc(userId).get();

//       if (!userData.exists) {
//         logger.e('Data pengguna tidak ditemukan di Firestore untuk userId: $userId');
//         return;
//       }

//       final umur = userData['umur'] as int?;
//       final beratBadan = userData['berat_badan'] as int?;
//       final merokok = (userData['merokok'] as bool?) ?? false ? 1 : 0;

//       // Validasi data Firestore
//       if (umur == null || beratBadan == null) {
//         logger.e('Data dari Firestore tidak lengkap untuk userId: $userId');
//         return;
//       }

//       // Ambil BPM dari Realtime Database
//       final DatabaseReference bpmRef = FirebaseDatabase.instance.ref('pulse/BPM');
//       final snapshot = await bpmRef.once();
//       final bpm = snapshot.snapshot.value;

//       // Validasi BPM
//       if (bpm == null) {
//         logger.e('Data BPM tidak ditemukan di Realtime Database.');
//         return;
//       }

//       logger.i('Data berhasil diambil: Umur=$umur, Berat Badan=$beratBadan, Ngerokok=$merokok, BPM=$bpm');

//       // Kirim data ke server Flask
//       final response = await http.post(
//         Uri.parse(_serverUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'umur': umur,
//           'berat_badan': beratBadan,
//           'ngerokok': merokok,
//           'bpm': bpm,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         logger.i('Prediksi berhasil: ${data['prediction']}');
//       } else {
//         logger.e('Gagal mengirim data ke server. Status code: ${response.statusCode}. Body: ${response.body}');
//       }
//     } catch (e, stackTrace) {
//       logger.e('Error saat mengambil atau mengirim data.', error: e, stackTrace: stackTrace);
//     }
//   }
// }
