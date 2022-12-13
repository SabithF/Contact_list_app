import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../models/AddUser.dart';

class DbConnect {
  Future<Database> setDatabase() async {
    // getting saved folder dirtectory
    var directory = await getApplicationDocumentsDirectory();
    // creating contact_db in the directory which the db is saved
    var path = join(directory.path, 'contact_db');
    // creating instance
    var database = await openDatabase(path, version: 1, onCreate: _createNewDb);
    return database;
  }

  // creating the DB
// 'database' db name
  Future<void> _createNewDb(Database database, int version) async {
    String sql =
        "CREATE TABLE users (id INTEGER PRIMARY KEY, fname TEXT, lname TEXT, contact TEXT);";
    await database.execute(sql);
  }


}