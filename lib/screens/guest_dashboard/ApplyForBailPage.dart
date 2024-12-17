import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'bail_application_preview.dart';

class BailApplicationForm extends StatefulWidget {
  @override
  _BailApplicationFormState createState() => _BailApplicationFormState();
}

class _BailApplicationFormState extends State<BailApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> formData = {};
  final Map<String, String?> uploadedFiles = {};

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Navigate to preview screen with submitted data and files
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BailApplicationPreview(
            formData: formData,
            uploadedFiles: uploadedFiles,
          ),
        ),
      );
    }
  }

  Future<void> _pickFile(String documentType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      setState(() {
        uploadedFiles[documentType] = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bail Application Form',
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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Bail Application'),
              _buildTextField('Court Name', 'courtName'),
              _buildTextField('District/Session Judge', 'judgeName'),
              _buildSectionTitle('Petitioner Details'),
              _buildTextField('Petitioner Name', 'petitionerName'),
              _buildTextField('Son of', 'petitionerFather'),
              _buildTextField('Years of Age', 'petitionerAge',
                  inputType: TextInputType.number),
              _buildTextField('Working as', 'petitionerWork'),
              _buildTextField('Residing at', 'petitionerAddress'),
              _buildSectionTitle('Respondent Details'),
              _buildTextField('State Name', 'stateName'),
              _buildTextField('Respondent Name', 'respondentName'),
              _buildSectionTitle('FIR Details'),
              Row(
                children: [
                  Expanded(child: _buildTextField('FIR No', 'firNo')),
                  SizedBox(width: 10),
                  Expanded(child: _buildTextField('U/s', 'section')),
                ],
              ),
              _buildTextField('Police Station', 'policeStation'),
              _buildSectionTitle('Prayer'),
              _buildTextField('Enter prayer details', 'prayer', maxLines: 4),
              _buildSectionTitle('Petitioner Information'),
              _buildTextField('Place', 'place'),
              _buildTextField('Date', 'date',
                  inputType: TextInputType.datetime),

              // Additional File Upload Section
              _buildSectionTitle('Attach Supporting Documents'),
              _buildFileUploadField('FIR Copy', 'firCopy'),
              _buildFileUploadField('Charge Sheet', 'chargeSheet'),
              _buildFileUploadField('Arrest Memo', 'arrestMemo'),
              _buildFileUploadField('ID Proof', 'idProof'),
              _buildFileUploadField('Affidavit by Accused', 'affidavit'),
              _buildFileUploadField('Surety Documents', 'suretyDocs'),
              _buildFileUploadField('Medical Records', 'medicalRecords'),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, String key,
      {TextInputType inputType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        keyboardType: inputType,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hint';
          }
          return null;
        },
        onSaved: (value) => formData[key] = value ?? '',
      ),
    );
  }

  Widget _buildFileUploadField(String label, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () => _pickFile(key),
            icon: Icon(Icons.attach_file),
            label: Text(uploadedFiles[key] ?? 'Upload'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
