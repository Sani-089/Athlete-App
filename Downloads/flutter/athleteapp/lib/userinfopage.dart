// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:shared_preferences/shared_preferences.dart';

// class UserInfoPage extends StatefulWidget {
//   const UserInfoPage({super.key});

//   @override
//   State<UserInfoPage> createState() => _UserInfoPageState();
// }

// class _UserInfoPageState extends State<UserInfoPage> {
//   final TextEditingController usiaController = TextEditingController();
//   final TextEditingController beratBadanController = TextEditingController();
//   final TextEditingController cabangOlahragaController = TextEditingController();
//   String? jenisKelamin;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserInfo();
//   }

//   // Memuat data pengguna yang tersimpan
//   Future<void> _loadUserInfo() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       usiaController.text = prefs.getString('usia') ?? '';
//       jenisKelamin = prefs.getString('jenisKelamin');
//       beratBadanController.text = prefs.getString('beratBadan') ?? '';
//       cabangOlahragaController.text = prefs.getString('cabangOlahraga') ?? '';
//     });
//   }

//   // Menyimpan data pengguna
//   Future<void> _saveUserInfo() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('usia', usiaController.text);
//     await prefs.setString('jenisKelamin', jenisKelamin ?? '');
//     await prefs.setString('beratBadan', beratBadanController.text);
//     await prefs.setString('cabangOlahraga', cabangOlahragaController.text);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Data berhasil disimpan")),
//     );

//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Input Data Pengguna")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: usiaController,
//               decoration: const InputDecoration(labelText: "Usia (tahun)"),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: "Jenis Kelamin"),
//               value: jenisKelamin,
//               items: ["laki-laki", "perempuan"].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (newValue) {
//                 setState(() {
//                   jenisKelamin = newValue;
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: beratBadanController,
//               decoration: const InputDecoration(labelText: "Berat Badan (kg)"),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: cabangOlahragaController,
//               decoration: const InputDecoration(labelText: "Cabang Olahraga (ID)"),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _saveUserInfo,
//               child: const Text("Simpan"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
