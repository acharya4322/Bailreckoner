import 'package:bailreckoner/screens/judicial_dashboard/CaseModel.dart';
import 'package:flutter/material.dart';

import 'detailed_case_study.dart';

class CaseDetailPage extends StatelessWidget {
  final CaseModel caseData;

  const CaseDetailPage({Key? key, required this.caseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          caseData.caseNumber,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caseData.caseTitle,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildDetailRow('Status', caseData.status),
                  _buildDetailRow('Hearing Date', caseData.hearingDate),
                  _buildDetailRow(
                      'Evidence Weightage', caseData.evidenceWeightage),
                  _buildDetailRow('Severity Level', caseData.severityLevel),
                  _buildDetailRow('Decision Status', caseData.decisionStatus),
                  _buildDetailRow(
                      'Witness Count', caseData.witnessCount.toString()),
                  _buildDetailRow(
                      'Bail Eligible', caseData.isBailEligible ? 'Yes' : 'No'),
                  const SizedBox(height: 20),
                  const Text(
                    "Case Summary:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    caseData.summary,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Past Similar Cases:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPastCasesSection(context, caseData.pastCases),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPastCasesSection(
      BuildContext context, List<PastCase>? pastCases) {
    if (pastCases == null || pastCases.isEmpty) {
      return const Text(
        'No past similar cases available.',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      );
    }

    return Column(
      children: pastCases.map((pastCase) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              pastCase.caseTitle,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            subtitle: Text(
              "Decision: ${pastCase.decision}",
              style: const TextStyle(fontSize: 14, color: Colors.green),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: () {
              // Navigate to Detailed Case Study Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedCaseStudy(
                    caseTitle: pastCase.caseTitle,
                    summary: pastCase.summary,
                    decision: pastCase.decision,
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
