import 'package:flutter/material.dart';
import 'package:testapp/widgets/word2.dart';
import 'package:testapp/servies/api_servies.dart';
import 'package:testapp/models/topics.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';


class Words2 extends StatefulWidget {
  @override
  _Words2State createState() => _Words2State();
}

class _Words2State extends State<Words2> {
  Widget words2(BuildContext context,List<Topics> topics) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hjgjh"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: words.length,
//                itemCount: listOFChannel.length,
                itemBuilder: (BuildContext context, int index) {
                  return WordsPage(
//                    words: words[index],
                    words: topics[index].name,
                    wordsexplain: topics[index].introduction,
                    description: topics[index].description ,
                    description_ar: topics[index].descriptionAr ,
                    introduction_ar: topics[index].introductionAr ,
                    imgUrl: topics[index].imageFilename,
                  );
                },
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataOFWordTopics(),
        builder: (context, snapshot) {
          return snapshot.data != null
              ? words2(context,snapshot.data)
              : Center(
                  child: PixLoader(
                      loaderType: LoaderType.Rocks,
                      faceColor: Color(0xffef4234)),
                );
        });
  }
}

List<String> words = ['hello', 'world', 'flutter', 'is', 'awesome'];
//List<String> words = ['${topics[0].name}', 'world', 'flutter', 'is', 'awesome'];
List<String> wordsexplain = [
  'hellsdlvkjsklfo',
  'worlsdkjbslkhdclsd',
  'flutter  dsfjshbdlasd',
  'is avjdvkuacd',
  'awesomeabkfbaklcbakjc'
];
List<List<String>> wordsExample = [
  ['hello1', 'world1', 'flutter1', 'is1', 'awesome1'],
  ['hello2', 'world2', 'flutter2', 'is2', 'awesome2'],
  ['hello3', 'world3', 'flutter3', 'is3', 'awesome3'],
  ['hello4', 'world4', 'flutter4', 'is4', 'awesome4'],
  ['hello5', 'world5', 'flutter5', 'is5', 'awesome5'],
];
