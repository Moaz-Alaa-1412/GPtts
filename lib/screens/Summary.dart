import 'package:flutter/material.dart';
import 'package:testapp/screens/quiz1.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:testapp/models/data.dart' as lev;
class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
        alignment: Alignment.topCenter,
        child: Column(
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
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 500, top: 50),
            ),
            Container(
              child: Center(
                child: Card(
                  child: Padding(
                    padding: new EdgeInsets.only(
                        top: 25, bottom: 25, left: 5, right: 5),
                    child: new Text(
                      "Final Score: $score",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 500, top: 20),
            ),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
              highlightColor: Colors.transparent,
              color: Color(0xFF5ABD8C),
              onPressed: () {
                questionNumber = 0;
                finalScore = 0;
                Navigator.pop(context);
              },
              minWidth: 150.0,
              child: Text(
                "Rest Quiz",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 500, top: 10),
            ),
            MaterialButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
              highlightColor: Colors.transparent,
              color: Color(0xFF5ABD8C),
              onPressed: () {
                lev.level=score==0?1:score;
                questionNumber = 0;
                finalScore = 0;
                    Navigator.pushReplacementNamed(context, '/dashboard');
              },
              minWidth: 150.0,
              child: Text(
                "Get Start",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
