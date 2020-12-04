import 'package:basileia/screens/home.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'apiClient/client.dart';

void main() async {
  runApp(MyApp());

  Client().get();
}


class MyApp extends StatelessWidget {
//  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget mainBG() =>
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.purple[400].withOpacity(0.65),
            Colors.deepOrange[300].withOpacity(0.65),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
      );


  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Basileia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Basileia'),
            elevation: 2,
            backgroundColor: Colors.black54,
          ),
          body: Stack(
            children: <Widget>[
              mainBG(),
              Home(),
            ],
          ),
        ));
  }
}
