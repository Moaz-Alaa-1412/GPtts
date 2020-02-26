import 'package:testapp/screens/projects.dart';
import 'package:testapp/views/FeedBack.dart';
import 'package:testapp/views/PT.dart';
import 'package:testapp/views/UserProfile.dart';
import 'package:testapp/views/login.dart';
import 'package:testapp/widgets/widget_Slider.dart';
import 'package:flutter/material.dart';
import 'package:testapp/widgets/dashed_rect.dart';
import 'package:testapp/widgets/heading.dart';
import 'package:testapp/widgets/project_card_tile.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dashboard extends StatelessWidget {

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = token;
    prefs.setString(key, value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF5ABD8C),
          centerTitle: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 0.0, top: 4.0),
              child: Container(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                width: 80.0,
                height: 80.0,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color:Color(0xFF5ABD8C),
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/images/learning.png'),),
                ),
                accountEmail: Text("TamerHosney@Gmail.com"),
                accountName: Text("Tamer Hosney "),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: new AssetImage(
                      'assets/images/Creator.png')
                ),
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(),
                  ));},
              ),

              ListTile(
                leading: Icon(Icons.person),
                title: Text("My Profile"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => UserProfile(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Courses"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Projects(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.dvr),
                title: Text("Take Quiz"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => PT(),
                  ));                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About Us"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text("Share with Friends"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.rate_review),
                title: Text("Rate and Review"),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => FeedBack(),
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.flag),
                title: Text("Privacy Policy"),
                onTap: (){
                  _save(null);
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(),
                  ));
                },
              ),
            ],
          ),
        ),

        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: OvalBottomBorderClipper(),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              color: Color(0xFF5ABD8C),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 15
                              ),
                              Heading(
                                text: Text(
                                  "Today's tasks",
                                  style:
                                  TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              /*ProjectSlider(
                                projects: [1, 2, 3, 4, 5],
                              ),*/
                              SliderWidget(),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          ),


                        ],
                      ),


                  Heading(
                    text: Text(
                      "Open projects",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    button: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(8),
                        color: Colors.grey,
                        child: Center(
                          child: Icon(
                            Icons.navigate_next,
                            size: 28,
                            color: Colors.orange,
                          ),
                        ),
                        strokeWidth: 1,
                        dashPattern: [3, 4]),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return ProjectCardTile();
                      },
                    ),
                  ),
                ]),
              ),
            );
          },
        ));
  }
}
