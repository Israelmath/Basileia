import 'package:basileia/dao/daoCientista.dart';
import 'package:basileia/dao/daoHistoria.dart';
import 'package:basileia/models/cientistaModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../util.dart';

part 'historia.controller.g.dart';

class HistoriaController = HistoriaControllerBase with _$HistoriaController;

abstract class HistoriaControllerBase with Store {
  List<dynamic> listaEventos = List();
  HistDao daoCientista = HistDao();
  TextEditingController tituloController = TextEditingController();
  List<String> paises = ['Brasil', 'Mundo'];
  MyImages images = MyImages();

  iniciar () async {
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
      this.tituloController.text = 'Novo dado hisorico';
    else
      this.titulo = novoTitulo;
  }

  @action
  atualizaPaisEscolhido(String paisEscolhido) {
    print(paisEscolhido);
    if (paisEscolhido == 'Brasil') this.imagem = this.images.brasil;
    else this.imagem = images.mundo;
    this.paisSelecionado = paisEscolhido;
  }

  @action
  atualizaDataEvento(DateTime novaDataEvento) => this.dataEvento = novaDataEvento;
}
