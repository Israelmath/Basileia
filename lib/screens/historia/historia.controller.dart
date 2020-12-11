import 'package:basileia/dao/daoCientista.dart';
import 'package:basileia/dao/daoHistoria.dart';
import 'package:basileia/models/cientistaModel.dart';
import 'package:basileia/models/dadoHistoricoModelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../util.dart';

part 'historia.controller.g.dart';

class HistoriaController = HistoriaControllerBase with _$HistoriaController;

abstract class HistoriaControllerBase with Store {
  List<dynamic> listaEventos = List();
  CientistaDao daoCientista = CientistaDao();
  List<Cientista> listaCientistas = List();
  HistDao daoHistoria = HistDao();
  TextEditingController tituloController = TextEditingController();
  List<String> paises = ['Brasil', 'Mundo'];
  MyImages images = MyImages();
  Historia dadoHistorico;

  iniciar() async {
    Cientista cientista = Cientista(
        primeiroNome: 'Carl',
        sobrenome: 'Friedrich Gauss',
        localNascimento: 'Alemanha',
        localMorte: 'Alemanha',
        dataNascimento: DateTime.parse('1707-04-15'),
        dataMorte: DateTime.parse('1783-09-18'),
        ocupacao: 'Físico');
    this.dadoHistorico = Historia(
        titulo: 'Big Bang',
        descricao: 'Começo do mundo',
        dataHist: DateTime.now(),
        localHist: 'Mundo',
        tipoAcontecimento: 1,
        referencias: 'Ciência');
    // this.daoHistoria.salvaHist(this.dadoHistorico);
    print(await this.daoHistoria.buscaTodos());
    // await daoCientista.salvaCientista(cientista);
    // this.listaCientistas = await daoCientista.buscaTodos();
    // print('this.listaCientistas: ${this.listaCientistas}');
  }

  @observable
  DateTime dataEvento = DateTime.now();

  @observable
  String imagem = MyImages().mundo;

  @observable
  String paisSelecionado = 'Mundo';

  @observable
  String titulo = 'Novo dado hisorico';

  @action
  atualizaTituloEvento(String novoTitulo) {
    if (this.tituloController.text == '')
      this.tituloController.text = 'Novo dado histórico';
    else
      this.titulo = novoTitulo;
  }

  @action
  atualizaPaisEscolhido(String paisEscolhido) {
    if (paisEscolhido == 'Brasil')
      this.imagem = this.images.brasil;
    else
      this.imagem = images.mundo;
    this.paisSelecionado = paisEscolhido;
  }

  @action
  atualizaDataEvento(DateTime novaDataEvento) =>
      this.dataEvento = novaDataEvento;
}
