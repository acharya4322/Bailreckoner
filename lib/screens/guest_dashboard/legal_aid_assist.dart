import 'package:bailreckoner/screens/guest_dashboard/FormPage_legalAid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LegalAidPage extends StatelessWidget {
  const LegalAidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Legal Aid Assistance',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Get Legal Aid Assistance',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Explore various resources to get legal aid, free legal consultations, and emergency assistance.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Legal Aid Options
              _buildOptionCard(
                context, // Pass context to the function
                title: 'Free Legal Consultation',
                description:
                    'Get free legal consultation from certified professionals in your area.',
                icon: Icons.gavel,
                color: Colors.indigo,
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context, // Pass context to the function
                title: 'Emergency Legal Help',
                description:
                    'Reach out for immediate assistance during legal emergencies. Available 24/7.',
                icon: Icons.call,
                color: Colors.indigo,
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  //Get.to(() => FormPage());
                },
                child: _buildOptionCard(
                  context, // Pass context to the function
                  title: 'Government Legal Aid',
                  description:
                      'Information about government-funded legal assistance programs available to you.',
                  icon: Icons.account_balance,
                  color: Colors.indigo,
                ),
              ),
              const SizedBox(height: 30),

              // Footer Section
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Card for Legal Aid Options with Claim Button
  Widget _buildOptionCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white, size: 32),
              ),
              const SizedBox(width: 16),
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
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Only the "Claim Service" button is clickable
          InkWell(
            onTap: () {
              // Action for claiming the legal aid service
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Claiming the service...'),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: const Text(
                'Claim Service',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Footer Section with Contact Information & Links
  Widget _buildFooterSection() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Contact Legal Aid Providers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'You can reach out to the following providers for further legal assistance:',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            name: 'Legal Aid Society',
            phone: '1800-123-4567',
            email: 'contact@legalaid.com',
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            name: 'Emergency Legal Help',
            phone: '911',
            email: 'emergency@legalaid.com',
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            name: 'Government Legal Assistance',
            phone: '1800-555-1234',
            email: 'govaid@legalaid.com',
          ),
        ],
      ),
    );
  }

  // Reusable Contact Card
  Widget _buildContactCard({
    required String name,
    required String phone,
    required String email,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Phone: $phone',
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            'Email: $email',
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
