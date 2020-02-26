import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapp/views/UserProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

  int id2 ;
  String name2;

  String email2 ;
  String Photographs ;
  String avatar_path;


  String serverUrl = "https://www.barmjan.com/api";
  String serverUrlimage = "https://www.barmjan.com";


   Future<UserProfile> FetchJSON() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? null;

    String MyUrl = "$serverUrl/auth/profile";

    var res = await http.get(MyUrl,headers: {"Accept":"application/json" ,
      "Authorization": "Bearer ${value}"});

    if (res.statusCode == 200) {
      var resBody = json.decode(res.body);
      var  data = resBody['data'];

      name2 = data['name'];
      id2 = data['id'];
      avatar_path = data['avatar_path'];
      email2=data['email'];
      Photographs =data['photographs'][0]["path"];
      print('path : ${avatar_path}');
      print('All path : ${serverUrlimage+avatar_path}');
      print("");
      print(' path 2  : ${Photographs}');
    }

    else {
      print('Something went wrong. \nResponse Code : ${res.statusCode}');
    }
  return  new UserProfile(name2: name2,email2: email2,);

   }




