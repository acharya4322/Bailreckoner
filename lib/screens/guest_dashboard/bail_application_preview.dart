import 'package:flutter/material.dart';

class BailApplicationPreview extends StatelessWidget {
  final Map<String, String> formData;

  const BailApplicationPreview(
      {Key? key,
      required this.formData,
      required Map<String, String?> uploadedFiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bail Application Preview',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Bail Application",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(height: 30, thickness: 1),
            _buildParagraph("IN THE COURT OF:", formData['courtName'] ?? ''),
            _buildParagraph("ADDITIONAL DISTRICT AND SESSION JUDGE:",
                formData['judgeName'] ?? ''),
            Divider(),
            _buildParagraph("IN THE MATTER OF:",
                "${formData['petitionerName']}, Son of ${formData['petitionerFather']}, aged ${formData['petitionerAge']} years, working as ${formData['petitionerWork']}, residing at ${formData['petitionerAddress']}"),
            SizedBox(height: 10),
            _buildParagraph("RESPONDENT DETAILS:",
                "${formData['respondentName']} (State: ${formData['stateName']})"),
            Divider(),
            _buildParagraph("FIR DETAILS:",
                "FIR No: ${formData['firNo']}, Section: ${formData['section']}, Police Station: ${formData['policeStation']}"),
            Divider(),
            _buildParagraph("PRAYER:", formData['prayer'] ?? ''),
            Divider(),
            _buildParagraph("Place:", formData['place'] ?? ''),
            _buildParagraph("Date:", formData['date'] ?? ''),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Petitioner\n${formData['petitionerName'] ?? ''}",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, height: 2),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back to Form',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildParagraph(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: "$title ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }
}
