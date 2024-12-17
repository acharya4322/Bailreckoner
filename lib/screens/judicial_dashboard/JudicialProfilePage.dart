import 'package:flutter/material.dart';

class JudicialProfilePage extends StatelessWidget {
  const JudicialProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://www.utcourts.gov/en/about/courts/judges-bios/district-courts/fourth-district-court/thomas-low/_jcr_content/root/container/container/columncontainer/col-2-2-1/image.coreimg.jpeg/1678759245685/lowe-t-hires.jpeg'),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(height: 16),
              // Name and Role
              const Text(
                'Hon. Justice A. N. Sharma',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'High Court Judge',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              // Contact Details
              _buildProfileInfo(
                  Icons.email, 'Email', 'justice.sharma@court.gov'),
              const Divider(),
              _buildProfileInfo(Icons.phone, 'Phone', '+91 9876543210'),
              const Divider(),
              _buildProfileInfo(
                  Icons.location_on, 'Court', 'High Court, Delhi'),
              const Divider(),
              _buildProfileInfo(
                  Icons.calendar_today, 'Joined', '15th March 2010'),
              const SizedBox(height: 20),
              // Actions
              const Text(
                'Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blueGrey),
                title: const Text('Edit Profile'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to edit profile page
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.blueGrey),
                title: const Text('Change Password'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Navigate to change password page
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Logout'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Handle logout
                },
              ),
              const SizedBox(height: 20),
              // Footer
              Center(
                child: Text(
                  'Powered by Bail Reckoner',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Info Widget
  Widget _buildProfileInfo(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 28, color: Colors.blueGrey),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }
}
