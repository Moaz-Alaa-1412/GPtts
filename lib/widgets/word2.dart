import 'dart:async';
import 'dart:io';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
class WordsPage extends StatefulWidget {
  WordsPage(
      {Key key,
      this.words,
      this.description_ar,
      this.introduction_ar,
      this.description,
      this.imgUrl,
      this.wordsexplain})
      : super(key: key);

  final String words;
  final String wordsexplain;
  final String description_ar;
  final String introduction_ar;
  final String description;
  final String imgUrl;



  @override
  _WordsPageState createState() => _WordsPageState();
}


enum TtsState { playing, stopped }

class _WordsPageState extends State<WordsPage> {


  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();


  FlutterTts flutterTts;
  dynamic languages;
  dynamic voices;
  String language;
  bool spp;
  String voice;
  String texttes = 'This handout will help you understand how paragraphs are formed, how to develop stronger paragraphs, and how to completely and clearly express your ideas.';

  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    spp = false;
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setLanguage("en-US");
    flutterTts.setVoice("en-gb-x-rjs#female_3-loca");
    //flutterTts.setVoice("id-id-x-dfz#male_2-local");


    if (Platform.isAndroid) {
      flutterTts.ttsInitHandler(() {
        _getLanguages();
        _getVoices();
      });
    } else if (Platform.isIOS) {
      _getLanguages();
      _getVoices();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    if (languages != null) setState(() => languages);
  }

  Future _getVoices() async {
    voices = await flutterTts.getVoices;
    if (voices != null) setState(() => voices);
  }

  Future _speak() async {
    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  void _onTap(String text, Function func) {
    setState(() {
      _newVoiceText = text;
      func();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
              bottom: MediaQuery.of(context).size.height * 0.03,
              left: 5,
              right: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * .45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 15.0,
              ),
            ],
            color: Colors.white,
          ),
          child: FlipCard(
            key: cardKey,
            flipOnTouch: true,
            direction: FlipDirection.HORIZONTAL,
            front: Card(
              color: Colors.deepPurple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    widget.words,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.volume_up),
                    onPressed: () {
                      _onTap('${widget.words}', _speak);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15, top: 10),
                    width: MediaQuery.of(context).size.width * .65,
                    child: Text("${widget.imgUrl}"),
//                    child: Text("${widget.wordsexplain}"),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.red,
                            ),
                            child: MaterialButton(
                              child: Text(
                                'Videos',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                              ),
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: MaterialButton(),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            back: Card(
              color: Colors.amber,

              child: Image.network(widget.imgUrl),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * .10,
          width: MediaQuery.of(context).size.width * .9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
          ),
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.only(left: 5),
              alignment: Alignment.center,
              padding: EdgeInsets.all(2),
              width: MediaQuery.of(context).size.width * 0.70,
              child: Text(
//                "${widget.worddefin[index]}",
                "${widget.introduction_ar}",
              ),
            ),
          ),
        ),
      ],
    );

//      Container(
//      margin: EdgeInsets.only(
//          top: MediaQuery.of(context).size.height * 0.03,
//          bottom: MediaQuery.of(context).size.height * 0.03,
//          left: 5,
//          right: 5),
//      width: MediaQuery.of(context).size.width * 0.9,
//      height: MediaQuery.of(context).size.height,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(15.0),
//        boxShadow: [
//          BoxShadow(
//            color: Colors.black45,
//            blurRadius: 15.0,
//          ),
//        ],
//        color: Colors.white,
//      ),
//      child: FlipCard(
//        key: cardKey,
//        flipOnTouch: true,
//        direction: FlipDirection.HORIZONTAL,
//        front: Card(
//          color: Colors.deepPurple,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              SizedBox(
//                height: MediaQuery.of(context).size.height * 0.1,
//              ),
//              Text(
//                widget.words,
//                style: TextStyle(color: Colors.white, fontSize: 25),
//              ),
//              IconButton(
//                color: Colors.white,
//                icon: Icon(Icons.volume_up),
//                onPressed: () {},
//              ),
//              Container(
//                margin: EdgeInsets.only(bottom: 15, top: 10),
//                width: MediaQuery.of(context).size.width * .65,
//                child: Text("${widget.wordsexplain}"),
//              ),
//              Container(
//                height: MediaQuery.of(context).size.height * .10,
//                decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(15),
////                      color: Colors.white,
//                    ),
//                child: ListView.builder(
//                  physics: AlwaysScrollableScrollPhysics(),
//                  shrinkWrap: true,
//                  scrollDirection: Axis.horizontal,
//                  itemCount: widget.worddefin.length,
//                  itemBuilder: (BuildContext context, int index) => Container(
//                    color: Colors.white,
//                    margin: EdgeInsets.only(left: 5),
//                    alignment: Alignment.center,
//                    padding: EdgeInsets.all(2),
//                    width: MediaQuery.of(context).size.width * 0.70,
//                    child: Text(
//                      "${widget.worddefin[index]}",
//                    ),
//                  ),
//                ),
//              ),
//              Expanded(
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  children: <Widget>[
//                    Expanded(
//                      child: MaterialButton(),
//                      flex: 1,
//                    ),
//                    Expanded(
//                      child: Container(
//                        margin: EdgeInsets.only(bottom: 15),
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(15.0),
//                          color: Colors.red,
//                        ),
//                        child: MaterialButton(
//                          child: Text(
//                            'Videos',
//                            style:
//                                TextStyle(fontSize: 18.0, color: Colors.white),
//                          ),
//                        ),
//                      ),
//                      flex: 3,
//                    ),
//                    Expanded(
//                      child: MaterialButton(),
//                      flex: 1,
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//        back: Card(
//          color: Colors.amber,
//          child: Image(
//            fit: BoxFit.contain,
//            image: AssetImage('assets/12.png'),
//          ),
//        ),
//      ),
//
//    );
  }
}
