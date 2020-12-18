import 'dart:convert';

Map<int, String> myAssets = {
    0 : 'assets/icons/stork.png',
    1 : 'assets/icons/grave.png',
    2 : 'assets/icons/swords.png',
    3 : 'assets/icons/lamp.png'
};

String traduzMes(int mes){

  Map<int, String> meses = {
    1 : 'janeiro',
    2 : 'fevereiro',
    3 : 'março',
    4 : 'abril',
    5 : 'maio',
    6 : 'junho',
    7 : 'julho',
    8 : 'agosto',
    9 : 'setembro',
    10 : 'outubro',
    11 : 'novembro',
    12 : 'dezembro'
  };
  return meses[mes];
}

class MyImages{
  final String mundo = 'assets/images/Mundo.jpg';
  final String brasil = 'assets/images/Brasil.png';
}

Map<dynamic, dynamic> tipoEventoMap = {
  0 : 'nascimento',
  1 : 'morte',
  2 : 'conflito',
  3 : 'descoberta'
};

void prettyPrintString(String input) {
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}

void prettyPrintJson(Map<String, dynamic> object) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}

String formataDataHome(DateTime dataHistoria)=> '${dataHistoria.day} de ${traduzMes(dataHistoria.month)} de ${dataHistoria.year}';

String capitalize(String str) => str[0].toUpperCase()+str.substring(1);