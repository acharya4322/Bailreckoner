import 'package:flutter/material.dart';
import 'loading_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> _formData = {};

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoadingScreen(formData: _formData),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Information',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fill Your Personal Details',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(
                      label: 'Full Name',
                      icon: Icons.person,
                      validator: (value) =>
                          value!.isEmpty ? 'Name is required' : null,
                      onSaved: (value) => _formData['name'] = value!,
                    ),
                    _buildTextField(
                      label: 'Aadhaar Number',
                      icon: Icons.perm_identity,
                      validator: (value) {
                        if (value!.isEmpty) return 'Aadhaar number is required';
                        if (value.length != 12 ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Enter a valid 12-digit Aadhaar number';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['aadharNumber'] = value!,
                    ),
                    _buildTextField(
                      label: 'Father\'s Name',
                      icon: Icons.family_restroom,
                      validator: (value) =>
                          value!.isEmpty ? 'Father\'s name is required' : null,
                      onSaved: (value) => _formData['fatherName'] = value!,
                    ),
                    _buildTextField(
                      label: 'Date of Birth (DD/MM/YYYY)',
                      icon: Icons.calendar_today,
                      validator: (value) {
                        if (value!.isEmpty) return 'Date of Birth is required';
                        if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(value)) {
                          return 'Enter a valid date (DD/MM/YYYY)';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['dob'] = value!,
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _submit,
                        icon: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                        label: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo.shade600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required FormFieldValidator<String> validator,
    required FormFieldSetter<String> onSaved,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.indigo,
            fontSize: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo.shade400, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo.shade200, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.indigo.shade400,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
