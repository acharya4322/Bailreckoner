import 'package:flutter/material.dart';

class DetailedCaseStudy extends StatelessWidget {
  final String caseTitle;
  final String summary;
  final String decision;

  const DetailedCaseStudy({
    Key? key,
    required this.caseTitle,
    required this.summary,
    required this.decision,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          caseTitle,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
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
                  "Case Title:",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  caseTitle,
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Text(
                  "Summary:",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  summary,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Text(
                  "Court's Decision:",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  decision,
                  style: const TextStyle(fontSize: 16, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
