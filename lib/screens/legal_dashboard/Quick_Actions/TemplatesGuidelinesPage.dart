import 'package:flutter/material.dart';

class TemplatesGuidelinesPage extends StatelessWidget {
  const TemplatesGuidelinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for templates and guidelines
    final List<Map<String, String>> resources = [
      {
        'title': 'Bail Application Template',
        'description': 'Standard template for bail applications.',
        'type': 'template',
      },
      {
        'title': 'Court Etiquette Guide',
        'description': 'Essential courtroom behavior tips.',
        'type': 'guideline',
      },
      {
        'title': 'Legal Aid Request Form',
        'description': 'Form template for requesting legal aid.',
        'type': 'template',
      },
      {
        'title': 'Hearing Preparation Checklist',
        'description': 'Guidelines to prepare for court hearings.',
        'type': 'guideline',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Templates & Guidelines',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
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
              'Resources for Legal Aid Providers',
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
                itemCount: resources.length,
                itemBuilder: (context, index) {
                  final resource = resources[index];
                  return _buildResourceCard(
                    title: resource['title']!,
                    description: resource['description']!,
                    type: resource['type']!,
                  );
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

  Widget _buildResourceCard({
    required String title,
    required String description,
    required String type,
  }) {
    IconData icon;
    Color color;

    if (type == 'template') {
      icon = Icons.description;
      color = Colors.indigo;
    } else {
      icon = Icons.info_outline;
      color = Colors.indigoAccent;
    }

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
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
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            // Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            // Download Button
            IconButton(
              icon: const Icon(Icons.download_rounded,
                  color: Colors.indigoAccent),
              onPressed: () {
                // Add download functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
