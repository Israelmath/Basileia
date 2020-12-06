import 'package:basileia/screens/home/home.controller.dart';
import 'package:basileia/screens/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget mainBG() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple[300].withOpacity(0.65),
              Colors.deepOrange[300].withOpacity(0.65),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
        // appBar: AppBar(
        //   title: Text('Basileia'),
        //   elevation: 2,
        //   backgroundColor: Colors.black54,
        // ),
        body: Stack(
          children: <Widget>[
            mainBG(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
