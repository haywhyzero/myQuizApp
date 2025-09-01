import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/includes/num_questions_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', // My logo
            width: 200,
            //color: const Color.fromARGB(176, 255, 255, 255),
          ),
          SizedBox(height: 30),
          Text(
            'Computer Science 101 Quiz', // Given title
            style: GoogleFonts.lato(
              color: Colors.white, 
              fontSize: 24,
              fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text('Select how many questions you want to answer'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          NumQuestionsButton(numQuestion: '10', onTap: () {}),
          NumQuestionsButton(numQuestion: '30', onTap: () {}),
          NumQuestionsButton(numQuestion: '60', onTap: () {}),
          NumQuestionsButton(numQuestion: '100', onTap: () {}),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: startQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(61, 0, 187, 212),
              elevation: 5,
              ),
            label: Text('Start Quiz'),
            icon: Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
