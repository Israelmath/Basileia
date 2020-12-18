// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$visibilidadeAtom = Atom(name: 'HomeControllerBase.visibilidade');

  @override
  double get visibilidade {
    _$visibilidadeAtom.reportRead();
    return super.visibilidade;
  }

  @override
  set visibilidade(double value) {
    _$visibilidadeAtom.reportWrite(value, super.visibilidade, () {
      super.visibilidade = value;
    });
  }

  final _$loadingAtom = Atom(name: 'HomeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$cientistaAtom = Atom(name: 'HomeControllerBase.cientista');

  @override
  Historia get cientista {
    _$cientistaAtom.reportRead();
    return super.cientista;
  }

  @override
  set cientista(Historia value) {
    _$cientistaAtom.reportWrite(value, super.cientista, () {
      super.cientista = value;
    });
  }

  final _$carregarInfoCientistaAsyncAction =
      AsyncAction('HomeControllerBase.carregarInfoCientista');

  @override
  Future carregarInfoCientista() {
    return _$carregarInfoCientistaAsyncAction
        .run(() => super.carregarInfoCientista());
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  dynamic atualizaVisibilidade(double value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.atualizaVisibilidade');
    try {
      return super.atualizaVisibilidade(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic carregamentoPagina(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.carregamentoPagina');
    try {
      return super.carregamentoPagina(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visibilidade: ${visibilidade},
loading: ${loading},
cientista: ${cientista}
    ''';
  }
}
