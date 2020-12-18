import 'package:basileia/screens/backgrounds.dart';
import 'package:basileia/screens/historia/historia.page.dart';
import 'package:basileia/widgets/info.card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'home.controller.dart';
import 'home.header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.iniciar(context);
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_outlined),
        onPressed: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => HistoriaPage(),
              ),
            ).then((value) => setState((){})),
      ),
      body: Stack(
        children: <Widget>[
          LRBackground(),
          Column(
            children: <Widget>[
              homeHeader(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Observer(builder: (_) {
                  return Text(
                    '${this.homeController.cientista.nomeCientista}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 24,
                        color: Colors.white),
                  );
                }),
              ),
              Container(
                width: size.width,
                height: size.height*0.65,
                child: Stack(
                  children: [
                    Observer(builder: (_){
                      return FutureBuilder<List>(
                        initialData: List(),
                        future: this.homeController.buscarInfosHome(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              break;
                            case ConnectionState.waiting:
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                              break;
                            case ConnectionState.done:
                              final List listaEventos = snapshot.data;
                              // return Text('Erro desconhecido');
                              if (listaEventos.isEmpty)
                                return Center(
                                  child: Text('Nenhuma informação cadastrada'),
                                );
                              return ListView.builder(
                                itemCount: listaEventos.length,
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: InfoCard(listaEventos[index]),
                                  );
                                },
                              );
                          }
                          return Text('Erro desconhecido');
                        },
                      );
                    }),
                    Observer(
                      builder: (_) {
                        return Visibility(
                          visible: this.homeController.loading,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.8),
                            ),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // HistoriaPage(),
        ],
      ),
    );
  }
}
