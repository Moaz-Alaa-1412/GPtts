import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:testapp/models/channel.dart';
import 'package:testapp/models/courses.dart';
import 'package:testapp/models/YouTube.dart';
import 'package:testapp/models/topics.dart';

import 'dart:io';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

  String url = 'http://www.barmjan.com/api';
  String urlImage = 'http://www.barmjan.com';

  var status;
  var token;

  List<Channel> listOFChannel;
  List<Course> listOFCourse;
  List<Course> listSpecificCourses;
  List<YouTube> listOFYouTube;
  List<Topics> listOFWordTopics;

  loginData(String username, String password) async {
    String MyUrl = "$url/auth/login";
    final response = await http.post(MyUrl, headers: {
      "Accept": "application/json"
    }, body: {
      "username": "$username",
      "password": "$password",
    });

    status = response.body.contains('failure');
    var data = json.decode(response.body);

    if (response.statusCode != 200) {
      print('Error Status : ${data["status"]}');
      print('Error Data : ${data["data"]}');
      print('data : ${data["msg"]}');
    } else {
      print('access_token : ${data["access_token"]}');
      print('Error Status: ${status}');
      _save(data["access_token"]);
    }
  }

  registerData(String name, String email, String password, String type,
      String phone) async {
    String MyUrl = "$url/auth/register";
    final response = await http.post(MyUrl, headers: {
      "Accept": "application/json"
    }, body: {
      "name": "$name",
      "email": "$email",
      "password": "$password",
      "type": "$type",
      "phone": "$phone",
    });

    status = response.body.contains('failure');
    var data = json.decode(response.body);

    if (response.statusCode != 200) {
      print('status : ${data["status"]}');
      print('email : ${data["data"]}');
    } else {
      print('status : ${data["status"]}');
      _save(data["access_token"]);
    }
  }


  // This Function To Get Data Of Channel From API

  Future<List<Channel>> getDataOFChannels() async {
    var respond = await http.get(Uri.encodeFull("$url/channels"),
        headers: {"Accept": "application/json"});

    if (respond.statusCode == 200) {
      var data = json.decode(respond.body);
      var respondBody = data["channels"] as List;

      listOFChannel = respondBody.map<Channel>((json) => Channel.fromJson(json)).toList();
    }
    return listOFChannel;
  }

  Future<List<Course>> getSpecificCourses(String slug) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? null;

    var respond = await http.get(Uri.encodeFull("$url/channels/$slug"),
        headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $value",
    });

    if (respond.statusCode == 201) {
      var data = json.decode(respond.body);
      var respondBody = data["courses"] as List;
      listSpecificCourses = respondBody.map<Course>((json) => Course.fromJson(json)).toList();
    }
    return listSpecificCourses;
  }

  Future<List<Course>> getDataOFCourse() async {
    var respond = await http.get(Uri.encodeFull("$url/courses"),
        headers: {"Accept": "application/json"});

    if (respond.statusCode == 200) {
      var data = json.decode(respond.body);
      var respondBody = data["courses"] as List;

      listOFCourse = respondBody.map<Course>((json) => Course.fromJson(json)).toList();
    }
    return listOFCourse;
  }

  Future<List<YouTube>> getDataOFYouTube(String slug) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? null;

    var respond = await http.get(Uri.encodeFull("$url/${slug}/videos"),
        headers: {"Accept": "application/json"  ,
          "Authorization" : "Bearer $value"

    });

    if (respond.statusCode == 200) {
      print("sucess");
      var data = json.decode(respond.body) as List;
      listOFYouTube = data.map<YouTube>((json) => YouTube.fromJson(json)).toList();
    }
    return listOFYouTube;
  }

  Future<List<Topics>> getDataOFWordTopics() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = prefs.get(key) ?? null;

  var respond = await http.get(Uri.encodeFull("$url/topics/list"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $value",
      });

  //print(respond.body);
  if (respond.statusCode == 200) {
    var data = json.decode(respond.body);
    var respondBody = data["topics"] as List;
    listOFWordTopics = respondBody.map<Topics>((json) => Topics.fromJson(json)).toList();
  }
  return listOFWordTopics;
}

  Future<Map> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? null;

    String MyUrl = "$url/auth/profile";
    http.Response response = await http.get(MyUrl, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $value"
    });
    return json.decode(response.body);
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'access_token';
    final value = token;
    prefs.setString(key, value);
  }

  Future<Map<String, dynamic>> feedback(double stars , String description  ,File image) async {

  final prefs = await SharedPreferences.getInstance();
  final key = 'access_token';
  final value = prefs.get(key) ?? null;

  // Find the mime type of the selected file by looking at the header bytes of the file
  final mimeTypeData =
  lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
  // Intilize the multipart request
  final imageUploadRequest =
  http.MultipartRequest('POST', Uri.parse("$url/app/rate"));

  imageUploadRequest.headers.addAll({
    "Accept": "application/json",
    "Authorization" : "Bearer $value"

  });
  imageUploadRequest.fields['stars']='$stars';
  imageUploadRequest.fields['description']='$description';
      // Attach the file in the request
      final file = await http.MultipartFile.fromPath('file', image.path,
      contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

  // Explicitly pass the extension of the image with request body
  // Since image_picker has some bugs due which it mixes up
  // image extension with file name like this filenamejpge
  // Which creates some problem at the server side to manage
  // or verify the file extension
  imageUploadRequest.fields['ext'] = mimeTypeData[1];

  imageUploadRequest.files.add(file);

  try {
    final streamedResponse = await imageUploadRequest.send();

    final response = await http.Response.fromStream(streamedResponse);

    final Map<String, dynamic> responseData = json.decode(response.body);
    print(" testtttttttttt${responseData}");

    return responseData;

  } catch (e) {
    print(e);
    return null;
  }
}