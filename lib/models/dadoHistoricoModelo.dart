class Historia{

  int histId;
  String titulo;
  String descricao;
  DateTime dataHist;
  String localHist;
  DateTime idCientRel;
  int tipoAcontecimento;
  String referencias;

  Historia.fromMap(Map<String, dynamic> historia){
    this.histId = historia["histId"];
    this.titulo = historia["titulo"];
    this.descricao = historia["descricao"];
    this.dataHist = historia["dataHist"];
    this.localHist = historia["localHist"];
    this.idCientRel = historia["idCientRel"];
    this.tipoAcontecimento = historia["tipoAcontecimento"];
    this.referencias = historia["referencias"];
  }

  toMap(){
    Map<String, dynamic> historiaMap = {
      'histId' : this.histId,
      'titulo' : this.titulo,
      'descricao' : this.descricao,
      'dataHist' : this.dataHist,
      'localHist' : this.localHist,
      'idCientRel' : this.idCientRel,
      'tipoAcontecimento' : this.tipoAcontecimento,
      'referencias' : this.referencias
    };
    return historiaMap;
  }

  @override
  String toString() => this.toMap().toString();
}