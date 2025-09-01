import 'package:flutter/material.dart';
import 'package:myapp/includes/questions_screen.dart';
import 'package:myapp/includes/results_screen.dart';
import 'package:myapp/includes/start_screen.dart';
//import 'package:myapp/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

//Quiz State class
class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  int? numberofquestions;
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(startQuiz: setScreen);
  }

  List<String> selectedAnswers = [];

  void setScreen(int number) {
    numberofquestions = number;
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswers, numQuestions: numberofquestions ?? 10,);
    });
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(startQuiz: setScreen);
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == numberofquestions) {
      setState(() {
        activeScreen = ResultsScreen(
          choosenAnswers: selectedAnswers,
          restartQuiz: onRestart,
          numQuestions: numberofquestions ?? 10,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 29, 122, 168),
                Color.fromARGB(255, 20, 167, 240),
                Color.fromARGB(255, 7, 58, 84),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
       ),
      ),
    );
  }
}
