import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testapp/screens/Summary.dart' as prefix0;
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new PT();

class PT {
  var questions = [
    "It was only ten days ago ...... she started her new job.",
    "Anne's house is somewhere in the ...... of the railway station.",
    "Is there ...... of food for everyone?",
    "His eyes were ...... bad that he couldn't read the number plate of the car in front.",
    "I was looking forward ...... at the new restaurant, but it was closed.",
  ];
  var choices = [
    ["then", "since", "after", "that"],
    ["region", "quarter", "vicinity", "district"],
    ["adequate", "enough", "sufficient", "plenty"],
    ["such", "too", "so", "very"],
    ["to eat", "to have eaten", "to eating", "eating"],
  ];
  var correctAnswers = [
    "that",
    "vicinity",
    "plenty",
    "so",
    "to eating",
  ];
}

class Quiz1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Color(0xFFAFDFC7),
                    ),
                  ),
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 190,
                      width: double.infinity,
                      color: Color(0xFF5ABD8C),
                      child: Center(
                        child: new Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                "Question ${questionNumber + 1} / ${quiz.questions.length}",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              new Text(
                                "Score: $finalScore",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              new Container(
                padding: new EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 20,
                ),
                child: new Text(
                  quiz.questions[questionNumber],
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                      side: BorderSide(color: Color(0xFF5ABD8C)),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    highlightColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        // debugPrint("Correct");
                        finalScore++;
                      } else {
                        //debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    minWidth: 190.0,
                    child: Text(
                      quiz.choices[questionNumber][0],
                      style: TextStyle(fontSize: 20.0, color: Color(0xFF5ABD8C)),
                    ),
                  ),
                  MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                      side: BorderSide(color: Color(0xFF5ABD8C)),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    highlightColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () {
                      if (quiz.choices[questionNumber][1] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    minWidth: 190.0,
                    child: Text(
                      quiz.choices[questionNumber][1],
                      style: TextStyle(fontSize: 20.0,  color: Color(0xFF5ABD8C)),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                      side: BorderSide(color: Color(0xFF5ABD8C)),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    highlightColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () {
                      if (quiz.choices[questionNumber][2] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    minWidth: 190.0,
                    child: Text(
                      quiz.choices[questionNumber][2],
                      style: TextStyle(fontSize: 20.0, color: Color(0xFF5ABD8C)),
                    ),
                  ),
                  new MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                      side: BorderSide(color: Color(0xFF5ABD8C)),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    highlightColor: Colors.transparent,
                    color: Colors.white,
                    onPressed: () {
                      if (quiz.choices[questionNumber][3] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    minWidth: 190.0,
                    child: Text(
                      quiz.choices[questionNumber][3],
                      style: TextStyle(fontSize: 20.0, color: Color(0xFF5ABD8C)),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 20, top: 50),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  highlightColor: Colors.transparent,
                  color: Color(0xFF5ABD8C),
                  minWidth: 100.0,
                  height: 40.0,
                  onPressed: restQuiz,
                  child: Text(
                    'Quit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void restQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => prefix0.Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}
