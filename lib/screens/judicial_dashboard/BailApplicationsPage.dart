import 'package:flutter/material.dart';

class BailApplicationsPage2 extends StatelessWidget {
  const BailApplicationsPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bail Applications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Poppins',
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
      ),
      body: Column(
        children: [
          // Search and Filter Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.indigoAccent),
                        hintText: 'Search bail applications...',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add filtering functionality
                  },
                  icon: const Icon(Icons.filter_alt, color: Colors.white),
                  label: const Text('Filter',
                      style: TextStyle(fontFamily: 'Poppins')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          // Bail Applications List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildBailApplicationCard(
                  applicationId: 'BA-${2000 + index}',
                  petitionerName: _getIndianName(index),
                  caseTitle: 'State vs. ${_getIndianName(index)}',
                  submissionDate: '2024-11-${10 + index}',
                  status: index % 2 == 0 ? 'Under Review' : 'Approved',
                  onViewDetails: () {
                    // Navigate to detailed application screen
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBailApplicationCard({
    required String applicationId,
    required String petitionerName,
    required String caseTitle,
    required String submissionDate,
    required String status,
    required VoidCallback onViewDetails,
  }) {
    Color statusColor =
        status == 'Under Review' ? Colors.orangeAccent : Colors.green;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Application ID
            Row(
              children: [
                Icon(Icons.description, color: Colors.indigoAccent, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    applicationId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Case Title
            Text(
              caseTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),

            // Petitioner Name
            Text(
              'Petitioner: $petitionerName',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),

            // Submission Date and Status
            _buildCaseDetailRow(Icons.date_range, 'Submitted: $submissionDate'),
            const SizedBox(height: 4),
            _buildCaseDetailRow(
                Icons.info_outline, 'Status: $status', statusColor),
            const SizedBox(height: 12),

            // View Details Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: onViewDetails,
                icon: const Icon(Icons.visibility, size: 16),
                label: const Text('View Details',
                    style: TextStyle(fontFamily: 'Poppins')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaseDetailRow(IconData icon, String text, [Color? color]) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color ?? Colors.black54),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: color ?? Colors.black54,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  // Function to simulate Indian names
  String _getIndianName(int index) {
    const List<String> indianNames = [
      'Amit Kumar',
      'Suresh Singh',
      'Rahul Sharma',
      'Neha Gupta',
      'Pooja Patel',
      'Arun Verma',
      'Vikram Rao',
      'Kavita Nair',
      'Ramesh Choudhary',
      'Priya Yadav'
    ];
    return indianNames[index % indianNames.length];
  }
}
