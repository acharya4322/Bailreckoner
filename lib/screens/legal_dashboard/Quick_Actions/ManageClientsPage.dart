import 'package:flutter/material.dart';

class ManageClientsPage extends StatelessWidget {
  const ManageClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy client data
    final List<Map<String, dynamic>> clients = [
      {
        'name': 'Amit Kumar',
        'caseNumber': 'C-2024-001',
        'status': 'Active',
        'contact': '123-456-7890',
      },
      {
        'name': 'Neha Singh',
        'caseNumber': 'C-2024-002',
        'status': 'Pending',
        'contact': '987-654-3210',
      },
      {
        'name': 'Sureh Singh',
        'caseNumber': 'C-2024-003',
        'status': 'Resolved',
        'contact': '123-987-6543',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Manage Clients',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                  hintText: 'Search clients by name or case number',
                  prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Client List',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Clients List
            Expanded(
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  return _buildClientCard(client);
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

  // Enhanced Client Card
  Widget _buildClientCard(Map<String, dynamic> client) {
    Color statusColor;
    IconData statusIcon;

    switch (client['status']) {
      case 'Active':
        statusColor = const Color(0xFF4CAF50); // Green
        statusIcon = Icons.check_circle;
        break;
      case 'Pending':
        statusColor = const Color(0xFFFF9800); // Orange
        statusIcon = Icons.hourglass_bottom;
        break;
      case 'Resolved':
        statusColor = const Color(0xFF3F51B5); // Blue
        statusIcon = Icons.done_all;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.error;
    }

    return Card(
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFF8FAFC)],
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Icon
            CircleAvatar(
              radius: 24,
              backgroundColor: statusColor.withOpacity(0.2),
              child: Icon(
                statusIcon,
                color: statusColor,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            // Client Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Case: ${client['caseNumber']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Contact: ${client['contact']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        statusIcon,
                        size: 16,
                        color: statusColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        client['status'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // View Button
            ElevatedButton(
              onPressed: () {
                // Action for viewing details
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'View',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
