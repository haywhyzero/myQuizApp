import 'package:flutter/material.dart';
import 'package:myapp/data/questions.dart';
import 'package:myapp/includes/summary_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, 
  required this.choosenAnswers, required this.restartQuiz});

  final List<String> choosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final varSummaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers =
        varSummaryData.where((data) {
          return data['correct_answer'] == data['user_answer'];
        }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SummaryData(varSummaryData),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: restartQuiz,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 6, 44, 61),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
                ),
              label: Text('Restart Quiz'),
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
