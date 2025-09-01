import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/includes/num_questions_button.dart';

   int numberofquestions = 10;

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.startQuiz,
   // required this.onSelectednum,

    });

  final void Function(int num) startQuiz;
  //final void Function(int num) onSelectednum;

 

  @override
  Widget build(context) {

    // bool _isSelected = false;
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
          Text('Select number of questions! Default is 10', ),
          SizedBox(height: 10),
          MyButton(),
          SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {startQuiz(numberofquestions);},
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


class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  int? _selectedvalue;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumQuestionsButton(numQuestion: 15, selectedValue: _selectedvalue, onTap: () {
            setState(() {
              numberofquestions = _selectedvalue = 15;
            });
          }),
          NumQuestionsButton(numQuestion: 30, selectedValue: _selectedvalue, onTap: () {
            setState(() {
              numberofquestions = _selectedvalue = 30;
            });
          }),
          NumQuestionsButton(numQuestion: 60, selectedValue: _selectedvalue, onTap: () {
            setState(() {
              numberofquestions = _selectedvalue = 60;
            });
          }),
          NumQuestionsButton(numQuestion: 100, selectedValue: _selectedvalue, onTap: () {
            setState(() {
              numberofquestions = _selectedvalue = 100;
            });
          }),
        ]),
    );
  }
}