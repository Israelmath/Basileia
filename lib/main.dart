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
  HomeController homeController = GetIt.I.get<HomeController>();

  Widget build(BuildContext context) {
    this.homeController.iniciar(context);
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
      home: HomePage(),
    );
  }
}
