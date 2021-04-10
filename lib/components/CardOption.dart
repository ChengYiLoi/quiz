import 'package:assignment/model/Quiz.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants.dart';
import 'package:provider/provider.dart';

class CardOption extends StatefulWidget {
  const CardOption({
    Key key,
    @required this.option,
    @required this.imgName,
    @required this.isCorrect,
  }) : super(key: key);

  final String option;
  final String imgName;
  final bool isCorrect;

  @override
  _CardOptionState createState() => _CardOptionState();
}

class _CardOptionState extends State<CardOption> {
  Color color;
  bool isSelected;
  bool selectedCorrect;
  @override
  void initState() {
    color = cardGrey;
    isSelected = false;
    selectedCorrect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showAnswer() {
      print("show answer function ran");
      setState(() {
        isSelected = true;
        color = cardGreen;
      });
    }

    resetCard() {
      print("reset card");
      setState(() {
        isSelected = false;
        selectedCorrect = false;
        color = cardGrey;
      });
    }

    final quiz = Provider.of<Quiz>(context);
    // show the correct answer if the selected card is wrong
    if (quiz.isAnswered && widget.isCorrect && !selectedCorrect) {
      showAnswer();
    }
    // resets cards that are selected correctly or incorrectly
    else if (!quiz.isAnswered && isSelected) {
      resetCard();
    }
    return GestureDetector(
      onTap: () {
        quiz.answered();
        isSelected = true;
        setState(() {
          if (widget.isCorrect) {
            color = cardGreen;
            selectedCorrect = true;
            quiz.incrementScore();
            print("answer is correct");
          } else {
            color = cardRed;
            print("answer is incorrect");
          }
        });
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          // TODO card border radius 15
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: 180,
          height: 180,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                children: [
                  Text(
                    widget.option,
                    style: TextStyle(
                      // TODO card font size 30
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                  Expanded(
                    child: Image(
                      image: AssetImage("images/${widget.imgName}"),
                      //color: cardGrey,
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: isSelected ? 1.0 : 0.0,
                  child: Container(
                    child: widget.isCorrect
                        ? Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: correctCircleGreen,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.check,
                              size: 48,
                              color: Color(0xFF58AF60),
                            ),
                          )
                        : Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: wrongCircleRed,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 48,
                              color: Color(0xFFA42B38),
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
