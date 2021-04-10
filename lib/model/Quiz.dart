import 'package:flutter/material.dart';

class Quiz with ChangeNotifier {
  int progress = 0;
  int score = 0;
  bool isAnswered = false;
  bool isVisible = true;
  var questions = [
    {
      "question": "Which of the following is a mammal?",
      "options": ["Duck", "Whale", "Shark", "Butterfly"],
      "imgName": ['duck.PNG', "whale.PNG", "Shark.PNG", "Butterfly.PNG"],
      "answer": "Whale",
      "explanation":
          "Whales are mammals. Mammals are characterized by the presence of mammary glands in which females produce milk for feeding their young."
    },
    {
      "question": "Which of the following materials is the hardest?",
      "options": ["Granite", "Steel", "Diamond", "Gold"],
      "imgName": ['stone.png', "steel.png", "Diamond.png", "gold.png"],
      "answer": "Diamond",
      "explanation":
          "Diamonds are the hardest material on the Vickers hardness scale."
    },
    {
      "question": "Which planet is the smallest?",
      "options": ["Mercury", "Venus", "Neptune", "Earth"],
      "imgName": ['mercury.jpg', "venus.png", "neptune.png", "earth.png"],
      "answer": "Mercury",
      "explanation": "Mercury is the smallest."
    }
  ];

  

  void fadeOut() {
    print("fade out");
    isAnswered = false;
    isVisible = false;
    Future.delayed(Duration(milliseconds: 1500), () {
      incrementProgress();
      fadeIn();
    });
    notifyListeners();
  }

  void fadeIn() {
    isVisible = true;
    notifyListeners();
  }

  void incrementProgress() {
    print("progress incremented");
    progress++;
    notifyListeners();
  }

  void incrementScore() {
    score++;
    notifyListeners();
  }

  void resetIsAnswered() {
    isAnswered = false;
    notifyListeners();
  }

  void answered() {
    isAnswered = true;
    notifyListeners();
  }

  bool isComplete() {
    if (progress == (questions.length - 1)) {
      print("finished quiz");
      return true;
    }
    return false;
  }

  void reset() {
    progress = 0;
    score = 0;
    isAnswered = false;
    notifyListeners();
  }
}
