import 'package:bailreckoner/screens/judicial_dashboard/CaseDetailPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/CaseModel.dart';
import 'package:flutter/material.dart';

class ActiveCasesPage2 extends StatelessWidget {
  const ActiveCasesPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort the cases by priority before displaying
    List<CaseModel> sortedCases = List.from(dummyCases);
    sortedCases
        .sort((a, b) => _calculatePriority(b).compareTo(_calculatePriority(a)));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Active Cases',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: sortedCases.length,
          itemBuilder: (context, index) {
            final caseData = sortedCases[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CaseDetailPage(caseData: caseData),
                  ),
                );
              },
              child: _buildCaseCard(caseData),
            );
          },
        ),
      ),
    );
  }

  /// Calculates the priority of a case in a non-repetitive way
  int _calculatePriority(CaseModel caseData) {
    int priority = 0;

    // Balanced weights for severity, evidence, and status
    final severityWeight = {
          'severe': 3,
          'moderate': 2,
          'low': 1,
        }[caseData.severityLevel.toLowerCase()] ??
        0;

    final evidenceWeight = {
          'strong': 2,
          'moderate': 1,
          'weak': 0,
        }[caseData.evidenceWeightage.toLowerCase()] ??
        0;

    final statusWeight = {
          'hearing scheduled': 2,
          'pending': 1,
          'in progress': 0,
        }[caseData.status.toLowerCase()] ??
        0;

    // Combine the unique weights
    priority = severityWeight + evidenceWeight + statusWeight;

    return priority;
  }

  /// Builds the case card UI with priority displayed cleanly
  Widget _buildCaseCard(CaseModel caseData) {
    int priority = _calculatePriority(caseData);

    // Dynamic color for priority
    Color _getPriorityColor(int priority) {
      if (priority >= 6) return Colors.red[700]!;
      if (priority >= 3) return Colors.orange[700]!;
      return Colors.green[700]!;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Case Title and Number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      caseData.caseNumber,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      caseData.caseTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                // Priority Display
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getPriorityColor(priority),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Priority: $priority',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Case Status
            Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'Status: ${caseData.status}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
