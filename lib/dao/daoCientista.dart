import 'dart:convert';

import 'package:basileia/models/cientistaModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


final String cientistaId = "cientistaId";
final String primeiroNome = "primeiroNome";
final String sobrenome = 'sobrenome';
final String dataNascimento = 'dataNascimento';
final String localNascimento = 'localNascimento';
final String dataMorte = 'dataMorte';
final String localMorte = 'localMorte';
final String ocupacao = 'ocupacao';
final String tblCientista = 'cientistas';

final String strCreateComand =
    "CREATE TABLE $tblCientista("
    "$cientistaId INTEGER PRIMARY KEY AUTOINCREMENT,"
    "$primeiroNome TEXT NOT NULL,"
    "$sobrenome TEXT NOT NULL,"
    "$dataNascimento TEXT NOT NULL,"
    "$localNascimento TEXT NULL,"
    "$dataMorte TEXT NOT NULL,"
    "$localMorte TEXT NULL,"
    "$ocupacao TEXT NULL)";

class CientistaDao {

  static final CientistaDao _instance = CientistaDao.internal();

  factory CientistaDao() => _instance;

  CientistaDao.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    else{
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'cientistas.db');
    
    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(strCreateComand);
    });
  }

  Future<Cientista> salvaCientista(Cientista cientista) async {
    Database dbCientista = await db;

    String strComandoInsert = "INSERT INTO $tblCientista "
        "($primeiroNome, $sobrenome, $dataNascimento, $localNascimento, $dataMorte, $localMorte, $ocupacao) "
        "VALUES "
        "(?, ?, ?, ?, ?, ?, ?)";

    cientista.cientistaId = await dbCientista.rawInsert(strComandoInsert, cientista.toList());
    return cientista;
  }

  Future<List> buscaCientista({int id}) async {
    Database dbCientista = await db;
    String comando;

    if (id == null)
      comando = 'SELECT * FROM cientistas LIMIT 1';
    else
      comando = 'SELECT * FROM cientistas WHERE $cientistaId = $id';

    List<Map<String, dynamic>> cientistasList = await dbCientista.rawQuery(comando);

    return cientistasList;
  }

  deletarCientista(int id) async {
    Database dbCientista = await db;
    return await dbCientista.delete(tblCientista, where: '$cientistaId = ?', whereArgs: [id]);
  }

  Future<List<Cientista>> buscaTodos() async {
    Database dbCientista = await db;
    List<Map<String, dynamic>> cientistasMaps = await dbCientista.rawQuery("SELECT * FROM $tblCientista");

    List <Cientista> listCientistasModel = List();
    cientistasMaps.forEach((element) {
      listCientistasModel.add(Cientista.fromMap(element));
    });

    return listCientistasModel;
  }
}