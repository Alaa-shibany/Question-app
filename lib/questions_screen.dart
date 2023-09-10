import 'package:flutter/material.dart';
import 'package:questions_app/answer_button.dart';
import 'package:questions_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questions_app/result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var selectedAnswer = [];
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    void answerTheQuestion(String answer) {
      selectedAnswer.add(answer);
      if (selectedAnswer.length == questions.length) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultScreen(
            selectedAnswer: selectedAnswer,
          ),
        ));
      } else {
        setState(() {
          currentQuestionIndex++;
        });
      }
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 241, 229, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswer().map(
                  (e) => AnswerButton(
                      answer: e, onTap: () => answerTheQuestion(e)),
                ),
          ],
        ),
      ),
    );
  }
}
