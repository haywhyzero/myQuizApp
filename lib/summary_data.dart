import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  bool get iscorrect {
    return summary.every((data) {
      return data['correct_answer'] == data['user_answer'];
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children:
              summary.map((data) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color:
                            iscorrect
                                ? const Color.fromARGB(255, 16, 111, 53)
                                : const Color.fromARGB(255, 148, 42, 19),
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          SizedBox(height: 5,),
                          Text(
                            'Correct answer: ${data['correct_answer']}',
                            style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 202, 171, 252),
                            ),
                          ),
                          Text(
                            'Your answer: ${data['user_answer']}',
                            style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 181, 254, 246),
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
