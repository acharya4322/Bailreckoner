import 'package:flutter/material.dart';

class ResolvedCasesPage extends StatelessWidget {
  const ResolvedCasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy list of resolved cases
    final List<Map<String, dynamic>> resolvedCases = [
      {
        'caseNumber': 'C-2024-001',
        'clientName': 'John Doe',
        'resolvedDate': 'Dec 2, 2024',
        'outcome': 'Case Dismissed',
      },
      {
        'caseNumber': 'C-2024-002',
        'clientName': 'Jane Smith',
        'resolvedDate': 'Dec 5, 2024',
        'outcome': 'Bail Granted',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resolved Cases',
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
                  hintText: 'Search cases by number or client name',
                  hintStyle: TextStyle(color: Colors.black45),
                  icon: Icon(Icons.search, color: Colors.indigoAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Resolved Cases',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 16),
            // Resolved Cases List
            Expanded(
              child: ListView.builder(
                itemCount: resolvedCases.length,
                itemBuilder: (context, index) {
                  final caseDetails = resolvedCases[index];
                  return _buildResolvedCaseCard(caseDetails);
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

  Widget _buildResolvedCaseCard(Map<String, dynamic> caseDetails) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
              children: [
                // Icon Container
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.check_circle_outline,
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
                          fontFamily: 'Poppins',
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
            // Chips for Resolved Date and Outcome
            Row(
              children: [
                _buildInfoChip(
                  label: 'Resolved Date: ${caseDetails['resolvedDate']}',
                  color: Colors.indigo,
                  icon: Icons.date_range,
                ),
                const SizedBox(width: 8),
                _buildInfoChip(
                  label: 'Outcome: ${caseDetails['outcome']}',
                  color: Colors.green,
                  icon: Icons.gavel,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // View Details Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // View details action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'View Details',
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
