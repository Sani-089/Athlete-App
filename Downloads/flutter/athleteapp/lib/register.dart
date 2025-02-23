import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'identity_athlete.dart';
import 'login.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  Future<void> _register() async {
    try {
      // Buat akun baru menggunakan Firebase Authentication
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Simpan nama pengguna (opsional)
      await userCredential.user?.updateDisplayName(_nameController.text.trim());

      // Navigasi ke halaman berikutnya setelah berhasil registrasi
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const IdentityAthletePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Tampilkan pesan kesalahan
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Registrasi gagal')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Judul halaman
              const Text(
                'Daftar Akun Anda',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

            
              const SizedBox(height: 20),

              // Input Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Alamat Email',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Input Password
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Tombol Next untuk mendaftarkan pengguna
             Center(
  child: ElevatedButton(
    onPressed: _register,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: const Text(
      'Register',
      style: TextStyle(fontSize: 18, color: Color(0xFF1E3A5F)),
    ),
  ),
),

              const SizedBox(height: 20),

              // Tautan untuk login
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
      'Sudah punya akun? ',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()), // Pindah ke halaman login
        );
      },
      child: const Text(
        'Masuk',
        style: TextStyle(
          color: Color.fromARGB(255, 152, 186, 245),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

            ],
          ),
        ),
      ),
    );
  }
}
