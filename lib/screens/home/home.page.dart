import 'package:basileia/util.dart';
import 'package:basileia/widgets/info.card.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'home.controller.dart';
import 'home.header.dart';

class HomePage extends StatelessWidget {
  HomeController homeController = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    homeController.iniciar();

    return Column(
      children: <Widget>[
        homeHeader(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Leonhard Paul Euler',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 24,
            ),
          ),
        ),
        InfoCard(
          iconLeft: homeController.assets.birth,
          localidade: this.homeController.cientista.localNascimento,
          ano: this.homeController.cientista.dataNascimento.year.toString(),
          evento:
              'Nascimento de \n${this.homeController.cientista.primeiroNome} ${this.homeController.cientista.sobrenome}\n\n${this.homeController.cientista.dataNascimento.day} de ${traduzMes(this.homeController.cientista.dataNascimento.month)} de ${this.homeController.cientista.dataNascimento.year}',
        ),
        FutureBuilder<List<dynamic>>(
          initialData: List(),
          future: this.homeController.buscarEventos(),
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
                return Flexible(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      print(listaEventos);
                      return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),);
                    },
                  ),
                );
            }
            return Text('Erro desconhecido');
          },
        )
      ],
    );
  }
}
