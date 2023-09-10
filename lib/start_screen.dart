import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questions_app/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/exam.png',
            width: 300,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Try to solve my exam from the first time',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const QuestionsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 241, 229, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
