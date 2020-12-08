import 'package:basileia/dao/daoCientista.dart';
import 'package:basileia/models/cientistaModel.dart';
import 'package:mobx/mobx.dart';

import '../../util.dart';

part 'home.controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final MyAssets assets = MyAssets();
  List<dynamic> listaEventos = List();
  CientistaDao daoCientista = CientistaDao();

  Cientista cientista = Cientista(
    primeiroNome: 'Leonhard',
    sobrenome: 'Paul Euler',
    localNascimento: 'Basileia',
    localMorte: 'São Petersburgo',
    dataNascimento: DateTime.parse('1707-04-15'),
    dataMorte: DateTime.parse('1783-09-18'),
    ocupacao: 'Matemático'
  );

  iniciar () async {
    await daoCientista.salvaCientista(cientista);
    // this.listaEventos.add(await daoCientista.buscaTodos());
  }

  @action
  Future<List<dynamic>> buscarEventos() async {
    return [await daoCientista.buscaCientista()];
  }
}
