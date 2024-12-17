import 'package:flutter/material.dart';

class CaseTrackerPage extends StatefulWidget {
  const CaseTrackerPage({Key? key}) : super(key: key);

  @override
  _CaseTrackerPageState createState() => _CaseTrackerPageState();
}

class _CaseTrackerPageState extends State<CaseTrackerPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'All';
  final List<Map<String, String>> _caseList = [
    {'caseTitle': 'State vs. Amit Kumar', 'status': 'Pending'},
    {'caseTitle': 'State vs. Neha Gupta', 'status': 'Resolved'},
    {'caseTitle': 'State vs. Ravi Sharma', 'status': 'Scheduled'},
    {'caseTitle': 'State vs. Pooja Patel', 'status': 'Pending'},
    {'caseTitle': 'State vs. Vikram Rao', 'status': 'Resolved'},
    {'caseTitle': 'State vs. Priya Yadav', 'status': 'Scheduled'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Case Tracker',
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
                      controller: _searchController,
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.indigoAccent),
                        hintText: 'Search by case title...',
                        hintStyle: const TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      _selectedStatus = value;
                    });
                  },
                  icon:
                      const Icon(Icons.filter_list, color: Colors.indigoAccent),
                  itemBuilder: (context) {
                    return ['All', 'Pending', 'Resolved', 'Scheduled']
                        .map((status) => PopupMenuItem(
                              value: status,
                              child: Text(
                                status,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList();
                  },
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          // Filtered List of Cases
          Expanded(
            child: _buildFilteredCaseList(),
          ),
        ],
      ),
    );
  }

  // Builds the Filtered Case List
  Widget _buildFilteredCaseList() {
    final filteredCases = _caseList.where((caseData) {
      final matchesSearch = caseData['caseTitle']!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase());
      final matchesStatus =
          _selectedStatus == 'All' || caseData['status'] == _selectedStatus;

      return matchesSearch && matchesStatus;
    }).toList();

    if (filteredCases.isEmpty) {
      return const Center(
        child: Text(
          'No cases found matching the criteria.',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredCases.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        final caseData = filteredCases[index];
        return _buildCaseCard(
          caseTitle: caseData['caseTitle']!,
          status: caseData['status']!,
          onViewDetails: () {
            // Navigate to case details page
          },
        );
      },
    );
  }

  // Case Card Widget
  Widget _buildCaseCard({
    required String caseTitle,
    required String status,
    required VoidCallback onViewDetails,
  }) {
    Color statusColor;
    switch (status) {
      case 'Pending':
        statusColor = Colors.orangeAccent;
        break;
      case 'Resolved':
        statusColor = Colors.green;
        break;
      case 'Scheduled':
        statusColor = Colors.blueAccent;
        break;
      default:
        statusColor = Colors.grey;
    }

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
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caseTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.info_outline, size: 18, color: Colors.black54),
                const SizedBox(width: 4),
                const Text(
                  'Status:',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(width: 4),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 14,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
}
