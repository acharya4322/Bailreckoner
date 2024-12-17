import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/personal_info_screen.dart';

class AboutBailPage extends StatelessWidget {
  const AboutBailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Makes the back arrow white
        ),
        title: const Text(
          'Bail Eligibility Tutorial',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white, // Makes the title text white
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),

              const SizedBox(height: 20),

              // Step-by-Step Tutorial
              _buildSectionTitle('Step 1: Understand the Basics'),
              _buildInfoCard(
                'Bail means providing security or a promise to ensure that the accused attends the court proceedings.',
                Icons.lightbulb_outline,
                Colors.amber,
              ),
              const SizedBox(height: 10),

              _buildSectionTitle('Step 2: Key Factors for Bail Eligibility'),
              ...[
                'Nature of the offense (bailable or non-bailable).',
                'Severity of the crime and punishment.',
                'Criminal record of the accused.',
                'Likelihood of fleeing or tampering with evidence.',
              ].map((factor) => _buildListItem(
                  factor, Icons.check_circle_outline, Colors.indigoAccent)),

              const SizedBox(height: 20),

              _buildSectionTitle('Step 3: Types of Offenses'),
              _buildInfoCard(
                '1. **Bailable Offense**: Bail is a right. For minor offenses, bail is granted easily.\n'
                '2. **Non-Bailable Offense**: Bail depends on the court’s discretion for serious crimes.',
                Icons.scale_outlined,
                Colors.deepPurple,
              ),
              const SizedBox(height: 20),

              _buildSectionTitle('Step 4: How to Apply for Bail?'),
              _buildInfoCard(
                '1. Submit an application to the court.\n'
                '2. Provide necessary documents like ID and address proof.\n'
                '3. Ensure compliance with court orders (e.g., attending hearings).',
                Icons.article_outlined,
                Colors.blueAccent,
              ),
              const SizedBox(height: 20),

              _buildSectionTitle('Step 5: What if Bail is Denied?'),
              _buildInfoCard(
                'If bail is denied, the accused can appeal to a higher court for reconsideration.',
                Icons.warning_amber_outlined,
                Colors.redAccent,
              ),

              const SizedBox(height: 20),

              // Tips Section
              _buildSectionTitle('Quick Tips'),
              ...[
                'Always consult a legal expert for bail applications.',
                'Prepare all required documents to avoid delays.',
                'Understand the conditions imposed by the court carefully.',
              ].map((tip) => _buildListItem(tip, Icons.star, Colors.orange)),

              const SizedBox(height: 30),

              // Eligibility Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(() => PersonalInfoScreen());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Navigating to Eligibility Check...')),
                    );
                  },
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                  label: const Text(
                    'Check Your Eligibility',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 2,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Footer
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What is Bail Eligibility?',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        const Text(
          'Bail eligibility determines whether a person can be temporarily released from custody while awaiting trial. Here’s a quick guide to understand it.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }

  // Reusable Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  // Reusable Info Card
  Widget _buildInfoCard(String content, IconData icon, Color iconColor) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: iconColor),
        title: Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

  // Reusable List Item
  Widget _buildListItem(String text, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  // Footer Section
  Widget _buildFooter() {
    return Center(
      child: Text(
        'Understanding bail eligibility can simplify the legal process.',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[700]),
      ),
    );
  }
}
