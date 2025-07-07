import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_apps/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  SummaryItem({
    super.key,
    required this.itemData,
  });

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    itemData['user-answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 7, 85, 33),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                itemData['user_answer'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 243, 33, 103),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 166, 33, 243),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ]),
    );
  }
}
