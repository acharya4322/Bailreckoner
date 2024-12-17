import 'package:flutter/material.dart';

class CaseUpdatesPage extends StatelessWidget {
  const CaseUpdatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy case updates data
    final List<Map<String, dynamic>> caseUpdates = [
      {
        'caseNumber': 'C-2024-001',
        'update': 'Client hearing scheduled on Dec 15, 2024.',
        'date': 'Dec 5, 2024',
        'status': 'Upcoming',
      },
      {
        'caseNumber': 'C-2024-002',
        'update': 'Verification process completed.',
        'date': 'Dec 3, 2024',
        'status': 'Completed',
      },
      {
        'caseNumber': 'C-2024-003',
        'update': 'Awaiting document submission from the client.',
        'date': 'Dec 2, 2024',
        'status': 'Pending',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Case Updates',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Updates',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: caseUpdates.length,
                itemBuilder: (context, index) {
                  final caseUpdate = caseUpdates[index];
                  return _buildCaseUpdateCard(caseUpdate);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for chatbot
        },
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildCaseUpdateCard(Map<String, dynamic> caseUpdate) {
    Color statusColor;
    IconData statusIcon;

    switch (caseUpdate['status']) {
      case 'Completed':
        statusColor = const Color(0xFF4CAF50); // Green
        statusIcon = Icons.check_circle;
        break;
      case 'Upcoming':
        statusColor = const Color(0xFF2196F3); // Blue
        statusIcon = Icons.schedule;
        break;
      case 'Pending':
        statusColor = const Color(0xFFFF9800); // Orange
        statusIcon = Icons.warning_amber_rounded;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.info_outline;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFF3F5F8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Status Icon with Background
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    statusIcon,
                    color: statusColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Case: ${caseUpdate['caseNumber']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                // Status Tag
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    caseUpdate['status'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Update Details
            Text(
              caseUpdate['update'],
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Last Updated: ${caseUpdate['date']}',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
