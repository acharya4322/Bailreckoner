import 'package:flutter/material.dart';

class ScheduledHearingsPage2 extends StatelessWidget {
  const ScheduledHearingsPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scheduled Hearings',
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
          // Calendar Section
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select a Date',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigoAccent,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7, // Show next 7 days
                    itemBuilder: (context, index) {
                      DateTime date = DateTime.now().add(Duration(days: index));
                      return _buildDateCard(date);
                    },
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          // Hearings List Section
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: 10, // Replace with actual hearing count
              itemBuilder: (context, index) {
                return _buildHearingCard(
                  caseTitle: 'State vs. ${_getIndianName(index)}',
                  hearingTime: '${10 + index % 3}:30 AM',
                  courtRoom: 'Courtroom ${5 + index % 3}',
                  status: index % 2 == 0 ? 'Scheduled' : 'Completed',
                  onViewDetails: () {
                    // Navigate to hearing details page
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Date Cards
  Widget _buildDateCard(DateTime date) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigoAccent.withOpacity(0.8), Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${date.day}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            _monthToString(date.month),
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Widget for Hearing Cards
  Widget _buildHearingCard({
    required String caseTitle,
    required String hearingTime,
    required String courtRoom,
    required String status,
    required VoidCallback onViewDetails,
  }) {
    Color statusColor =
        status == 'Scheduled' ? Colors.orangeAccent : Colors.green;

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
            _buildDetailRow(Icons.access_time, 'Time: $hearingTime'),
            _buildDetailRow(Icons.location_on, 'Courtroom: $courtRoom'),
            _buildDetailRow(Icons.info_outline, 'Status: $status', statusColor),
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

  // Row for Hearing Details
  Widget _buildDetailRow(IconData icon, String text, [Color? color]) {
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

  // Helper Function for Month Conversion
  String _monthToString(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  // Function to simulate Indian names
  String _getIndianName(int index) {
    const List<String> indianNames = [
      'Amit Kumar',
      'Neha Gupta',
      'Ravi Sharma',
      'Pooja Patel',
      'Suresh Singh',
      'Vikram Rao',
      'Priya Yadav',
      'Kavita Nair',
      'Arjun Verma',
      'Ramesh Choudhary'
    ];
    return indianNames[index % indianNames.length];
  }
}
