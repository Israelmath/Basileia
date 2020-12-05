import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


enum enumTipoAcontecimento { mundo, local, brasil }

final String histId = 'histId';
final String titulo = 'titulo';
final String descricao = 'descricao';
final String dataHist = 'dataHist';
final String localHist = 'localHist';
final String idCientRel = 'idCientRel';
final String tipoAcontecimento = 'tipoAcontecimento';

final String strCreateComand =
    "CREATE TABLE hists("
    "$histId INT PRIMARY KEY AUTO_INCREMENT,"
    "$titulo TEXT NOT NULL,"
    "$descricao TEXT NOT NULL,"
    "$dataHist TEXT NOT NULL,"
    "$localHist TEXT NULL,"
    "$idCientRel DATE NOT NULL,"
    "$tipoAcontecimento TEXT NULL";

class HistDao {

  static final HistDao _instance = HistDao.internal();

  factory HistDao() => _instance;

  HistDao.internal();

  Database _db;

  get db {
    if (_db != null) return _db;
    else{
      _db = initDb();
    }
  }

  initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'hists.db');

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(strCreateComand);
    });
  }

  Future<Hist> salvaHist(Hist hist) async {
    Database dbHist = await db;
    hist.histId = await dbHist.insert(tblHist, hist.toMap());
    return hist;
  }

  Future<List> buscaHist(int id) async {
    Database dbHist = await db;
    List<Map<String, dynamic>> histsList = await dbHist.query(tblHist, where: '$histId = ?', whereArgs: [id]);
    return histsList;
  }

  deletarHist(int id) async {
    Database dbHist = await db;
    return await dbHist.delete(tblHist, where: '$histId = ?', whereArgs: [id]);
  }

  Future<List> buscaTodos() async {
    Database dbHist = await db;
    List<Map<String, dynamic>> histsList = await dbHist.rawQuery("SELECT * FROM $tblHist");
    return histsList;
  }
}