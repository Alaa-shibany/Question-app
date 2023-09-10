import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questions_app/data/questions.dart';
import 'package:questions_app/questions_summery.dart';
import 'package:questions_app/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswer});
  final List<dynamic> selectedAnswer;

  List<Map<String, Object>> getSummeryData() {
    List<Map<String, Object>> summery = [];
    for (int i = 0; i < selectedAnswer.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        'right_answer': questions[i].awnsers[0],
        'user_answer': selectedAnswer[i],
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summeryData
        .where((element) => element['user_answer'] == element['right_answer'])
        .length;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo,
              Colors.deepPurple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answred $numOfCorrectQuestions questions of $numOfTotalQuestions  questions correctly',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            QuestionsSummery(summery: summeryData),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Quiz(),
                  ),
                );
              },
              icon: const Icon(
                Icons.repeat,
                color: Colors.white,
              ),
              label: const Text(
                'Retry',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
