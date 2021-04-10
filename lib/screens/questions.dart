import 'package:assignment/model/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:assignment/components/Question.dart';
import 'package:assignment/components/Explanation.dart';
import 'package:provider/provider.dart';
import 'package:assignment/components/ProgressScore.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<Quiz>(context, listen: false);
    var questions = quiz.questions;
    questions.shuffle();
    print("progress is ${quiz.progress}");
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ProgressScore(), Question(questions: questions)],
            ),
            Consumer<Quiz>(
              builder: (context, quiz, child) => Container(
                height: quiz.isAnswered ? double.infinity : 0,
                color: Colors.white.withOpacity(0),
              ),
            ),
            Consumer<Quiz>(
              builder: (context, quiz, child) => AnimatedPositioned(
                curve: Curves.easeInOutExpo,
                duration: Duration(milliseconds: 500),
                bottom: quiz.isAnswered ? 0 : -200,
                left: 0,
                right: 0,
                child: Explanation(
                  explanation: quiz.questions[quiz.progress]['explanation'],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
