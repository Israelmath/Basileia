import 'package:basileia/dao/daoHistoria.dart';
import 'package:basileia/models/dadoHistoricoModelo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../util.dart';

part 'historia.controller.g.dart';

class HistoriaController = HistoriaControllerBase with _$HistoriaController;

abstract class HistoriaControllerBase with Store {
  List<dynamic> listaEventos = List();
  HistDao daoHistoria = HistDao();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController referenciaController = TextEditingController();
  List<String> paises = ['Brasil', 'Mundo'];
  List<String> tipoEvento = ['nascimento', 'morte', 'conflito', 'descoberta'];
  MyImages images = MyImages();
  Historia dadoHistorico;

  iniciar() async {
    // this.dadoHistorico = Historia(
    //     titulo: 'Big Bang',
    //     descricao: 'Começo do mundo',
    //     dataHist: DateTime.now(),
    //     localHist: 'Mundo',
    //     tipoAcontecimento: 1,
    //     referencias: 'Ciência');
    // await this.daoHistoria.salvarDadoHistorico(this.dadoHistorico);
    // await this.daoHistoria.salvarDadoHistorico(Historia(
    //   nomeCientista: 'Leonhard Euler',
    //   dataHist: DateTime.now(),
    //   localHist: 'Basileia',
    //   tipoAcontecimento: 0,
    //   descricao: 'O maior matemático',
    //   referencias: 'www.internet.com'
    // ));
  }

  @observable
  DateTime dataEvento = DateTime.now();

  @observable
  String imagem = MyImages().mundo;

  @observable
  String paisSelecionado = 'Mundo';

  @observable
  String tipoSelecionado = 'nascimento';

  @observable
  String titulo = 'Novo dado histórico';

  @action
  atualizaTituloEvento(String novoTitulo) {
    if (this.tituloController.text == '')
      this.titulo = 'Novo dado histórico';
    else
      this.titulo = novoTitulo;
  }

  @action
  atualizaTipo(String tipoEscolhido) => this.tipoSelecionado = tipoEscolhido;

  @action
  atualizaPaisEscolhido(String paisEscolhido) {
    if (paisEscolhido == 'Brasil')
      this.imagem = this.images.brasil;
    else
      this.imagem = images.mundo;
    this.paisSelecionado = paisEscolhido;
  }

  @action
  atualizaDataEvento(DateTime novaDataEvento) => this.dataEvento = novaDataEvento;

  processaSalvamento(){
    dadoHistorico = new Historia();
    if (this.tipoSelecionado == 'nascimento' || this.tipoSelecionado == 'morte')
      dadoHistorico.nomeCientista = this.tituloController.text;
    else
      dadoHistorico.titulo = this.tituloController.text;

    dadoHistorico.localHist = this.paisSelecionado;
    dadoHistorico.dataHist = this.dataEvento;
    dadoHistorico.tipoAcontecimento = tipoEventoMap.keys.firstWhere((key) => tipoEventoMap[key] == this.tipoSelecionado, orElse: () => 3);
    dadoHistorico.descricao = this.descricaoController.text;
    dadoHistorico.referencia = this.referenciaController.text;
  }

  salvaDadoHistorico() => daoHistoria.salvarDadoHistorico(this.dadoHistorico);

  limpaCampos(){
    this.tituloController.clear();
    this.referenciaController.clear();
    this.descricaoController.clear();
    this.paisSelecionado = 'Mundo';
    this.tipoSelecionado = tipoEventoMap[0];
  }
}
