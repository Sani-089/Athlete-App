// import 'package:flutter/material.dart';

// class HistoryPage extends StatelessWidget {
//   // Example history data (this could be fetched from an API or local storage)
//   final List<Map<String, String>> heartRateHistory = [
//     {"date": "2024-12-01", "heartRate": "75 bpm"},
//     {"date": "2024-12-02", "heartRate": "80 bpm"},
//     {"date": "2024-12-03", "heartRate": "78 bpm"},
//     {"date": "2024-12-04", "heartRate": "72 bpm"},
//   ];

//   final List<Map<String, String>> athleteInsightHistory = [
//     {"date": "2024-12-01", "sleepHours": "8 hours"},
//     {"date": "2024-12-02", "sleepHours": "7.5 hours"},
//     {"date": "2024-12-03", "sleepHours": "8 hours"},
//     {"date": "2024-12-04", "sleepHours": "8.2 hours"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('History'),
//         backgroundColor: Colors.orange[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Heart Rate History Section
//             const Text(
//               'Heart Rate History',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//             const SizedBox(height: 10),
//             _buildHistorySection(heartRateHistory, 'Heart Rate'),

//             const SizedBox(height: 20),
//             // Athlete Insight History Section
//             const Text(
//               'Sleep Hours from Athlete Insight',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.orange,
//               ),
//             ),
//             const SizedBox(height: 10),
//             _buildHistorySection(athleteInsightHistory, 'Sleep Hours'),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper method to build a history section for heart rate or sleep hours
//   Widget _buildHistorySection(List<Map<String, String>> historyData, String type) {
//     return Column(
//       children: historyData.map((item) {
//         return Card(
//           elevation: 4.0,
//           margin: const EdgeInsets.symmetric(vertical: 8.0),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ListTile(
//             contentPadding: const EdgeInsets.all(16.0),
//             title: Text(
//               'Date: ${item["date"]}',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               '$type: ${item[type.toLowerCase()]}',
//               style: const TextStyle(fontSize: 16),
//             ),
//             trailing: const Icon(Icons.history, color: Colors.orange),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final String athleteName;

  // Non-constant data lists
  final List<Map<String, String>> heartRateHistory = [
    {"date": "2024-12-01", "heartRate": "75 bpm"},
    {"date": "2024-12-02", "heartRate": "80 bpm"},
    {"date": "2024-12-03", "heartRate": "78 bpm"},
    {"date": "2024-12-04", "heartRate": "72 bpm"},
  ];

  final List<Map<String, String>> athleteInsightHistory = [
    {"date": "2024-12-01", "sleepHours": "8 hours"},
    {"date": "2024-12-02", "sleepHours": "7.5 hours"},
    {"date": "2024-12-03", "sleepHours": "8 hours"},
    {"date": "2024-12-04", "sleepHours": "8.2 hours"},
  ];

  // Non-const constructor
  HistoryPage({super.key, required this.athleteName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History of $athleteName'),
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Heart Rate History Section
            const Text(
              'Heart Rate History',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            _buildHistorySection(heartRateHistory, 'Heart Rate'),

            const SizedBox(height: 20),
            // Athlete Insight History Section
            const Text(
              'Sleep Hours from Athlete Insight',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            _buildHistorySection(athleteInsightHistory, 'Sleep Hours'),
          ],
        ),
      ),
    );
  }

  // Helper method to build a history section for heart rate or sleep hours
  Widget _buildHistorySection(List<Map<String, String>> historyData, String type) {
    return Column(
      children: historyData.map((item) {
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text(
              'Date: ${item["date"]}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '$type: ${item[type.toLowerCase()]}',
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.history, color: Colors.orange),
          ),
        );
      }).toList(),
    );
  }
}
