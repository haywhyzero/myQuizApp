import 'package:flutter/material.dart';

class NumQuestionsButton extends StatelessWidget {
  const NumQuestionsButton({
    super.key, 
    required this.numQuestion, 
    required this.selectedValue,
    required this.onTap});


  final int numQuestion;
  final int? selectedValue;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedValue == numQuestion;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue.withValues(alpha: 2.0) : null, // To highlight background
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey, // To Change border color
          width: isSelected ? 2.0 : 1.0, // Thicker border when selected
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(
        numQuestion.toString(),
        style: TextStyle(
          color: isSelected ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 255, 255, 255), // To Change text color
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
    );
  }

}