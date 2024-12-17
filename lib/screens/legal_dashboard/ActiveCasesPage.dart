import 'package:flutter/material.dart';

class ActiveCasesPage extends StatelessWidget {
  const ActiveCasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy list of active cases
    final List<Map<String, dynamic>> activeCases = [
      {
        'caseNumber': '12345-2024',
        'clientName': 'John Doe',
        'status': 'In Progress',
        'lastUpdate': 'Dec 4, 2024',
        'nextHearing': 'Dec 10, 2024',
      },
      {
        'caseNumber': '67890-2024',
        'clientName': 'Jane Smith',
        'status': 'In Progress',
        'lastUpdate': 'Dec 2, 2024',
        'nextHearing': 'Dec 15, 2024',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Active Cases',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
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
                  hintText: 'Search cases by number or client name',
                  hintStyle: TextStyle(color: Colors.black45),
                  icon: Icon(Icons.search, color: Colors.indigoAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Active Cases',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            // Active Cases List
            Expanded(
              child: ListView.builder(
                itemCount: activeCases.length,
                itemBuilder: (context, index) {
                  final caseDetails = activeCases[index];
                  return _buildCaseCard(caseDetails);
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

  Widget _buildCaseCard(Map<String, dynamic> caseDetails) {
    return Card(
      elevation: 5,
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
                // Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.folder_open,
                    color: Colors.indigoAccent,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 12),
                // Case Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Case Number: ${caseDetails['caseNumber']}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Client: ${caseDetails['clientName']}',
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
            // Status and Next Hearing
            Row(
              children: [
                _buildInfoChip(
                  label: 'Status: ${caseDetails['status']}',
                  color: Colors.indigo,
                  icon: Icons.autorenew,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  label: 'Next Hearing: ${caseDetails['nextHearing']}',
                  color: Colors.indigoAccent,
                  icon: Icons.event,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Last Updated
            Text(
              'Last Updated: ${caseDetails['lastUpdate']}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            // Manage Case Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Manage case action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Manage Case',
                  style: TextStyle(color: Colors.white),
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
