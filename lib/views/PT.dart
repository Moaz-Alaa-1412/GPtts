import 'package:flutter/material.dart';
import 'package:testapp/screens/quiz1.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class PT extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PTState();
  }
}

class PTState extends State<PT> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Start Quiz',
      color: Color(0xFF5ABD8C),
      home: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 440,
                      width: double.infinity,
                      color: Color(0xFFAFDFC7),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 420,
                      width: double.infinity,
                      color: Color(0xFF5ABD8C),
                      child: Center(
                        child: new Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: new Image(
                              fit: BoxFit.fill,
                              image: new AssetImage(
                                  'assets/images/Pngtrescience.png')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 10.0),
              ),
              Container(
                height: 56,
                width: 356,
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                child: new RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xFF5ABD8C)),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  highlightColor: Colors.transparent,
                  //splashColor: Color(0xFFBCCAFF),
                  color: Color(0xFFFFFFFF),
                  onPressed: startQuiz,
                  child: new Text(
                    'Let\'s Take a Quiz',
                    style: TextStyle(
                        color: Color(0xFF5ABD8C),
                        fontSize: 15.0,
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

  void startQuiz() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz1()));
    });
  }
}
