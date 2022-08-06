import 'package:finap_test/widgets/show_snackbar.dart';
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

    db.execute(
        'CREATE TABLE IF NOT EXISTS users(id TEXT PRIMARY KEY,userId TEXT,email TEXT,password TEXT)');
  }

  //add users
  static Future<void> insertUsers(
      String table, Map<String, Object> records) async {
    final db = await DBHelper.databaseConnection();
    db.insert(table, records);
  }

  // retriving user data from db
  static Future<List<Map<String, dynamic>>> getUserData(String table) async {
    final db = await DBHelper.databaseConnection();
    return db.query(table);
  }

  // login
  static Future<void> loginUser(
    String userId,
    String password,
  ) async {
    final db = await DBHelper.databaseConnection();
    var user = await db
        .rawQuery('SELECT id FROM users WHERE userId="$userId"')
        .toString();
    if (user.isEmpty) {
      showSnackbar("No User Available");
    }

    var dbPassword = await db
        .rawQuery('SELECT password FROM users WHERE userId="$userId"')
        .toString();
    if (dbPassword == password) {
      showSnackbar("Login Success");
    } else {
      showSnackbar("please Enter correct login");
    }
  }
}
