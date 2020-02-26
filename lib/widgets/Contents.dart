import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:testapp/models/YouTube.dart';
import 'package:testapp/servies/api_servies.dart';
import 'package:testapp/widgets/youtbu_man.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';

var URL  = "https://www.youtube.com/watch?v=FZGugFqdr60&list=PL8dPuuaLjXtNlUrzyH5r6jN9ulIgZBpdo&index=8";

class ContentListItem extends StatelessWidget {
  String slug;
  ContentListItem(this.slug);

  Widget listOFYouTubeVideos(BuildContext context  , List<YouTube> youTube){
    var timeig = 20;
    var subTitle = Row(
      children: <Widget>[
        Icon(
          Icons.movie,
          color: Colors.black,
          size: 14,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: RichText(
            text: TextSpan(
              text: 'Free video. ',
              style: TextStyle(color: Colors.blue),
              children: <TextSpan>[
                TextSpan(
                    text: '${timeig}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
                TextSpan(
                    text: ' m.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: listOFYouTube.length,
          padding: const EdgeInsets.all(5.0),
          itemBuilder: (context, position) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.50,
              child:  Column(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset("assets/images/learning.png" , height: 40 , width: 40, ),
                    title: Text(youTube[position].title  , style: TextStyle(fontSize: 12),),
                    subtitle: subTitle,
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_downward),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {},
                    ),
                   // isThreeLine: true,
                    onTap: () {
                      var id = YoutubePlayer.convertUrlToId(
                        youTube[position].yt_url,
                      );
                      controller.load(id);
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  ),
                  Divider(),
                ],
              ),
            );
          }),
    );
  }
  @override
  Widget build(BuildContext context  ) {
    return Scaffold(
      body: new FutureBuilder(
          future: getDataOFYouTube(slug),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listOFYouTubeVideos( context , snapshot.data)
                : Center(child:  PixLoader(
                loaderType: LoaderType.Rocks,
                faceColor: Colors.orange),
            );
          }),
    );
  }
}
