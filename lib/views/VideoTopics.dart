import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testapp/widgets/Contents.dart';
import 'package:testapp/widgets/OverView.dart';
import 'package:testapp/widgets/youtbu_man.dart';


class VTopics extends StatefulWidget {
   String slug , description;
   VTopics({Key key, this.slug , this.description}): super(key: key);

  @override
  VTopicsState createState() => new VTopicsState();
}

class VTopicsState extends State<VTopics>
    with SingleTickerProviderStateMixin {

  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController( vsync: this , length: 3);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      body: new ListView(
        // physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *.34,
            child: YoutubePlayerDemoApp(),
            //color: Colors.red,
          ),
          new Container(
            decoration:
            new BoxDecoration(color: Colors.white),
            child: new TabBar(
              controller: _controller,
              labelColor: Colors.grey,
              labelStyle: TextStyle(fontSize:   13.0 ),
              tabs: [
                new Tab(
                  //icon: const Icon(Icons.home),
                  text: 'OVERVIEW',
                ),
                new Tab(
                  // icon: const Icon(Icons.my_location),
                  text: 'CONTENT',
                ),
                new Tab(
                  //icon: const Icon(Icons.ac_unit),
                  text: 'Q+A',
                ),
              ],
            ),
          ),
          new Container(
            height: MediaQuery.of(context).size.height,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                OverVIewListItem(widget.description),
                 ContentListItem(widget.slug),

                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.ac_unit),
                    title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: new IconButton(
                        icon: const Icon(Icons.ac_unit), onPressed: () {}),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );

  }
}
