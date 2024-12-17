import 'package:bailreckoner/screens/guest_dashboard/ApplyForBailPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bailreckoner/screens/guest_dashboard/ContactAndSupportPage.dart';
import 'package:bailreckoner/screens/guest_dashboard/KnowYourRightsPage.dart';
import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/aboutBailPage.dart';
import 'package:bailreckoner/screens/guest_dashboard/case_status_page.dart';
import 'package:bailreckoner/screens/guest_dashboard/chatbot_guest.dart';
import 'package:bailreckoner/screens/guest_dashboard/legal_aid_assist.dart';

class GuestDashboard extends StatelessWidget {
  const GuestDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: const Icon(Icons.gavel, size: 30, color: Colors.white),
        title: const Text(
          'Bail Reckoner',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon:
                const Icon(Icons.account_circle, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeBanner(),
            const SizedBox(height: 20),
            _buildSectionTitle('Core Features'),
            _buildFeatureGrid(),
            const SizedBox(height: 30),
            _buildSectionTitle('Additional Resources'),
            _buildAdditionalFeatures(),
            const SizedBox(height: 20),
            _buildFaqSection(),
            const SizedBox(height: 40),
            _buildFooter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => ChatScreen()),
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.chat_bubble, color: Colors.white),
        tooltip: 'Chat with Us',
      ),
    );
  }

  // Welcome Banner
  Widget _buildWelcomeBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A237E), Color(0xFF3F51B5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Bail Reckoner',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          const Text(
            'Simplifying legal processes for everyone.',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.info, size: 20, color: Colors.white),
              label: const Text('Learn More',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black87),
      ),
    );
  }

  // Feature Grid
  Widget _buildFeatureGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildFeatureCard(Icons.gavel, 'Bail Eligibility',
              () => Get.to(() => AboutBailPage())),
          _buildFeatureCard(Icons.article, 'Apply for Bail',
              () => Get.to(() => BailApplicationForm())),
          _buildFeatureCard(
              Icons.support, 'Legal Aid', () => Get.to(() => LegalAidPage())),
          _buildFeatureCard(
              Icons.scale, 'Case Status', () => Get.to(() => CaseStatusPage())),
        ],
      ),
    );
  }

  // Feature Card
  Widget _buildFeatureCard(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade700, Colors.indigo.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 5, offset: Offset(2, 4))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }

  // Know Your Rights
  Widget _buildKnowYourRights() {
    return _buildListCard(
      Icons.book,
      'Know Your Rights',
      () => Get.to(() => KnowYourRightsPage()),
    );
  }

  // Additional Features
  Widget _buildAdditionalFeatures() {
    return Column(
      children: [
        _buildKnowYourRights(),
        const SizedBox(height: 10),
        _buildListCard(
          Icons.contact_support,
          'Contact Support',
          () => Get.to(() => ContactAndSupportPage()),
        ),
      ],
    );
  }

  // FAQ Section
  Widget _buildFaqSection() {
    return _buildListCard(
      Icons.help_outline,
      'Frequently Asked Questions',
      () {},
    );
  }

  // List Card
  Widget _buildListCard(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 4, offset: Offset(1, 3))
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: Colors.deepPurpleAccent),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // Footer
  Widget _buildFooter() {
    return const Center(
      child: Text(
        '© 2024 Bail Reckoner Team | Legal Tools for Justice',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
