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
    "CREATE TABLE cientistas("
    "$cientistaId INT PRIMARY KEY AUTO_INCREMENT,"
    "$primeiroNome TEXT NOT NULL,"
    "$sobrenome TEXT NOT NULL,"
    "$dataNascimento DATE NOT NULL,"
    "$localNascimento TEXT NULL,"
    "$dataMorte DATE NOT NULL,"
    "$localMorte TEXT NULL,"
    "$ocupacao TEXT NULL";

class CientistaDao {

  static final CientistaDao _instance = CientistaDao.internal();

  factory CientistaDao() => _instance;

  CientistaDao.internal();

  Database _db;

  get db {
    if (_db != null) return _db;
    else{
      _db = initDb();
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
    cientista.cientistaId = await dbCientista.insert(tblCientista, cientista.toMap());
    return cientista;
  }

  Future<List> buscaCientista(int id) async {
    Database dbCientista = await db;
    List<Map<String, dynamic>> cientistasList = await dbCientista.query(tblCientista, where: '$cientistaId = ?', whereArgs: [id]);
    return cientistasList;
  }

  deletarCientista(int id) async {
    Database dbCientista = await db;
    return await dbCientista.delete(tblCientista, where: '$cientistaId = ?', whereArgs: [id]);
  }

  Future<List> buscaTodos() async {
    Database dbCientista = await db;
    List<Map<String, dynamic>> cientistasList = await dbCientista.rawQuery("SELECT * FROM $tblCientista");
    return cientistasList;
  }
}