class Historia{

  int histId;
  String titulo;
  String descricao;
  DateTime dataHist;
  String localHist;
  int idCientRel;
  int tipoAcontecimento;
  String referencias;

  Historia({
    this.histId,
    this.titulo,
    this.descricao,
    this.dataHist,
    this.localHist,
    this.idCientRel,
    this.tipoAcontecimento,
    this.referencias
  });

  Historia.fromMap(Map<String, dynamic> historia){
    this.histId = historia["histId"];
    this.titulo = historia["titulo"];
    this.descricao = historia["descricao"];
    this.dataHist = DateTime.parse(historia["dataHist"]);
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
      'dataHist' : this.dataHist.toIso8601String(),
      'localHist' : this.localHist,
      'idCientRel' : this.idCientRel,
      'tipoAcontecimento' : this.tipoAcontecimento,
      'referencias' : this.referencias
    };
    return historiaMap;
  }

  toList({bool comId}){
    if (comId != null)
    return [this.histId, this.titulo, this.descricao, this.dataHist, this.localHist, this.idCientRel, this.tipoAcontecimento, this.referencias];
    else
      return [this.titulo, this.descricao, this.dataHist.toIso8601String(), this.localHist, this.idCientRel, this.tipoAcontecimento, this.referencias];
  }

  @override
  String toString() => this.toMap().toString();
}