import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_apps/data/questions.dart';
import 'package:quiz_apps/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {Key? key, required this.chosenAnswers, required this.onRestart})
      : super(key: key);
  final void Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions question correctly!',
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 4, 167, 167),
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                QuestionsSummary(summaryData),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: onRestart,
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 22, 102, 168)),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz!'))
          ],
        ),
      ),
    );
  }
}
