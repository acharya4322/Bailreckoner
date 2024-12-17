import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/data/crime_data.dart';
import 'package:flutter/material.dart';
import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/select_offence_sceen.dart';

class AdditionalDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> prefilledData;

  const AdditionalDetailsScreen({
    Key? key,
    required this.prefilledData,
  }) : super(key: key);

  @override
  _AdditionalDetailsScreenState createState() =>
      _AdditionalDetailsScreenState();
}

class _AdditionalDetailsScreenState extends State<AdditionalDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _details = {};

  @override
  void initState() {
    super.initState();
    _details.addAll(widget.prefilledData); // Pre-fill data if available
  }

  void _goToNextPage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectOffenceScreen(
            details: _details,
            crimeDataList:
                crimeDataList, // Pass the actual crime data list here
          ),
        ),
      );
    }
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String keyName,
    String? initialValue,
    TextInputType inputType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      initialValue: initialValue ?? _details[keyName]?.toString(),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: inputType,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
      onSaved: (value) {
        _details[keyName] = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Makes the back arrow white
        ),
        title: const Text(
          'Additional Details',
          style: TextStyle(
            color: Colors.white, // Makes the title text white
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0A287A), Color(0xFF0F3C78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Basic Details Section
              _buildSectionTitle('Basic Details'),
              _buildTextField(label: 'Prisoner ID', keyName: 'prisonerId'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Name', keyName: 'name'),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Age',
                keyName: 'age',
                inputType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(label: 'Gender', keyName: 'gender'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Address', keyName: 'address'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Nationality', keyName: 'nationality'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Contact Details', keyName: 'contactDetails'),
              const SizedBox(height: 16),

              // Legal Case Details Section
              _buildSectionTitle('Legal Case Details'),
              _buildTextField(label: 'FIR Number', keyName: 'firNumber'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Police Station', keyName: 'policeStation'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Case Number', keyName: 'caseNumber'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Court Handling the Case',
                  keyName: 'courtHandlingCase'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Charges Filed', keyName: 'chargesFiled'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Nature of Offense', keyName: 'natureOfOffense'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Special Statutes Applied',
                  keyName: 'specialStatutesApplied'),
              const SizedBox(height: 16),

              // Imprisonment Details Section
              _buildSectionTitle('Imprisonment Details'),
              _buildTextField(
                label: 'Date of Arrest',
                keyName: 'dateOfArrest',
                inputType: TextInputType.datetime,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Prison Location', keyName: 'prisonLocation'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Cell/Ward Number', keyName: 'cellNumber'),
              const SizedBox(height: 16),

              // Bail Information Section
              _buildSectionTitle('Bail Information'),
              _buildTextField(
                  label: 'Previous Bail Applications',
                  keyName: 'previousBailApplications'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Surety Details', keyName: 'suretyDetails'),
              const SizedBox(height: 16),
              _buildTextField(label: 'Court Orders', keyName: 'courtOrders'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Total Time Served', keyName: 'totalTimeServed'),
              const SizedBox(height: 16),
              _buildTextField(
                  label: 'Type of Custody', keyName: 'typeOfCustody'),
              const SizedBox(height: 16),

              // Health and Behavior Records Section
              _buildSectionTitle('Health and Behavior Records'),
              _buildTextField(label: 'Health Status', keyName: 'healthStatus'),
              const SizedBox(height: 16),

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: _goToNextPage,
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
