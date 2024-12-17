import 'package:bailreckoner/screens/guest_dashboard/bail_eligibility_check/data/crime_data.dart';
import 'package:flutter/material.dart';
import 'eligibility_result_screen.dart';

class OffenceQuestionsScreen extends StatefulWidget {
  final CrimeData crime;

  const OffenceQuestionsScreen({Key? key, required this.crime})
      : super(key: key);

  @override
  _OffenceQuestionsScreenState createState() => _OffenceQuestionsScreenState();
}

class _OffenceQuestionsScreenState extends State<OffenceQuestionsScreen> {
  Map<String, bool> answers = {};
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    for (var param in widget.crime.parameters) {
      answers[param.question] = false; // Initialize answers to false
    }
  }

  bool _evaluateEligibility() {
    // Simple Eligibility Logic: If any mandatory question is false, bail is not eligible
    bool allMandatoryAnsweredYes = widget.crime.parameters.every((param) {
      return !param.isMandatory || answers[param.question] == true;
    });
    return allMandatoryAnsweredYes;
  }

  void _goToNextQuestion(bool answer) {
    setState(() {
      answers[widget.crime.parameters[currentQuestionIndex].question] = answer;
      if (currentQuestionIndex < widget.crime.parameters.length - 1) {
        currentQuestionIndex++;
      } else {
        // Navigate to result screen when questions are finished
        bool isEligible = _evaluateEligibility();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EligibilityResultScreen(
              isEligible: isEligible,
              crime: widget.crime,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentParam = widget.crime.parameters[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Answer Crime Parameters',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Question Number
            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.crime.parameters.length}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Question Text
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      currentParam.question,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      currentParam.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Buttons for Yes/No
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _goToNextQuestion(true),
                  icon: Icon(Icons.check),
                  label: Text('Yes'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _goToNextQuestion(false),
                  icon: Icon(Icons.close),
                  label: Text('No'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Progress Indicator
            LinearProgressIndicator(
              value:
                  (currentQuestionIndex + 1) / widget.crime.parameters.length,
              backgroundColor: Colors.grey[300],
              color: Colors.indigoAccent,
            ),
            SizedBox(height: 10),
            Text(
              "${((currentQuestionIndex + 1) / widget.crime.parameters.length * 100).toStringAsFixed(0)}% Completed",
              style: TextStyle(fontSize: 14, color: Colors.indigoAccent),
            ),
          ],
        ),
      ),
    );
  }
}
