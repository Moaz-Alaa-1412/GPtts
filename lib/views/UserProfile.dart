/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
main(){
  runApp(new AppName());
}

class AppName extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new AppState();
  }
}

class AppState extends State<AppName>{
  String name = '';
  int id = 0;
  int public_repos = 0;

  int id2 ;
  String name2;

  String email;
  String email2 ;

  String avatar_path;
  String avatarPath;

  String serverUrl = "https://www.barmjan.com/api";
  String serverUrlimage = "https://www.barmjan.com";

  getDatauser() async{
    String MyUrl = "$serverUrl/auth/profile";

    var res = await http.get(MyUrl,headers: {"Accept":"application/json" ,
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY4ZTA4ZTg1ODM2MmVjYTlkZTZiZTdiOGI5YjNjYzEzM2QxNDU2ZTY4NGJjNTBlZGI5OTllODkxOTU1M2ZiZWU4OTNhNDM1ODc1YjNkNzFjIn0.eyJhdWQiOiIyIiwianRpIjoiZjhlMDhlODU4MzYyZWNhOWRlNmJlN2I4YjliM2NjMTMzZDE0NTZlNjg0YmM1MGVkYjk5OWU4OTE5NTUzZmJlZTg5M2E0MzU4NzViM2Q3MWMiLCJpYXQiOjE1NzgxNjg5NDcsIm5iZiI6MTU3ODE2ODk0NywiZXhwIjoxNjA5NzkxMzQ3LCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.EIll1r3RBmGKPW9s7yoaP2tNSD9tTlY1M_hog5eN9-leXQgfjUIgsUyOMHFpg9pUJaWDXHT9qt_dcutgYYXZYH_Tl7SdH46rE07wbq9aGst98J6WL052Yufd_P9e2t_KjyRpDwRIOGlbw6ELNfl4Vhg4CyPiWHghwhjpXmAr7OKcoN1zmqdBbaElj2RK5qYLGxT3ZqU9p1M6FY-S6ehcuXvyrbnazZzaDApHH3yQ0hJ4KFH4oALwHEtMmIFE9B6PDQ47K-tiJLA_TyTGv2WKa_Xbl3hrHKcQ9KOnemmYiN7wpgzDSQ1oZa_sXPvQkNzKd30OueXaANMC5jRN6iZREjH4UH1tGUvPilSOoCwkDbnWRjGqQ-tDkplxiFCtRbr7FOFSqHEFDjZl4TYZuZnoyKyBKwP5g6hyXeB60h628vCYEa15QPPmo8VmN2jjqNb6ceQOAqEXF56W7cpPOB7-mm2gjNyN2b0GUr9GPjfeqlo_GcCgo6n2MapVC5ZchSEXw6PtFv4OX54LV0xYmaKggI3CaiWsg07HvEFc4rtNh8v7fVH3c7qLXDvdAOhoM0Wyd6LQQJR3kVZkeA6KdeX42-LSQu-RAPU-WIX9QJEd4GPtXH7IOfFbA1ZaK3BhJa1cLy7OeFHBeRCJBrIJjseBncE-J1t0qz78fpbupbbboJ4"
    });

    var resBody = json.decode(res.body);
   var  data = resBody['data'];

    name2 = data['name'];
    id2 = data['id'];
    avatar_path = data['avatar_path'];
    email2=data['email'];

    setState(() {
      print("Success");
      print(name2);
      print(avatar_path);
     // print(avatar_path);
    });
  }

  TextEditingController user = new TextEditingController();
  String url = 'https://api.github.com/users/';

  getData(String username) async{
    String profile = url+username;
    var res = await http.get(profile,headers: {"Accept":"application/json"});
    var resBody = json.decode(res.body);
    name = resBody['name'];
    id = resBody['id'];
    public_repos = resBody['public_repos'];
    setState(() {
      print("Success");
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar:  AppBar(
          title: new Text("JSON App"),
        ),
        body: new Container(
          padding: EdgeInsets.all(12.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new TextField(
                controller: user,
                decoration: InputDecoration(hintText: "Enter Github Uername"),
              ),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new RaisedButton(
                  onPressed: ()=>getData(user.text),
                  child: new Text("Get Info")
              ),

              new Padding(padding: EdgeInsets.only(bottom: 20.0)),
              new Text("ID : $id",style: TextStyle(fontSize: 20.0),),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new Text("Name : $name",style: TextStyle(fontSize: 22.0),),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new Text("Public repo : $public_repos",style: TextStyle(fontSize: 20.0),),


              new RaisedButton(
                  onPressed: ()=>getDatauser(),
                  child: new Text("Get Info user")
              ),
              new Padding(padding: EdgeInsets.only(bottom: 20.0)),
              new Text("ID : $id2",style: TextStyle(fontSize: 20.0),),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new Text("Name : $name2",style: TextStyle(fontSize: 22.0),),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),
              new Text("Email : $email2",style: TextStyle(fontSize: 10.0),),
              new Padding(padding: EdgeInsets.only(bottom: 10.0)),


              */
/*Image.network(
                'https://www.barmjan.com${avatar_path}',
                fit: BoxFit.cover,
              ),*//*

            ],
          ),
        ),
      ),
    );
  }
}*/

/*{
"status": true,
"data": {
"id": 158,
"name": "raja",
"email": "al@al.com",
"avatar_path": "/images/avatar.svg",
"confirmed": false,
"permission": false,
"plan": null,
"monthlyTotal": null,
"active": 0,
"created_at": "2020-02-21 13:32:08",
"updated_at": "2020-02-21 13:32:08",
"photographs": [],
"user_meta": []
}
}*/
import 'package:flutter/material.dart';
import 'package:testapp/models/user.dart';


class UserProfile extends StatefulWidget {
  String name2 , email2;
  UserProfile({Key key, this.name2 , this.email2}): super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {


  @override
  void initState() {
    super.initState();
    FetchJSON();
  }


  Widget MyUI() {

    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new ListView(
        children: <Widget>[
         /* FadeInImage(image: NetworkImage("https://www.barmjan.com${avatar_path}"),
            placeholder: AssetImage('assets/imag.jpg' ),width: 100, height: 100,),*/
          new Padding(padding: new EdgeInsets.symmetric(vertical: 6.0)),
          new Text(
            'Name : $widget.name2',
            style: Theme.of(context).textTheme.headline,
          ),
          new Padding(padding: new EdgeInsets.symmetric(vertical: 6.0)),
          new Text(
            'email : $widget.email2',
            style: Theme.of(context).textTheme.title,
          ),
        ],
      ),
    );
  }


//  String _fullName = name2;
  final String _status = "Software Developer";
  final String _bio =
      "\"This is your profile page. You can see the progress you've made with your career and manage your projects or assigned tasks\"";
  final String _Friends = "22";
  final String _posts = "24";
  final String _scores = "450";

  Widget _buildCoverImage( ) {
    return Container(
      height: 190,
      width: 400,
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://creativebonito.com/wp-content/uploads/2019/07/learning-education-illustration-concept-templates-cover.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://www.kindpng.com/picc/m/24-248729_stockvader-predicted-adig-user-profile-image-png-transparent.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
          border: Border.all(
            color: Colors.white,
            width: 10.0,
          ),
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      '${name2}',
      style: _nameTextStyle,
    );
  }

  Widget _buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        _status,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
Widget _buildemail(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        '${email2}',
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.grey[600],
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String count) {
    TextStyle _statLabelTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
    );

    TextStyle _statCountTextStyle = TextStyle(
      color: Colors.black54,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count,
          style: _statCountTextStyle,
        ),
        Text(
          label,
          style: _statLabelTextStyle,
        ),
      ],
    );
  }

  Widget _buildStatContainer() {
    return Container(
      height: 60.0,
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildStatItem("Friends", _Friends),
          _buildStatItem("Posts", _posts),
          _buildStatItem("Scores", _scores),
        ],
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    TextStyle bioTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,//try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.all(8.0),
      child: Text(
        _bio,
        textAlign: TextAlign.center,
        style: bioTextStyle,
      ),
    );
  }

  Widget _buildSeparator( ) {
    return Container(
      //width: screenSize.width / 1.6,
      width: 200 ,

      height: 2.5,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 4.0),
    );
  }

  Widget _buildGetInTouch(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.only(top: 8.0),
      child: Text(
        "Show Your Progress",
        style: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () => print("Your Courses Is "),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Color(0xFF404A5C),
                ),
                child: Center(
                  child: Text(
                    "COURSES",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: InkWell(
              onTap: () => print("Message"),
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "MESSAGE",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
           _buildCoverImage(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height:100),
                    _buildProfileImage(),
                    _buildFullName(),
                    _buildStatus(context),
                    _buildemail(context),
                    _buildStatContainer(),

                    _buildBio(context),
                    _buildSeparator(),
                    SizedBox(height: 10.0),
                    _buildGetInTouch(context),
                    SizedBox(height: 8.0),
                    _buildButtons(),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
