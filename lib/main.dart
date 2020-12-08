import 'package:basileia/screens/historia/historia.controller.dart';
import 'package:basileia/screens/historia/historia.page.dart';
import 'package:basileia/screens/home/home.controller.dart';
import 'package:basileia/screens/home/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

void main() {

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<HistoriaController>(HistoriaController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget homeBG() => Container(
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      title: 'Basileia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(),
        body: Stack(
          children: <Widget>[
            homeBG(),
            // HomePage(),
            HistoriaPage(),
          ],
        ),
      ),
    );
  }
}
