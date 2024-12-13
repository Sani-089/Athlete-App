// import 'package:flutter/material.dart';

// class ForumClassPage extends StatelessWidget {
//   final String athleteName;

//   const ForumClassPage({super.key, required this.athleteName});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forum/Class List'),
//         backgroundColor: Colors.orange[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//               'Welcome, $athleteName! Join a forum/class below:',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             _buildForumClassItem('Class 1: Strength Training'),
//             _buildForumClassItem('Class 2: Cardio and Stamina'),
//             _buildForumClassItem('Forum: General Q&A'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildForumClassItem(String title) {
//     return Card(
//       elevation: 4.0,
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       child: ListTile(
//         title: Text(
//           title,
//           style: const TextStyle(fontSize: 16),
//         ),
//         trailing: ElevatedButton(
//           onPressed: () {
//             // Placeholder for action when joining a forum/class
//           },
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[700]),
//           child: const Text('Join'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'nextpage.dart';  // Import halaman NextPage yang akan dibuat

class ForumClassPage extends StatefulWidget {
  final String athleteName;

  const ForumClassPage({super.key, required this.athleteName});

  @override
  // ignore: library_private_types_in_public_api
  _ForumClassPageState createState() => _ForumClassPageState();
}

class _ForumClassPageState extends State<ForumClassPage> {
  // Variable untuk menunjukkan status 'join' pada class
  bool _isJoined = false;

  // Fungsi untuk menampilkan pesan sukses
  void _joinClass() {
    setState(() {
      _isJoined = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forum/Class List'),
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome, ${widget.athleteName}! Join a forum/class below:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildForumClassItem('Class 1: Strength Training'),
            _buildForumClassItem('Class 2: Cardio and Stamina'),
            _buildForumClassItem('Forum: General Q&A'),
            
            // Menampilkan pesan 'Sukses Join' jika sudah di join
            if (_isJoined) ...[
              const SizedBox(height: 20),
              const Text(
                'Sukses Join!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextPage()),
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
                  'Go to Next Page',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildForumClassItem(String title) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            _joinClass();  // Panggil fungsi untuk menandai bahwa kelas telah di-join
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[700]),
          child: const Text('Join'),
        ),
      ),
    );
  }
}
