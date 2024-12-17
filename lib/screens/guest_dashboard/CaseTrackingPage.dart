import 'package:flutter/material.dart';

class CaseTrackingPage extends StatelessWidget {
  const CaseTrackingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> stages = [
      {'stage': 'Case Applied', 'status': 'Completed', 'date': 'Dec 1, 2024'},
      {'stage': 'Verification', 'status': 'Completed', 'date': 'Dec 2, 2024'},
      {
        'stage': 'Bail Hearing Scheduled',
        'status': 'In Progress',
        'date': 'Dec 10, 2024'
      },
      {'stage': 'Final Hearing', 'status': 'Pending', 'date': ''},
      {'stage': 'Case Closed', 'status': 'Pending', 'date': ''},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Case Tracking'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Case Number: 12345-2024',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Track the progress of your case below:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: stages.length,
                itemBuilder: (context, index) {
                  final stage = stages[index];
                  return _buildStageCard(
                    stage: stage['stage'],
                    status: stage['status'],
                    date: stage['date'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStageCard({
    required String stage,
    required String status,
    required String date,
  }) {
    Color statusColor;
    switch (status) {
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'In Progress':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: statusColor,
              radius: 22,
              child: Icon(
                _getIconForStatus(status),
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stage,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 16,
                      color: statusColor,
                    ),
                  ),
                  if (date.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Date: $date',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Returns an appropriate icon for each status
  IconData _getIconForStatus(String status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle;
      case 'In Progress':
        return Icons.hourglass_empty;
      case 'Pending':
        return Icons.access_time;
      default:
        return Icons.help_outline;
    }
  }
}
