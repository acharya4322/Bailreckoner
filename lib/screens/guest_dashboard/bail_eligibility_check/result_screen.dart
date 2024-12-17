import 'package:flutter/material.dart';
import 'additional_details_screen.dart';

class ResultScreen extends StatelessWidget {
  final bool isExistingUser;
  final Map<String, dynamic>? userData;

  ResultScreen({required this.isExistingUser, this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      isExistingUser
                          ? Icons.check_circle_outline
                          : Icons.error_outline,
                      size: 80,
                      color: isExistingUser ? Colors.green : Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      isExistingUser ? 'Record Found!' : 'No Record Found!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isExistingUser ? Colors.green : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Divider(thickness: 1.5, color: Colors.grey.shade300),
                    const SizedBox(height: 12),
                    isExistingUser
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildInfoRow('Name', userData?['name']),
                              _buildInfoRow(
                                  'Father\'s Name', userData?['fatherName']),
                              _buildInfoRow('Date of Birth', userData?['dob']),
                              _buildInfoRow(
                                  'Age', userData?['age']?.toString()),
                              _buildInfoRow('Gender', userData?['gender']),
                              _buildInfoRow('Offense', userData?['offense']),
                              _buildInfoRow('Imprisonment Duration',
                                  '${userData?['imprisonmentDuration']} months'),
                              _buildInfoRow(
                                  'Sections',
                                  (userData?['sections'] as List<dynamic>)
                                      .join(', ')),
                              _buildInfoRow(
                                  'Acts',
                                  (userData?['acts'] as List<dynamic>)
                                      .join(', ')),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  'No record exists for the provided details.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'You need to provide additional details to proceed.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.indigo.shade600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(height: 24),
                    _buildNextStepSection(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label:',
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          Text(
            value ?? 'N/A',
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStepSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Next Step',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.indigo.shade600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Provide additional details to move forward.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdditionalDetailsScreen(
                  prefilledData: userData ?? {},
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          label: const Text(
            'Provide Details',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            backgroundColor: Colors.indigo.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            textStyle: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
