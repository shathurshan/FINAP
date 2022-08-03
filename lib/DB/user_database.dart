import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  // database connection
  static Future<sql.Database> databaseConnection() async {
    final databasePath = await sql.getDatabasesPath();

    return await sql.openDatabase(
      path.join(databasePath, 'NewsApp.db'),
      version: 1,
    );
  }

  //crating table
  static Future<void> createTable() async {
    final db = await DBHelper.databaseConnection();
    // db.execute('DROP TABLE users');
    print(db);

    db.execute(
        'CREATE TABLE IF NOT EXISTS users(id TEXT PRIMARY KEY,userId TEXT,email TEXT,password TEXT)');
    print("users table created");
  }

  //add users
  static Future<void> insertUsers(
      String table, Map<String, Object> records) async {
    final db = await DBHelper.databaseConnection();
    print(records);
    db.insert(table, records);
    print("successfully inserted!!!!!!!!!!!!!!!!!");
  }

  // retriving user data from db
  static Future<List<Map<String, dynamic>>> getUserData(String table) async {
    final db = await DBHelper.databaseConnection();
    return db.query(table);
  }
}
