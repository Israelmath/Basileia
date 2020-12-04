import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Client{
  static const _configMap = {
    'databaseURL': 'https://basileia-da7df.firebaseio.com/',
  };
  static const _baseUrl = 'https://basileia-da7df.firebaseio.com/';

  Future<Response> get() async {
//    Response response = await http.get(_baseUrl+'/cientista');
//    print(response.body);
  var resp = await FirebaseFirestore.instance.settings;
  print(resp);

  }
}