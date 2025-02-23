import 'package:athleteapp/firebase_options.dart';
import 'package:flutter/material.dart';
import 'register.dart'; // Impor halaman Register
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Pastikan binding Flutter sudah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Jalankan aplikasi
  runApp(const AthleteApp());
}

class AthleteApp extends StatelessWidget {
  const AthleteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Athlete App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const RegisterPage(), // Halaman pertama aplikasi
    );
  }
}