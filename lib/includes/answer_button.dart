import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, 
  required this.answerText,
  required this.onTap,
  });
  final String answerText;
  final void Function() onTap;
  @override 
  Widget build(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onTap, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        child: Text(answerText),
        ),
    );
  }
}
