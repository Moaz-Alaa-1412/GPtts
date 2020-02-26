import 'package:testapp/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:testapp/servies/api_servies.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {

  String _myActivity;

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _typeController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        registerData(
                _nameController.text.trim(),
                _emailController.text.trim().toLowerCase(),
                _passwordController.text.trim(),
                _typeController.text.trim(),
                _phoneController.text.trim())
            .whenComplete(() {
          if (status) {
            _showDialog();
          } else {
            Navigator.pushReplacementNamed(context, '/PT');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up',
      color: Color(0xFF5ABD8C),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Color(0xFF5ABD8C)),
            onPressed: () => Navigator.pushReplacementNamed(context, '/Starting'),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: new Text(
                  'Sign Up',
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
                  controller: _nameController,
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
                      Icons.person,
                      color: Color(0xFF5ABD8C),
                    ),
                    hintText: 'Name',
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansExtraLight", fontSize: 12.0 , color: Color(0xFFc2c2c2)),
                  ),
                ),
              ),
              Container(
                height: 56,
                width: 335,
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                child: new TextField(
                  controller: _emailController,
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
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansExtraLight", fontSize: 12.0 , color: Color(0xFFc2c2c2)),
                  ),
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
                        fontFamily: "WorkSansExtraLight", fontSize: 12.0 , color: Color(0xFFc2c2c2)),
                  ),
                ),
              ),
              Container(
                height: 56,
                width: 335,
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                child: new TextField(
                  controller: _typeController,
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
                      Icons.phone_iphone,
                      color: Color(0xFF5ABD8C),
                    ),
                    hintText: 'Phone',
                    hintStyle: TextStyle(
                        fontFamily: "WorkSansExtraLight", fontSize: 12.0 , color: Color(0xFFc2c2c2)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                height: 100,
                child: new DropDownFormField(
                  titleText: 'My Account ',
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Student",
                      "value": "Student",
                    },
                    {
                      "display": "Instructor",
                      "value": "Instructor",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0),
              ),
              Container(
                height: 56,
                width: 335,
                padding: const EdgeInsets.only(
                    top: 0, left: 32.0, right: 32.0, bottom: 10.0),
                child: new RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                      side: BorderSide(color: Color(0xFF5ABD8C)) ,
                  ),
                  padding: const EdgeInsets.all(0.0),
                  highlightColor: Colors.transparent,
                  //splashColor: Color(0xFF5ABD8C),
                  color: Color(0xFFFFFFFF),
                  onPressed: _onPressed,
                  child: new Text(
                    'Sign Up ',
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
                      'Do you have an account ?' , style: TextStyle(color: Color(0xFFc2c2c2)) ,
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new LoginPage(),
                          ),
                        );
                      },
                      child: new Text(
                        'Sign In',
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
                child: new Text(
                  'Close',
                  style: TextStyle(color: Color(0xFF5ABD8C) ,),
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
