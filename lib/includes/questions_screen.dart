import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/includes/answer_button.dart';
import 'package:myapp/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQueIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQueIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQueIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 160, 40, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Question ${currentQueIndex + 1} Out of ${questions.length}',
                style: TextStyle(
                  color: const Color.fromARGB(255, 211, 224, 239)
                ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(currentQuestions.question, // Displays the current Questions
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            // Shuffled answers but since map returns a list, we usee ... to put the list in the column list
            ...currentQuestions.getShuffledList().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
            
          ],
        ),
      ),
    );
  }
}
