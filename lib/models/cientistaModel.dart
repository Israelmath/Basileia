class Cientista {
  int cientistaId;
  String primeiroNome;
  String sobrenome;
  DateTime dataNascimento;
  String localNascimento;
  DateTime dataMorte;
  String localMorte;
  String ocupacao;

  Cientista(
      {this.cientistaId,
      this.primeiroNome,
      this.sobrenome,
      this.dataNascimento,
      this.localNascimento,
      this.dataMorte,
      this.localMorte,
      this.ocupacao});

  Cientista.fromMap(Map<String, dynamic> cientista) {
    this.cientistaId = cientista["cientistaId"];
    this.primeiroNome = cientista["primeiroNome"];
    this.sobrenome = cientista["sobrenome"];
    this.dataNascimento = DateTime.parse(cientista["dataNascimento"]);
    this.localNascimento = cientista["localNascimento"];
    this.dataMorte = DateTime.parse(cientista["dataMorte"]);
    this.localMorte = cientista["localMorte"];
    this.ocupacao = cientista["ocupacao"];
  }

  toMap() {
    Map<String, dynamic> cientistaMap = {
      'cientistaId': this.cientistaId,
      'primeiroNome': this.primeiroNome,
      'sobrenome': this.sobrenome,
      'dataNascimento': this.dataNascimento,
      'localNascimento': this.localNascimento,
      'dataMorte': this.dataMorte,
      'localMorte': this.localMorte,
      'ocupacao': this.ocupacao
    };
    return cientistaMap;
  }

  toList({bool id}){
    if (id == null)
      return [this.primeiroNome, this.sobrenome, this.dataNascimento.toIso8601String(), this.localNascimento, this.dataMorte.toIso8601String(), this.localMorte, this.ocupacao];
    else
      return [this.cientistaId, this.primeiroNome, this.sobrenome, this.dataNascimento, this.localNascimento, this.dataMorte, this.localMorte, this.ocupacao];
  }

  @override
  String toString() => this.toMap().toString();
}
