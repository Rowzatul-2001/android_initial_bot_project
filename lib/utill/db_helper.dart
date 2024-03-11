import 'package:pet_care/utill/rem_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Rem.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  _createDatabase(Database db, int version) async {
    //create database
    await db.execute(
      "CREATE TABLE myrem(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, "
          "desc TEXT NOT NULL,dateandtime TEXT NOT NULL)",
    );
  }

  //inserting data
  Future<RemModel> insert(RemModel remModel) async {
    var dbClint = await db;
    await dbClint?.insert('myrem', remModel.remMap());
    return remModel;
  }

  Future<List<RemModel>> getDatalist() async {
    await db;
    final List<Map<String, Object?>> QueryResult = await _db!.rawQuery(
        'SELECT * FROM myrem');
    return QueryResult.map((e) => RemModel.fromMap(e)).toList();
  }

  Future<int> delete(int id) async{
    var dbClint=await db;
    return await dbClint!.delete('myrem',where: 'id=?',whereArgs: [id]);
  }

  Future<int>update(RemModel remModel) async{
    var dbClint=await db;
    return await dbClint!.update('myrem', remModel.remMap(),where: 'id=?',whereArgs: [remModel.id]);
  }
}