import 'package:flutter/material.dart';

class ResolvedCasesPage2 extends StatelessWidget {
  const ResolvedCasesPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resolved Cases',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 10, // Replace with the actual count of resolved cases
          itemBuilder: (context, index) {
            return _buildCaseCard(
              caseNumber: 'RC-${2000 + index}',
              caseTitle: 'Case Title ${index + 1}',
              resolutionDate: '2024-12-${10 + index}', // Example dates
              onViewResolution: () {
                // Navigate to resolution details screen
              },
              onDownloadReport: () {
                // Download resolution report functionality
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCaseCard({
    required String caseNumber,
    required String caseTitle,
    required String resolutionDate,
    required VoidCallback onViewResolution,
    required VoidCallback onDownloadReport,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caseNumber,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              caseTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Resolved on: $resolutionDate',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: onViewResolution,
                  icon: const Icon(Icons.visibility, size: 16),
                  label: const Text('View Resolution'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: onDownloadReport,
                  icon: const Icon(Icons.download, size: 16),
                  label: const Text('Download Report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
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
