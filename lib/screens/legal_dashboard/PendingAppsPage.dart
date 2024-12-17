import 'package:flutter/material.dart';

class PendingAppsPage extends StatelessWidget {
  const PendingAppsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy list of pending applications
    final List<Map<String, dynamic>> pendingApps = [
      {
        'applicantName': 'John Doe',
        'applicationDate': 'Dec 1, 2024',
        'caseType': 'Bail Application',
        'status': 'Pending Review',
      },
      {
        'applicantName': 'Jane Smith',
        'applicationDate': 'Nov 28, 2024',
        'caseType': 'Legal Aid Assistance',
        'status': 'Documents Needed',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Applications',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search applications by name or type',
                  hintStyle: TextStyle(color: Colors.black45),
                  icon: Icon(Icons.search, color: Colors.indigoAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pending Applications',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            // Pending Applications List
            Expanded(
              child: ListView.builder(
                itemCount: pendingApps.length,
                itemBuilder: (context, index) {
                  final appDetails = pendingApps[index];
                  return _buildApplicationCard(appDetails);
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

  Widget _buildApplicationCard(Map<String, dynamic> appDetails) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.indigo.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Container
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.folder_copy_rounded,
                    color: Colors.indigoAccent,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                // Applicant Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Applicant: ${appDetails['applicantName']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Application Date: ${appDetails['applicationDate']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Chips for Case Type and Status
            Row(
              children: [
                _buildInfoChip(
                  label: 'Case Type: ${appDetails['caseType']}',
                  color: Colors.indigo,
                  icon: Icons.category_rounded,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  label: 'Status: ${appDetails['status']}',
                  color: Colors.indigoAccent,
                  icon: Icons.info_rounded,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Review Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Review application action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Review Application',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Chip(
      backgroundColor: color.withOpacity(0.1),
      avatar: Icon(icon, color: color, size: 16),
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
