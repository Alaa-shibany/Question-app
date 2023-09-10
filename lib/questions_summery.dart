import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery({super.key, required this.summery});
  final List<Map<String, Object>> summery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summery.map((data) {
            return Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: data['user_answer'] == data['right_answer']
                          ? Colors.lightBlue
                          : Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                            ((data['question_index'] as int) + 1).toString()))),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'].toString(),
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 241, 229, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['user_answer'].toString(),
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 143, 143, 143),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['right_answer'].toString(),
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 202, 202, 202),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
