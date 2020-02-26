import 'package:flutter/material.dart';
import 'package:flutter_show_more/flutter_show_more.dart';

String descText =
    "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. ";
bool descTextShowFlag = false;

/*  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(16.0),
      child: ShowMoreText(
        descText,
        maxLength: 100,
        style: TextStyle(fontSize: 12, color: Colors.grey),
        showMoreText: 'show more',
        showMoreStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor,
        ),
        shouldShowLessText: true,
        showLessText: 'show less',
      ),
    );
  }*/

class OverVIewListItem extends StatelessWidget {
  String description;
  OverVIewListItem(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "Description ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    padding:
                    EdgeInsets.only(top: 3, left: 20, bottom: 10, right: 20),
                    child: new ShowMoreText(
                      description,
                      //maxLength: 5,
                      style: TextStyle(
                        fontFamily: 'Spectral',
                        fontWeight: FontWeight.w400,
                        //try changing weight to w500 if not thin
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[800],
                        fontSize: 12.0,
                      ),
                      showMoreText: 'show more',
                      showMoreStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      shouldShowLessText: true,
                      showLessText: 'show less',
                    ),
                  ),
                ],
              )),
          new Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "Instructor",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: ListTile(
                      leading: new Image.asset(
                        'assets/images/Creator.png',
                        fit: BoxFit.cover,
                      ),
                      title: Text('Ahmed', style: TextStyle(color: Colors.black)),
                      subtitle: Text(
                        "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is ",
                        style: TextStyle(
                          fontFamily: 'Spectral',
                          fontWeight: FontWeight.w400,
                          //try changing weight to w500 if not thin
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[800],
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          new Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "Badges",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  new Image.asset(
                    'assets/images/IDNNewCollarWebDevelopment.png',
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    child: new Text(
                      "Paragraphs are the building blocks of papers. Many students define paragraphs",
                      style: TextStyle(
                        fontFamily: 'Spectral',
                        fontWeight: FontWeight.w400,
                        //try changing weight to w500 if not thin
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[800],
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
