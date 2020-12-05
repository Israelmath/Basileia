class Cientista{

  int cientistaId;
  String primeiroNome;
  String sobrenome;
  DateTime dataNascimento;
  String localNascimento;
  DateTime dataMorte;
  String localMorte;
  String ocupacao;

  Cientista.fromMap(Map<String, dynamic> cientista){
    this.cientistaId = cientista["cientistaId"];
    this.primeiroNome = cientista["primeiroNome"];
    this.sobrenome = cientista["sobrenome"];
    this.dataNascimento = cientista["dataNascimento"];
    this.localNascimento = cientista["localNascimento"];
    this.dataMorte = cientista["dataMorte"];
    this.localMorte = cientista["localMorte"];
    this.ocupacao = cientista["ocupacao"];
  }

  toMap(){
    Map<String, dynamic> cientistaMap = {
    'cientistaId' : this.cientistaId,
    'primeiroNome' : this.primeiroNome,
    'sobrenome' : this.sobrenome,
    'dataNascimento' : this.dataNascimento,
    'localNascimento' : this.localNascimento,
    'dataMorte' : this.dataMorte,
    'localMorte' : this.localMorte,
    'ocupacao' : this.ocupacao
    };
    return cientistaMap;
  }

  @override
  String toString() => this.toMap().toString();
}