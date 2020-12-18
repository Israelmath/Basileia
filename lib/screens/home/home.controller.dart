import 'package:basileia/dao/daoHistoria.dart';
import 'package:basileia/models/dadoHistoricoModelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../util.dart';

part 'home.controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  BuildContext contextoAtual;
  final assets = myAssets;
  List<dynamic> listaEventos = List();
  HistDao daoHistoria = HistDao();

  Historia fofocas = Historia(
      titulo: 'Big bang',
      dataHist: DateTime.now(),
      localHist: 'Mundo',
      tipoAcontecimento: 3,
      descricao: 'Teste',
      referencia: 'www.blogs.com');

  @observable
  double visibilidade = 1;

  @observable
  bool loading = true;

  @observable
  Historia cientista = new Historia();

  @action
  atualizaVisibilidade(double value) => this.visibilidade = value;

  @action
  carregarInfoCientista() async {
    this.cientista = await this.daoHistoria.buscaCientista(1);
    if (this.cientista == null || cientista.tipoAcontecimento != 0) {
      this.daoHistoria.salvarDadoHistorico(
            new Historia(
                nomeCientista: 'Leonhard Paul Euler',
                dataHist: DateTime(1707, 04, 15),
                localHist: 'Basileia',
                tipoAcontecimento: 0,
                titulo: 'Nascimento de Leonhard Euler',
                referencia: 'https://pt.wikipedia.org/wiki/Leonhard_Euler'),
          );
      this.daoHistoria.salvarDadoHistorico(
        new Historia(
            nomeCientista: 'Leonhard Paul Euler',
            dataHist: DateTime(1783, 09, 18),
            localHist: 'São Petesburgo',
            tipoAcontecimento: 1,
            titulo: 'Morte de Leonhard Euler',
            referencia: 'https://pt.wikipedia.org/wiki/Leonhard_Euler'),
      );
    }
  }

  @action
  carregamentoPagina(bool value) => this.loading = value;

  iniciar(BuildContext contexto) async {
    this.contextoAtual = contexto;
    Future.delayed(Duration(seconds: 3))
        .then((value) => this.carregamentoPagina(false));
    await carregarInfoCientista();
  }

  @action
  Future<List<dynamic>> buscarInfosHome() async {
    List<Historia> listaHistorias = List();
    final List<Map<String, dynamic>> listaEventos =
        await this.daoHistoria.buscaInfoHome();
    listaEventos.forEach((element) {
      listaHistorias.add(Historia.fromMap(element));
    });
    return listaHistorias;
  }
}
