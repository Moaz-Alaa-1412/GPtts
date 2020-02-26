import 'package:testapp/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp/servies/api_servies.dart';
import 'package:testapp/screens/dashboad.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? null;
    if (value != null) {
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new Dashboard(),
      ));
    }

  }

  @override
  initState() {
    super.initState();
    read();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() {
    setState(() {
      if (_usernameController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        loginData(_usernameController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (status) {
            _showDialog();
          } else {
            Navigator.pushReplacementNamed(context, '/dashboard');

            debugPrint('Status Login: Seccess.. You Are Login');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECSS',
      color: Color(0xFF5ABD8C),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_forward_ios, color: Color(0xFF5ABD8C)),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/Starting'),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                margin: new EdgeInsets.only(left: 10),
                alignment: Alignment.topLeft,
                child: new Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 56,
                width: 335,
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                child: new TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFF2F5FC), width: 32.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xFF5ABD8C),
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansExtraLight",
                        fontSize: 12.0,
                        color: Color(0xFFc2c2c2)),
                  ),
                  style: TextStyle(
                      fontFamily: "WorkSansSemiBold",
                      fontSize: 14.0,
                      color: Colors.black),
                ),
              ),
              Container(
                height: 56,
                width: 335,
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0)),

                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFFF2F5FC), width: 32.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color(0xFF5ABD8C),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansExtraLight",
                        fontSize: 12.0,
                        color: Color(0xFFc2c2c2)),
                  ),
                  style: TextStyle(
                      fontFamily: "WorkSansSemiBold",
                      fontSize: 14.0,
                      color: Colors.black),
                ),
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
                    borderRadius: BorderRadius.circular(80.0),
                    side: BorderSide(color: Color(0xFF5ABD8C)),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  highlightColor: Colors.transparent,
                  //splashColor: Color(0xFF5ABD8C),
                  color: Color(0xFFFFFFFF),
                  onPressed: _onPressed,
                  child: new Text(
                    'Sign In',
                    style: TextStyle(
                      color: Color(0xFF5ABD8C),
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                const EdgeInsets.only(top: 0, left: 60.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    new Text(
                      'Don\'t have an account? ' , style: TextStyle(color: Color(0xFFc2c2c2)) ,
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new RegisterPage(),
                          ),
                        );
                      },
                      child: new Text(
                        'Sign Up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5ABD8C),
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              new RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                child: new Text(
                  'Close',
                  style: TextStyle(color: Color(0xFF5ABD8C)),
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
