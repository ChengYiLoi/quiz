import 'package:assignment/model/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants.dart';
import 'package:assignment/components/CardOption.dart';
import 'package:provider/provider.dart';

class Question extends StatelessWidget {
  const Question({
    Key key,
    @required this.questions,

  }) : super(key: key);

  final questions;
 
  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<Quiz>(context);
    return AnimatedOpacity(
      opacity: quiz.isVisible ? 1.0 : 0.0,
      curve: Curves.easeInOutBack,
      duration: Duration(milliseconds: 800),
          child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26.0, bottom: 26),
                child: Text(
                  questions[quiz.progress]['question'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // TODO question fontsize 40
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: textDarkBlue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardOption(
                    option: questions[quiz.progress]["options"][0],
                    imgName: questions[quiz.progress]['imgName'][0],
                    isCorrect: questions[quiz.progress]['answer'] == questions[quiz.progress]["options"][0] ? true : false,
                  ),
                  CardOption(
                    option: questions[quiz.progress]["options"][1],
                    imgName: questions[quiz.progress]['imgName'][1],
                    isCorrect: questions[quiz.progress]['answer'] == questions[quiz.progress]["options"][1] ? true : false,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardOption(
                    option: questions[quiz.progress]["options"][2],
                    imgName: questions[quiz.progress]['imgName'][2],
                    isCorrect: questions[quiz.progress]['answer'] == questions[quiz.progress]["options"][2] ? true : false,
                  ),
                  CardOption(
                    option: questions[quiz.progress]["options"][3],
                    imgName: questions[quiz.progress]['imgName'][3],
                    isCorrect: questions[quiz.progress]['answer'] == questions[quiz.progress]["options"][3] ? true : false,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}