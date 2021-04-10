import 'package:assignment/constants.dart';
import 'package:assignment/model/Quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<Quiz>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: Text(
                    "Total Score",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: textDarkBlue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                    quiz.score.toString(),
                    style: TextStyle(fontSize: 40, color: textDarkBlue),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: double.infinity,
                          child: CupertinoButton(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              color: Color(0xFF6BCCF2),
                              child: Text(
                                "Restart",
                                style: TextStyle(fontSize: 30),
                              ),
                              onPressed: () {
                                quiz.reset();
                                Navigator.pop(context);
                              })),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
