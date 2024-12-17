import 'package:bailreckoner/screens/guest_dashboard/ApplyForBailPage.dart';
import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/data/crime_data.dart';
import 'package:bailreckoner/screens/guest_dashboard/guest_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EligibilityResultScreen extends StatelessWidget {
  final bool isEligible;
  final CrimeData crime;

  const EligibilityResultScreen({
    Key? key,
    required this.isEligible,
    required this.crime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bail Eligibility Result',
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(
                      isEligible ? Icons.check_circle : Icons.cancel,
                      size: 120,
                      color: isEligible ? Colors.green : Colors.red,
                    ),
                    SizedBox(height: 16),
                    Text(
                      isEligible
                          ? 'You may be Eligible for Bail'
                          : 'May not be Eligible for Bail',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: isEligible ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Crime Name
              Card(
                color: Colors.grey[100],
                shadowColor: Colors.indigo.withOpacity(0.5),
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.gavel, color: Colors.indigoAccent),
                  title: Text(
                    'Crime: ${crime.crimeName}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Eligibility Reason
              _buildSection(
                title: 'Reason for Decision:',
                content:
                    isEligible ? crime.eligibleReason : crime.ineligibleReason,
              ),

              // Instructions
              _buildSection(
                title: 'Further Instructions:',
                content: isEligible
                    ? crime.furtherInstructionsEligible
                    : crime.furtherInstructionsWithConditions,
              ),

              // Conditions if Ineligible
              if (!isEligible && crime.conditionsParameters.isNotEmpty)
                _buildConditionsSection(),

              SizedBox(height: 24),

              // Recommended Action if Eligible
              if (isEligible)
                Center(
                  child: Card(
                    color: Colors.green[50],
                    shadowColor: Colors.green.withOpacity(0.3),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Icon(Icons.assignment_turned_in,
                              size: 50, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            "Recommendation:",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "You may be eligible for bail. It is recommended to apply for bail with the necessary legal documentation.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          ElevatedButton.icon(
                            onPressed: () {
                              Get.to(() => BailApplicationForm());
                              // Simulate opening bail application form or legal process
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Proceeding to Bail Application..."),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            icon: Icon(Icons.gavel),
                            label: Text('Apply for Bail'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              SizedBox(height: 24),

              // Return to Home Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => GuestDashboard());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    'Return to Home',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Section Widget
  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigoAccent,
            ),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Conditions Section if Ineligible
  Widget _buildConditionsSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Conditions to Meet:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigoAccent,
            ),
          ),
          SizedBox(height: 8),
          ...crime.conditionsParameters.map(
            (condition) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.indigoAccent),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      condition,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
