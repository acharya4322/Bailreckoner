import 'package:flutter/material.dart';

class PendingCasesPage2 extends StatelessWidget {
  const PendingCasesPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Cases',
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
                        hintText: 'Search pending cases...',
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
          // Pending Cases List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10, // Replace with the actual count of pending cases
              itemBuilder: (context, index) {
                return _buildPendingCaseCard(
                  caseNumber: 'P-${1000 + index}',
                  caseTitle: 'Pending Case ${index + 1}',
                  filingDate: '2024-11-${10 + index}',
                  caseStatus: 'Awaiting Hearing',
                  lastUpdate: '2024-12-${5 + index}',
                  onViewDetails: () {
                    // Navigate to detailed case screen
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingCaseCard({
    required String caseNumber,
    required String caseTitle,
    required String filingDate,
    required String caseStatus,
    required String lastUpdate,
    required VoidCallback onViewDetails,
  }) {
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
            // Case Number
            Row(
              children: [
                Icon(Icons.folder_copy, color: Colors.indigoAccent, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    caseNumber,
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
            const SizedBox(height: 12),

            // Case Details
            _buildCaseDetailRow(Icons.date_range, 'Filed: $filingDate'),
            const SizedBox(height: 4),
            _buildCaseDetailRow(Icons.info_outline, 'Status: $caseStatus'),
            const SizedBox(height: 4),
            _buildCaseDetailRow(Icons.update, 'Last Update: $lastUpdate'),
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

  Widget _buildCaseDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }
}
