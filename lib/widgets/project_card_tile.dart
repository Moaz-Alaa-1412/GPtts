import 'dart:math' as math;

//import 'package:ecss/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

int number = 0;
final List title = [
  "Trending",
  "Words",
  "Take a lesson",
  "Quiz",
];

class ProjectCardTile extends StatelessWidget {
  final List colors = [
    Colors.blue,
    Colors.black,
    Colors.green,
    Colors.deepPurple.shade800,
    Colors.deepOrange.shade500,
    Colors.purpleAccent
  ];

  @override
  Widget build(BuildContext context) {
    var rng = new math.Random.secure();

    number = number == title.length ? 0 : number;
    final String word = title[number];

    return Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 0.0),
        child: Card(
          elevation: 1.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: ListTile(
              leading: Container(
                child: Center(
                  child: Text(
                    title[number = number <= 3 ? number : 0].split(" ")[0][0],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 24),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(8.0),
                    color: colors[rng.nextInt(5)]),
                width: 70.0,
                height: 80.0,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //  con(),
                  Text(
                    title[number++],
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: "SF"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${rng.nextInt(40)} tasks",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${rng.nextInt(10)} members",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 /* FAProgressBar(
                    size: 5,
                    currentValue: 75,
                    progressColor: Colors.green,
                    backgroundColor: Color(0xffF0F0F0),
                  ),*/
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
              onTap: () {
                if (word == title[1]) Navigator.pushNamed(context, "/d");
                if (word == title[3]) Navigator.pushNamed(context, "/PT");
              },
            ),
          ),
        ));
  }
}
