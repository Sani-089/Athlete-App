import 'package:flutter/material.dart';

class AthleteInsightPage extends StatefulWidget {
  const AthleteInsightPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AthleteInsightPageState createState() => _AthleteInsightPageState();
}

class _AthleteInsightPageState extends State<AthleteInsightPage> {
  // Controllers for the input fields
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _smokingController = TextEditingController();
  final TextEditingController _heartRateController = TextEditingController();

  // Variable to store the classification result
  String _sleepHoursResult = '';

  // Function to simulate the classification from the server
  void _submitData() {
    // Example classification logic (can be replaced with actual server logic)
    int age = int.tryParse(_ageController.text) ?? 0;
    int weight = int.tryParse(_weightController.text) ?? 0;
    int height = int.tryParse(_heightController.text) ?? 0;
    int heartRate = int.tryParse(_heartRateController.text) ?? 0;
    String smokingCondition = _smokingController.text.trim().toLowerCase();

    // Simulate the classification process
    setState(() {
      if (age > 0 && weight > 0 && height > 0 && heartRate > 0) {
        // Simple classification based on example data (replace with actual logic)
        if (smokingCondition == 'yes') {
          _sleepHoursResult = 'Predicted Sleep Hours: 6 hours';
        } else {
          _sleepHoursResult = 'Predicted Sleep Hours: 8 hours';
        }
      } else {
        _sleepHoursResult = 'Please fill in all the fields correctly.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Athlete Insight'),
        backgroundColor: Colors.orange[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                'Enter Athlete Data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 20),

              // Age Input Field
              _buildInputField('Age', _ageController, TextInputType.number),
              const SizedBox(height: 12),

              // Weight Input Field
              _buildInputField('Weight (kg)', _weightController, TextInputType.number),
              const SizedBox(height: 12),

              // Height Input Field
              _buildInputField('Height (cm)', _heightController, TextInputType.number),
              const SizedBox(height: 12),

              // Smoking Condition Input Field
              _buildInputField('Smoking Condition (Yes/No)', _smokingController, TextInputType.text),
              const SizedBox(height: 12),

              // Heart Rate Input Field
              _buildInputField('Heart Rate (bpm)', _heartRateController, TextInputType.number),
              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700], // Button color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Display Sleep Hours Result after submission
              if (_sleepHoursResult.isNotEmpty) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Sleep Hours Prediction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _sleepHoursResult,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build input fields
  Widget _buildInputField(String label, TextEditingController controller, TextInputType keyboardType) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.orange[50], // Background color for the input field
      ),
    );
  }
}
