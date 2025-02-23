//KODE FIX TANPA GRAFIK
// import 'dart:developer' as developer; // Untuk log
// import 'package:flutter/material.dart';
// import 'history.dart'; // Pastikan HistoryPage ada di sini
// import 'profile.dart';
// import 'login.dart'; // Import LoginPage
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String prediction = "Loading..."; // Default teks sementara untuk prediksi
//   int _currentIndex = 0; // Menyimpan halaman yang aktif
  
//   // Referensi ke Firebase Database untuk data BPM dan SpO2
//   final DatabaseReference heartRateRef = FirebaseDatabase.instance.ref('sensor_data/heart_rate');
//   final DatabaseReference spo2Ref = FirebaseDatabase.instance.ref('sensor_data/spo2');

//   // Variabel untuk menyimpan nilai terakhir
//   String lastHeartRate = "";
//   String lastSpo2 = "";

//   // Fungsi untuk mengirim data ke server Flask
//   Future<void> _sendDataToServer(String heartRate, String spo2) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.8:5000/predict'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'heartRate': int.tryParse(heartRate) ?? 0,
//           'spo2': int.tryParse(spo2) ?? 0,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         developer.log('Response data: $data', name: 'API Response');
//         setState(() {
//           prediction = data['prediction'] ?? 'No Data';
//         });
//       } else {
//         developer.log(
//           'Error: ${response.statusCode} - ${response.body}',
//           name: 'API Error',
//         );
//         setState(() {
//           prediction = 'Error: Unable to fetch prediction';
//         });
//       }
//     } catch (e) {
//       developer.log('Error: $e', name: 'API Error');
//       setState(() {
//         prediction = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1E3A5F),
//         iconTheme: const IconThemeData(color: Colors.transparent),
//         elevation: 0,
//         centerTitle: true,
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
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             const CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage("images/profile.png"),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Athlete App",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Detak Jantung
//                   StreamBuilder(
//                     stream: heartRateRef.onValue,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return _buildStatCard("-", "Detak Jantung", Icons.favorite, Colors.red);
//                       } else if (snapshot.hasError) {
//                         return _buildStatCard("Error", "Detak Jantung", Icons.error, Colors.red);
//                       } else if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
//                         return _buildStatCard("-", "Detak Jantung", Icons.favorite, Colors.red);
//                       } else {
//                         final heartRate = snapshot.data!.snapshot.value.toString();
//                         if (heartRate != lastHeartRate) {
//                           lastHeartRate = heartRate;
//                           // Kirim data baru ke server langsung
//                           _sendDataToServer(heartRate, lastSpo2); 
//                         }
//                         return _buildStatCard("$heartRate BPM", "Detak Jantung", Icons.favorite, Colors.red);
//                       }
//                     },
//                   ),
//                   StreamBuilder(
//                     stream: spo2Ref.onValue,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return _buildStatCard("-", "SpO2", Icons.water_drop, Colors.red);
//                       } else if (snapshot.hasError) {
//                         return _buildStatCard("Error", "SpO2", Icons.error, Colors.red);
//                       } else if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
//                         return _buildStatCard("-", "SpO2", Icons.water_drop, Colors.red);
//                       } else {
//                         final spo2 = snapshot.data!.snapshot.value.toString();
//                         if (spo2 != lastSpo2) {
//                           lastSpo2 = spo2;
//                           // Kirim data baru ke server langsung
//                           _sendDataToServer(lastHeartRate, spo2); 
//                         }
//                         return _buildStatCard("$spo2%", "SpO2", Icons.water_drop, Colors.red);
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const HistoryPage()),
//                 );
//               },
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: _buildStatCard(prediction, "Prediksi", Icons.check_circle, Colors.green),
//               ),
//             ),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFF1E3A5F),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.logout),
//             label: 'Logout',
//           ),
//         ],
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const ProfilePage()),
//             );
//           } else if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const LoginPage()),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildStatCard(String value, String label, IconData icon, Color iconColor) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             offset: const Offset(0, 4),
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: iconColor, size: 30),
//           const SizedBox(height: 10),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//GRAFIK

// import 'dart:developer' as developer;
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'history.dart'; // Pastikan HistoryPage ada di sini
// import 'login.dart'; // Import LoginPage
// import 'package:fl_chart/fl_chart.dart'; // Import fl_chart untuk grafik

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String prediction = "Loading...";
//   int _currentIndex = 0;

//   final DatabaseReference heartRateRef = FirebaseDatabase.instance.ref('sensor_data/heart_rate');
//   final DatabaseReference spo2Ref = FirebaseDatabase.instance.ref('sensor_data/spo2');
//   List<FlSpot> heartRateData = [];
//   List<FlSpot> spo2Data = [];

//   String lastHeartRate = "";
//   String lastSpo2 = "";

//   /// Fungsi untuk mengirim data ke Firestore
//   Future<void> sendDataToFirestore(String heartRate, String spo2, String prediction) async {
//     try {
//       CollectionReference collection = FirebaseFirestore.instance.collection('sensor_predictions');
//       await collection.add({
//         'heartRate': int.tryParse(heartRate) ?? 0,
//         'spo2': int.tryParse(spo2) ?? 0,
//         'prediction': prediction,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//       developer.log('Data berhasil dikirim ke Firestore', name: 'Firestore');
//     } catch (e) {
//       developer.log('Error mengirim data ke Firestore: $e', name: 'Firestore');
//     }
//   }

//   /// Fungsi untuk mengirim data ke server Flask
//   Future<void> _sendDataToServer(String heartRate, String spo2) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.6:5000/predict'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({  
//           'heartRate': int.tryParse(heartRate) ?? 0,
//           'spo2': int.tryParse(spo2) ?? 0,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         developer.log('Response data: $data', name: 'API Response');
//         setState(() {
//           prediction = data['prediction'] ?? 'No Data';
//         });
//         // Kirim data ke Firestore
//         sendDataToFirestore(heartRate, spo2, prediction);
//       } else {
//         developer.log(
//           'Error: ${response.statusCode} - ${response.body}',
//           name: 'API Error',
//         );
//         setState(() {
//           prediction = 'Error: Unable to fetch prediction';
//         });
//       }
//     } catch (e) {
//       developer.log('Error: $e', name: 'API Error');
//       setState(() {
//         prediction = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1E3A5F),
//         iconTheme: const IconThemeData(color: Colors.transparent),
//         elevation: 0,
//         centerTitle: true,
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
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             Image.asset(
//               'images/profile.png',
//               width: 110,
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Athlete App",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   StreamBuilder(
//                     stream: heartRateRef.onValue,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return _buildStatCard("-", "Detak Jantung", Icons.favorite, Colors.red);
//                       } else if (snapshot.hasError) {
//                         return _buildStatCard("Error", "Detak Jantung", Icons.error, Colors.red);
//                       } else if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
//                         return _buildStatCard("-", "Detak Jantung", Icons.favorite, Colors.red);
//                       } else {
//                         final heartRate = snapshot.data!.snapshot.value.toString();
//                         if (heartRate != lastHeartRate) {
//                           lastHeartRate = heartRate;
//                           _sendDataToServer(heartRate, lastSpo2);
//                         }
//                         heartRateData.add(FlSpot(DateTime.now().millisecondsSinceEpoch.toDouble(), double.tryParse(heartRate) ?? 0));
//                         return _buildStatCard("$heartRate BPM", "Detak Jantung", Icons.favorite, Colors.red);
//                       }
//                     },
//                   ),
//                   StreamBuilder(
//                     stream: spo2Ref.onValue,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return _buildStatCard("-", "SpO2", Icons.water_drop, Colors.red);
//                       } else if (snapshot.hasError) {
//                         return _buildStatCard("Error", "SpO2", Icons.error, Colors.red);
//                       } else if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
//                         return _buildStatCard("-", "SpO2", Icons.water_drop, Colors.red);
//                       } else {
//                         final spo2 = snapshot.data!.snapshot.value.toString();
//                         if (spo2 != lastSpo2) {
//                           lastSpo2 = spo2;
//                           _sendDataToServer(lastHeartRate, spo2);
//                         }
//                         spo2Data.add(FlSpot(DateTime.now().millisecondsSinceEpoch.toDouble(), double.tryParse(spo2) ?? 0));
//                         return _buildStatCard("$spo2%", "SpO2", Icons.water_drop, Colors.red);
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const HistoryPage()),
//                 );
//               },
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: _buildStatCard(prediction, "Prediksi", Icons.check_circle, Colors.green),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Grafik Detak Jantung dan SpO2",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                 child: LineChart(
//                   LineChartData(
//                     gridData: FlGridData(show: true),
//                     titlesData: FlTitlesData(show: true),
//                     borderData: FlBorderData(show: true),
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: heartRateData,
//                         isCurved: true,
//                         color: Colors.red,
//                         barWidth: 4,
//                       ),
//                       LineChartBarData(
//                         spots: spo2Data,
//                         isCurved: true,
//                         color: Colors.blue,
//                         barWidth: 4,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: const Color(0xFF1E3A5F),
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.logout),
//             label: 'Logout',
//           ),
//         ],
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HistoryPage()),
//             );
//           } else if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const LoginPage()),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildStatCard(String value, String label, IconData icon, Color iconColor) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.symmetric(horizontal: 10),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             offset: const Offset(0, 4),
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: iconColor, size: 30),
//           const SizedBox(height: 10),
//           Text(
//             value,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 14,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

 // HAPUS GRAFIK 
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'history.dart'; // Pastikan HistoryPage ada di sini
import 'login.dart'; // Import LoginPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String prediction = "Loading...";
  int _currentIndex = 0;

  final DatabaseReference heartRateRef = FirebaseDatabase.instance.ref('sensor_data/heart_rate');
  final DatabaseReference spo2Ref = FirebaseDatabase.instance.ref('sensor_data/spo2');
  
  String lastHeartRate = "";
  String lastSpo2 = "";

  /// Fungsi untuk mengirim data ke Firestore
  Future<void> sendDataToFirestore(String heartRate, String spo2, String prediction) async {
    try {
      CollectionReference collection = FirebaseFirestore.instance.collection('sensor_predictions');
      await collection.add({
        'heartRate': int.tryParse(heartRate) ?? 0,
        'spo2': int.tryParse(spo2) ?? 0,
        'prediction': prediction,
        'timestamp': FieldValue.serverTimestamp(),
      });
      developer.log('Data berhasil dikirim ke Firestore', name: 'Firestore');
    } catch (e) {
      developer.log('Error mengirim data ke Firestore: $e', name: 'Firestore');
    }
  }

  /// Fungsi untuk mengirim data ke server Flask
  Future<void> _sendDataToServer(String heartRate, String spo2) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.6:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({  
          'heartRate': int.tryParse(heartRate) ?? 0,
          'spo2': int.tryParse(spo2) ?? 0,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        developer.log('Response data: $data', name: 'API Response');
        setState(() {
          prediction = data['prediction'] ?? 'No Data';
        });
        // Kirim data ke Firestore
        sendDataToFirestore(heartRate, spo2, prediction);
      } else {
        developer.log(
          'Error: ${response.statusCode} - ${response.body}',
          name: 'API Error',
        );
        setState(() {
          prediction = 'Error: Unable to fetch prediction';
        });
      }
    } catch (e) {
      developer.log('Error: $e', name: 'API Error');
      setState(() {
        prediction = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A5F),
        iconTheme: const IconThemeData(color: Colors.transparent),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Image.asset(
                'images/profile.png',
                width: 110,
              ),
              const SizedBox(height: 20),
              const Text(
                "Athlete App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StreamBuilder(
                      stream: heartRateRef.onValue,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return _buildStatCard("-", "Detak Jantung", Icons.favorite, Colors.red);
                        } else if (snapshot.hasError) {
                          return _buildStatCard("Error", "Detak Jantung", Icons.error, Colors.red);
                        } else if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                          return _buildStatCard("-", "Detak Jantung", Icons.favorite, Colors.red);
                        } else {
                          final heartRate = snapshot.data!.snapshot.value.toString();
                          if (heartRate != lastHeartRate) {
                            lastHeartRate = heartRate;
                            _sendDataToServer(heartRate, lastSpo2);
                          }
                          return _buildStatCard("$heartRate BPM", "Detak Jantung", Icons.favorite, Colors.red);
                        }
                      },
                    ),
                    StreamBuilder(
                      stream: spo2Ref.onValue,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return _buildStatCard("-", "SpO2", Icons.water_drop, Colors.red);
                        } else if (snapshot.hasError) {
                          return _buildStatCard("Error", "SpO2", Icons.error, Colors.red);
                        } else if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
                          return _buildStatCard("-", "SpO2", Icons.water_drop, Colors.red);
                        } else {
                          final spo2 = snapshot.data!.snapshot.value.toString();
                          if (spo2 != lastSpo2) {
                            lastSpo2 = spo2;
                            _sendDataToServer(lastHeartRate, spo2);
                          }
                          return _buildStatCard("$spo2%", "SpO2", Icons.water_drop, Colors.red);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoryPage()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: _buildStatCard(prediction, "Prediksi", Icons.check_circle, Colors.green),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E3A5F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HistoryPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildStatCard(String value, String label, IconData icon, Color iconColor) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

  //Menambahkan fungsi saveSensorData() tanpa mengubah kode lain.
//Memanggil saveSensorData() di dalam _sendDataToServer() agar data sensor selalu disimpan sebelum dikirim ke server.
// import 'dart:developer' as developer;
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'history.dart'; // Pastikan HistoryPage ada di sini
// import 'login.dart'; // Import LoginPage
// import 'package:fl_chart/fl_chart.dart'; // Import fl_chart untuk grafik

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String prediction = "Loading...";
//   int _currentIndex = 0;

//   final DatabaseReference heartRateRef = FirebaseDatabase.instance.ref('sensor_data/heart_rate');
//   final DatabaseReference spo2Ref = FirebaseDatabase.instance.ref('sensor_data/spo2');

//   String lastHeartRate = "";
//   String lastSpo2 = "";

//   Future<void> saveSensorData(String heartRate, String spo2, String prediction) async {
//     final uid = FirebaseAuth.instance.currentUser?.uid;
//     if (uid == null) {
//       print("UID tidak ditemukan. Pastikan pengguna sudah login.");
//       return;
//     }

//     DocumentSnapshot athleteDoc = await FirebaseFirestore.instance.collection('athletes').doc(uid).get();
//     Map<String, dynamic>? athleteData = athleteDoc.data() as Map<String, dynamic>?;

//     if (athleteData == null) {
//       print("Data atlet tidak ditemukan untuk UID: $uid");
//       return;
//     }

//     await FirebaseFirestore.instance.collection('sensor_readings').add({
//       'uid': uid,
//       'heartRate': int.tryParse(heartRate) ?? 0,
//       'spo2': int.tryParse(spo2) ?? 0,
//       'prediction': prediction,
//       'timestamp': FieldValue.serverTimestamp(),
//       'umur': athleteData['umur'],
//       'berat_badan': athleteData['berat_badan'],
//       'merokok': athleteData['merokok'],
//       'cabang_olahraga': athleteData['cabang_olahraga'],
//     });

//     print("Data sensor, atlet, dan prediksi berhasil disimpan!");
//   }

//   Future<void> _sendDataToServer(String heartRate, String spo2) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.6:5000/predict'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({  
//           'heartRate': int.tryParse(heartRate) ?? 0,
//           'spo2': int.tryParse(spo2) ?? 0,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         developer.log('Response data: $data', name: 'API Response');
//         setState(() {
//           prediction = data['prediction'] ?? 'No Data';
//         });
//         await saveSensorData(heartRate, spo2, prediction);
//       } else {
//         developer.log(
//           'Error: ${response.statusCode} - ${response.body}',
//           name: 'API Error',
//         );
//         setState(() {
//           prediction = 'Error: Unable to fetch prediction';
//         });
//       }
//     } catch (e) {
//       developer.log('Error: $e', name: 'API Error');
//       setState(() {
//         prediction = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1E3A5F),
//         centerTitle: true,
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
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(height: 30),
//             Image.asset('images/profile.png', width: 110),
//             const SizedBox(height: 20),
//             const Text(
//               "Athlete App",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   StreamBuilder(
//                     stream: heartRateRef.onValue,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
//                         final heartRate = snapshot.data!.snapshot.value.toString();
//                         if (heartRate != lastHeartRate) {
//                           lastHeartRate = heartRate;
//                           _sendDataToServer(heartRate, lastSpo2);
//                         }
//                         return Text("$heartRate BPM");
//                       }
//                       return Text("-");
//                     },
//                   ),
//                   StreamBuilder(
//                     stream: spo2Ref.onValue,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
//                         final spo2 = snapshot.data!.snapshot.value.toString();
//                         if (spo2 != lastSpo2) {
//                           lastSpo2 = spo2;
//                           _sendDataToServer(lastHeartRate, spo2);
//                         }
//                         return Text("$spo2%");
//                       }
//                       return Text("-");
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
 