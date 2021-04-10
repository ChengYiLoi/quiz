import 'package:assignment/screens/score.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants.dart';
import 'package:provider/provider.dart';
import 'package:assignment/model/Quiz.dart';

class Explanation extends StatelessWidget {
  const Explanation({
    @required this.explanation,
    Key key,
  }) : super(key: key);

  final String explanation;

  @override
  Widget build(BuildContext context) {
    //final quiz = Provider.of<Quiz>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: explanationBlue,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Explanation",
            style: TextStyle(
                color: explanationTextWhite,
                // TODO explanation header font size 30
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  explanation,
                  style: TextStyle(
                    // TODO explanaion font size 15
                    fontSize: 15, 
                    color: explanationTextWhite),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Consumer<Quiz>(
                  builder: (context, quiz, child) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 48.0),
                      primary: explanationTextWhite,
                    ),
                    onPressed: () {
                      if (quiz.isComplete()) {
                        //quiz.resetIsAnswered();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Score(),
                          ),
                        );
                      } else {
                        quiz.fadeOut();
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        // TODO explanation fontsize 15
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
