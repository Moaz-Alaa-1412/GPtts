import 'package:flutter/material.dart';
import 'package:testapp/screens/dashboad.dart';
import 'package:testapp/widgets/words2.dart';
import 'package:testapp/views/PT.dart';
import 'package:testapp/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future main() async {
//  new ImageInputll()
  runApp(MyApp());

  final prefs = await SharedPreferences.getInstance();
  final key = 'access_token';
  final value = prefs.get(key) ?? null;

  print(value);
  print(key);
}

class MyApp extends StatelessWidget {
  final String title = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECSS',
      color: Color(0xFF5ABD8C),
      home: LoginPage(
        title: "ECSS",
      ),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new Dashboard(),
        '/PT': (BuildContext context) => new PT(),
        '/d': (BuildContext context) => new Words2(),
        '/PT': (BuildContext context) => new PT(),


        /*'/register': (BuildContext context) => new RegisterPage(title: title),
        '/login': (BuildContext context) => new LoginPage(title: title),*/
      },
    );
  }
}
