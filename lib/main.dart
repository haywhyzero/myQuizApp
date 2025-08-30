import 'package:flutter/material.dart';
import 'package:myapp/quiz.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override 
  Widget build(context) {
    return Quiz();
  }
}