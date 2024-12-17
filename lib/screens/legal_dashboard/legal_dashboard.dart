import 'package:bailreckoner/screens/legal_dashboard/ActiveCasesPage.dart';
import 'package:bailreckoner/screens/legal_dashboard/PendingAppsPage.dart';
import 'package:bailreckoner/screens/legal_dashboard/Quick_Actions/CaseUpdatesPage.dart';
import 'package:bailreckoner/screens/legal_dashboard/Quick_Actions/ManageClientsPage.dart';
import 'package:bailreckoner/screens/legal_dashboard/Quick_Actions/ScheduleHearingsPage.dart';
import 'package:bailreckoner/screens/legal_dashboard/Quick_Actions/TemplatesGuidelinesPage.dart';
import 'package:bailreckoner/screens/legal_dashboard/ResolvedCasesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LegalAidDashboard extends StatelessWidget {
  const LegalAidDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Legal Aid Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Navigate to Notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Navigate to Settings
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open Chatbot
        },
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              const Text(
                'Welcome, Legal Aid Provider!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Stay on top of your cases, tasks, and updates.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              // Analytics Section
              _buildAnalyticsSection(),
              const SizedBox(height: 24),
              // Quick Actions Section
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildDashboardCard(
                    icon: Icons.group,
                    title: 'Manage Clients',
                    onTap: () => Get.to(() => ManageClientsPage()),
                  ),
                  _buildDashboardCard(
                    icon: Icons.update,
                    title: 'Case Updates',
                    onTap: () => Get.to(() => CaseUpdatesPage()),
                  ),
                  _buildDashboardCard(
                    icon: Icons.schedule,
                    title: 'Schedule Hearings',
                    onTap: () => Get.to(() => ScheduleHearingsPage()),
                  ),
                  _buildDashboardCard(
                    icon: Icons.description,
                    title: 'Templates & Guidelines',
                    onTap: () => Get.to(() => TemplatesGuidelinesPage()),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Pending Tasks Section
              _buildTaskList(),
              const SizedBox(height: 24),
              // Footer Section
              _buildFooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Analytics Section
  Widget _buildAnalyticsSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
              onTap: () => Get.to(() => ActiveCasesPage()),
              child: _buildAnalyticsCard('Active Cases', '15', Colors.indigo)),
          InkWell(
              onTap: () => Get.to(() => PendingAppsPage()),
              child: _buildAnalyticsCard(
                  'Pending Apps', '8', Colors.indigoAccent)),
          InkWell(
              onTap: () => Get.to(() => ResolvedCasesPage()),
              child: _buildAnalyticsCard('Resolved', '20', Colors.lightBlue)),
        ],
      ),
    );
  }

  Widget _buildAnalyticsCard(String title, String count, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.2),
          child: Text(
            count,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  // Dashboard Card
  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.indigo, Colors.indigoAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.indigo.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Pending Task Section
  Widget _buildTaskList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pending Tasks',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildTaskItem('Review Client Applications', 'Due: Dec 6, 2024'),
        _buildTaskItem('Prepare Hearing Schedules', 'Due: Dec 8, 2024'),
      ],
    );
  }

  Widget _buildTaskItem(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.check_circle_outline, color: Colors.indigo),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        // Navigate to Task Details
      },
    );
  }

  // Footer Section
  Widget _buildFooterSection() {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _FooterItem(icon: Icons.help_outline, title: 'Help & Support'),
            _FooterItem(icon: Icons.contact_page, title: 'Contacts'),
            _FooterItem(icon: Icons.info_outline, title: 'FAQs'),
          ],
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            '© 2024 Legal Aid Provider | Powered by Bail Reckoner',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FooterItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.indigo),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
