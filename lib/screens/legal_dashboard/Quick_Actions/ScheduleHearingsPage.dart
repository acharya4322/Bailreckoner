import 'package:flutter/material.dart';

class ScheduleHearingsPage extends StatelessWidget {
  const ScheduleHearingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy hearings data
    final List<Map<String, dynamic>> hearings = [
      {
        'caseNumber': 'C-2024-001',
        'date': 'Dec 15, 2024',
        'time': '10:00 AM',
        'location': 'City Courtroom 5',
        'status': 'Scheduled',
      },
      {
        'caseNumber': 'C-2024-002',
        'date': 'Dec 20, 2024',
        'time': '2:00 PM',
        'location': 'County Hall Room 3',
        'status': 'Pending',
      },
      {
        'caseNumber': 'C-2024-003',
        'date': 'Jan 5, 2025',
        'time': '11:00 AM',
        'location': 'Supreme Court Chamber A',
        'status': 'Upcoming',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule Hearings',
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
              'Upcoming Hearings',
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
                itemCount: hearings.length,
                itemBuilder: (context, index) {
                  final hearing = hearings[index];
                  return _buildHearingCard(hearing);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Chatbot action
        },
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildHearingCard(Map<String, dynamic> hearing) {
    Color statusColor;
    String statusText;

    switch (hearing['status']) {
      case 'Scheduled':
        statusColor = const Color(0xFF4CAF50); // Green
        statusText = 'Scheduled';
        break;
      case 'Pending':
        statusColor = const Color(0xFFFF9800); // Orange
        statusText = 'Pending';
        break;
      case 'Upcoming':
        statusColor = const Color(0xFF2196F3); // Blue
        statusText = 'Upcoming';
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Unknown';
    }

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFF9FAFB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon for Status
                CircleAvatar(
                  radius: 24,
                  backgroundColor: statusColor.withOpacity(0.2),
                  child: Icon(
                    Icons.event_available,
                    color: statusColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                // Case Number
                Expanded(
                  child: Text(
                    'Case: ${hearing['caseNumber']}',
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Date and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${hearing['date']}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'Time: ${hearing['time']}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Location
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    'Location: ${hearing['location']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
