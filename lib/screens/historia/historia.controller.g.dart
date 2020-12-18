// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historia.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoriaController on HistoriaControllerBase, Store {
  final _$dataEventoAtom = Atom(name: 'HistoriaControllerBase.dataEvento');

  @override
  DateTime get dataEvento {
    _$dataEventoAtom.reportRead();
    return super.dataEvento;
  }

  @override
  set dataEvento(DateTime value) {
    _$dataEventoAtom.reportWrite(value, super.dataEvento, () {
      super.dataEvento = value;
    });
  }

  final _$imagemAtom = Atom(name: 'HistoriaControllerBase.imagem');

  @override
  String get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(String value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  final _$paisSelecionadoAtom =
      Atom(name: 'HistoriaControllerBase.paisSelecionado');

  @override
  String get paisSelecionado {
    _$paisSelecionadoAtom.reportRead();
    return super.paisSelecionado;
  }

  @override
  set paisSelecionado(String value) {
    _$paisSelecionadoAtom.reportWrite(value, super.paisSelecionado, () {
      super.paisSelecionado = value;
    });
  }

  final _$tipoSelecionadoAtom =
      Atom(name: 'HistoriaControllerBase.tipoSelecionado');

  @override
  String get tipoSelecionado {
    _$tipoSelecionadoAtom.reportRead();
    return super.tipoSelecionado;
  }

  @override
  set tipoSelecionado(String value) {
    _$tipoSelecionadoAtom.reportWrite(value, super.tipoSelecionado, () {
      super.tipoSelecionado = value;
    });
  }

  final _$tituloAtom = Atom(name: 'HistoriaControllerBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$HistoriaControllerBaseActionController =
      ActionController(name: 'HistoriaControllerBase');

  @override
  dynamic atualizaTituloEvento(String novoTitulo) {
    final _$actionInfo = _$HistoriaControllerBaseActionController.startAction(
        name: 'HistoriaControllerBase.atualizaTituloEvento');
    try {
      return super.atualizaTituloEvento(novoTitulo);
    } finally {
      _$HistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaTipo(String tipoEscolhido) {
    final _$actionInfo = _$HistoriaControllerBaseActionController.startAction(
        name: 'HistoriaControllerBase.atualizaTipo');
    try {
      return super.atualizaTipo(tipoEscolhido);
    } finally {
      _$HistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaPaisEscolhido(String paisEscolhido) {
    final _$actionInfo = _$HistoriaControllerBaseActionController.startAction(
        name: 'HistoriaControllerBase.atualizaPaisEscolhido');
    try {
      return super.atualizaPaisEscolhido(paisEscolhido);
    } finally {
      _$HistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaDataEvento(DateTime novaDataEvento) {
    final _$actionInfo = _$HistoriaControllerBaseActionController.startAction(
        name: 'HistoriaControllerBase.atualizaDataEvento');
    try {
      return super.atualizaDataEvento(novaDataEvento);
    } finally {
      _$HistoriaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataEvento: ${dataEvento},
imagem: ${imagem},
paisSelecionado: ${paisSelecionado},
tipoSelecionado: ${tipoSelecionado},
titulo: ${titulo}
    ''';
  }
}
