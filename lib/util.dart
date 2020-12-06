class MyAssets{
  final String birth = 'assets/icons/stork.png';
  final String war = 'assets/icons/swords.png';
  final String idea = 'assets/icons/lamp.png';
}

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