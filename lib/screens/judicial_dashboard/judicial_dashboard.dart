import 'package:bailreckoner/screens/judicial_dashboard/ActiveCasesPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/BailApplicationsPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/CaseTrackerPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/JudicialProfilePage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/NotificationsPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/PendingCasesPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/ResolvedCasesPage.dart';
import 'package:bailreckoner/screens/judicial_dashboard/ScheduledHearingsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JudicialDashboard extends StatelessWidget {
  const JudicialDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Judicial Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 20,
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Get.to(() => NotificationsPagejd());
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Get.to(() => JudicialProfilePage());
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.indigo.shade50,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                const Text(
                  'Welcome, Honorable Judge!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Manage your cases and track judicial activities efficiently.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 24),

                // Analytics Section
                _buildAnalyticsSection(),
                const SizedBox(height: 24),

                // Quick Actions Section
                const Text(
                  'Quick Actions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildDashboardCard(
                      icon: Icons.pending_actions,
                      title: 'Pending Cases',
                      gradientColors: [Colors.indigo, Colors.indigoAccent],
                      onTap: () => Get.to(() => PendingCasesPage2()),
                    ),
                    _buildDashboardCard(
                      icon: Icons.description,
                      title: 'Bail Applications',
                      gradientColors: [Colors.indigo, Colors.indigoAccent],
                      onTap: () => Get.to(() => BailApplicationsPage2()),
                    ),
                    _buildDashboardCard(
                      icon: Icons.schedule,
                      title: 'Schedule Hearings',
                      gradientColors: [Colors.indigo, Colors.indigoAccent],
                      onTap: () => Get.to(() => ScheduledHearingsPage2()),
                    ),
                    _buildDashboardCard(
                      icon: Icons.search,
                      title: 'Case Tracker',
                      gradientColors: [Colors.indigo, Colors.indigoAccent],
                      onTap: () => Get.to(() => CaseTrackerPage()),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Footer Section
                _buildFooterSection(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open chatbot
        },
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  // Analytics Section Widget
  Widget _buildAnalyticsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () {
                Get.to(ActiveCasesPage2());
              },
              child: _buildAnalyticsCard('Active Cases', '25', Colors.indigo)),
          _buildAnalyticsCard('Resolved Cases', '18', Colors.teal),
          _buildAnalyticsCard('Scheduled Hearings', '5', Colors.blueAccent),
        ],
      ),
    );
  }

  Widget _buildAnalyticsCard(String title, String count, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.2),
          child: Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  // Reusable Dashboard Card Widget
  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSection() {
    return Center(
      child: Column(
        children: [
          const Divider(),
          const Text(
            'Powered by Bail Reckoner',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
