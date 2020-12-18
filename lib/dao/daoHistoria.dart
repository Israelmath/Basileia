import 'package:basileia/models/dadoHistoricoModelo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../util.dart';

final String dadoId = 'dadoId';
final String titulo = 'titulo';
final String nomeCientista = 'nomeCientista';
final String dataHist = 'dataHist';
final String localHist = 'localHist';
final String tipoAcontecimento = 'tipoAcontecimento';
final String descricao = 'descricao';
final String referencia = 'referencia';
final String tblHistoria = 'dadosHistoricos';

final String strCreateComand =
    "CREATE TABLE dadosHistoricos("
    "$dadoId INTEGER PRIMARY KEY AUTOINCREMENT,"
    "$titulo TEXT NULL,"
    "$nomeCientista TEXT NULL,"
    "$dataHist TEXT NULL,"
    "$localHist TEXT NULL,"
    "$tipoAcontecimento INT NULL,"
    "$descricao TEXT NULL,"
    "$referencia TEXT NULL)";

class HistDao {

  static final HistDao _instance = HistDao.internal();

  factory HistDao() => _instance;

  HistDao.internal();

  Database _db;

  get db async {
    if (_db != null) return _db;
    else{
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, '$tblHistoria.db');

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(strCreateComand);
    }, onDowngrade: onDatabaseDowngradeDelete);
  }

  Future<Historia> salvarDadoHistorico (Historia hist) async {
    Database dbHist = await db;
    String comandoInsert;

    if (hist.tipoAcontecimento == 0 || hist.tipoAcontecimento == 1) {
      comandoInsert = "INSERT INTO $tblHistoria"
          "($nomeCientista, $dataHist, "
          "$localHist, $tipoAcontecimento, "
          "$titulo, $referencia) "
          "VALUES "
          "('${hist.nomeCientista}', '${hist.dataHist.toIso8601String()}', "
          "'${hist.localHist}', ${hist.tipoAcontecimento}, "
          "'${hist.titulo}', '${hist.referencia}')";
    }
    else {
      comandoInsert = "INSERT INTO $tblHistoria"
          "($titulo, $dataHist, "
          "$localHist, $tipoAcontecimento, "
          "$descricao, $referencia) "
          "VALUES "
          "('${hist.titulo}', '${hist.dataHist.toIso8601String()}', "
          "'${hist.localHist}', ${hist.tipoAcontecimento}, "
          "'${hist.descricao}', '${hist.referencia}')";
    }

    print(comandoInsert);
    hist.dadoId = await dbHist.rawInsert(comandoInsert);
    return hist;
  }

  Future<List> buscaHist(int id) async {
    Database dbHist = await db;
    List<Map<String, dynamic>> histsList = await dbHist.query(tblHistoria, where: '$dadoId = ?', whereArgs: [id]);
    return histsList;
  }

  deletarHist(int id) async {
    Database dbHist = await db;
    return await dbHist.delete(tblHistoria, where: '$dadoId = ?', whereArgs: [id]);
  }

  buscaCientista(int id) async {
    Database dbHist = await db;
    String comandoBusca = 'SELECT * FROM $tblHistoria WHERE $dadoId = $id';

    List<Map<String, dynamic>> cientista = await dbHist.rawQuery(comandoBusca);
    if (cientista.isEmpty) return new Historia();
    else return Historia.fromMap(cientista[0]);
  }

  Future<List> buscaTodos() async {
    Database dbHist = await db;
    List<Map<String, dynamic>> histsList = await dbHist.rawQuery("SELECT * FROM $tblHistoria");
    return histsList;
  }

  Future<List<Map<String, dynamic>>> buscaInfoHome() async {
    Database dbHist = await db;
    List<Map<String, dynamic>> eventosHome = List();

    String comandoBusca = 'SELECT * FROM dadosHistoricos '
        '                     WHERE nomeCientista IS NOT NULL '
        '                         AND tipoAcontecimento = 0 ';

    List<Map<String, dynamic>> cientista = await dbHist.rawQuery(comandoBusca);
    cientista.forEach((element) {
      eventosHome.add(element);
    });

    comandoBusca = ' SELECT * FROM dadosHistoricos '
        '              WHERE nomeCientista IS NULL ';

    cientista = await dbHist.rawQuery(comandoBusca);
    cientista.forEach((element) {
      eventosHome.add(element);
    });

    comandoBusca = 'SELECT * FROM dadosHistoricos '
        '            WHERE nomeCientista IS NOT NULL '
        '             AND tipoAcontecimento = 1 ';

    cientista = await dbHist.rawQuery(comandoBusca);
    cientista.forEach((element) {
      eventosHome.add(element);
    });

    return eventosHome;
  }
}