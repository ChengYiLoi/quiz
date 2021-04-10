import 'package:assignment/constants.dart';
import 'package:assignment/model/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class ProgressScore extends StatelessWidget {
  const ProgressScore({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Consumer<Quiz>(
            builder: (context, quiz, child) => LinearPercentIndicator(
              progressColor: Color(0xFF6FCF97),
              width: 300.0,
              lineHeight: 14.0,
              animation: true,
              animateFromLastPercent: true,
              percent: (quiz.progress + 1) / quiz.questions.length.toDouble(),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "Score",
              style: TextStyle(
                // TODO score font size 18
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textDarkBlue),
            ), 
            Consumer<Quiz>(
              builder: (context, quiz, child) => Text(
                quiz.score.toString(),
                style: TextStyle(fontSize: 18, color: textDarkBlue),
              ),
            )
          ],
        )
      ],
    );
  }
}
