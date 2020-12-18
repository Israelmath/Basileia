class Historia{

  int dadoId;
  String titulo;
  String nomeCientista;
  DateTime dataHist;
  String localHist;
  int tipoAcontecimento;
  String descricao;
  String referencia;

  Historia({
    this.dadoId,
    this.titulo,
    this.nomeCientista,
    this.dataHist,
    this.localHist,
    this.tipoAcontecimento,
    this.descricao,
    this.referencia
  });

  Historia.fromMap(Map<String, dynamic> historia){
    this.dadoId = historia["dadoId"];
    this.titulo = historia["titulo"];
    this.nomeCientista = historia["nomeCientista"];
    this.dataHist = DateTime.parse(historia["dataHist"]);
    this.localHist = historia["localHist"];
    this.tipoAcontecimento = historia["tipoAcontecimento"];
    this.descricao = historia["descricao"];
    this.referencia = historia["referencia"];
  }

  toMap(){
    Map<String, dynamic> historiaMap = {
      'dadoId' : this.dadoId,
      'titulo' : this.titulo,
      'nomeCientista' : this.nomeCientista,
      'dataHist' : this.dataHist.toIso8601String(),
      'localHist' : this.localHist,
      'tipoAcontecimento' : this.tipoAcontecimento,
      'descricao' : this.descricao,
      'referencia' : this.referencia
    };
    return historiaMap;
  }

  toList({bool comId}){
    if (comId != null)
    return [this.dadoId, this.titulo, this.nomeCientista, this.dataHist, this.localHist, this.tipoAcontecimento, this.descricao, this.referencia];
    else
      return [this.titulo, this.nomeCientista, this.dataHist.toIso8601String(), this.localHist, this.tipoAcontecimento, this.descricao, this.referencia];
  }

  @override
  String toString() => this.toMap().toString();
}