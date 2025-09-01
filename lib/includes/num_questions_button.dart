import 'package:flutter/material.dart';

class NumQuestionsButton extends StatelessWidget {
  const NumQuestionsButton({super.key, required this.numQuestion, required this.onTap});


  final String numQuestion;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onTap, child: Text(numQuestion));
  }
}