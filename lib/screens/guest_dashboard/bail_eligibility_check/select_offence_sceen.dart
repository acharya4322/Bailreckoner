import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/data/crime_data.dart';
import 'package:flutter/material.dart';

import 'offence_questions_screen.dart';

class SelectOffenceScreen extends StatefulWidget {
  final List<CrimeData> crimeDataList;
  final Map<String, dynamic> details;

  SelectOffenceScreen(
      {required this.crimeDataList, required this.details, Key? key})
      : super(key: key);

  @override
  _SelectOffenceScreenState createState() => _SelectOffenceScreenState();
}

class _SelectOffenceScreenState extends State<SelectOffenceScreen> {
  TextEditingController _searchController = TextEditingController();
  late List<CrimeData> _filteredCrimeData;

  @override
  void initState() {
    super.initState();
    _filteredCrimeData = widget.crimeDataList;
    _searchController.addListener(_filterCrimes);
  }

  void _filterCrimes() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCrimeData = widget.crimeDataList
          .where((crime) =>
              crime.crimeName.toLowerCase().contains(query) ||
              crime.eligibleReason.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Offence',
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
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Crime',
                prefixIcon: Icon(Icons.search, color: Colors.indigo.shade400),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          // List of Crimes
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCrimeData.length,
              itemBuilder: (context, index) {
                final crimeData = _filteredCrimeData[index];
                return _buildCrimeCard(crimeData);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCrimeCard(CrimeData crimeData) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Icon(
          Icons.gavel,
          size: 36,
          color: Colors.indigo.shade400,
        ),
        title: Text(
          crimeData.crimeName,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              "Bailable under law: ${crimeData.isBailableUnderLaw ? 'Yes' : 'No'}",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            Text(
              "Bailable with conditions: ${crimeData.isBailableWithConditions ? 'Yes' : 'No'}",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Navigate to OffenceQuestionsScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OffenceQuestionsScreen(crime: crimeData),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Select',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
