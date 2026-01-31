import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/user.dart';

// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._internal();

//   DatabaseHelper._internal();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'user.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate
//     ); 
//   }

//    Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE user(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         email TEXT,
//         password TEXT
//       )
//     ''');
//   }

//   Future<int> insertUser(Map<String, dynamic> user) async {
//     final db = await database;
//     return await db.insert("user", user);
//   }

//   Future<List<Map<String, dynamic>>> getUsers() async {
//     final db = await database;
//     return await db.query("user");
//   }

//   Future<int> updateUser(int id, Map<String, dynamic> user) async {
//     final db = await database;
//     return await db.update("user", user, where: "id = ?", whereArgs: [id]);
//   }

//   Future<int> deleteUser(int id) async {
//     final db = await database;
//     return await db.delete("user", where: "id = ?", whereArgs: [id]);
//   }
// }


























class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    
    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "user.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    db.execute('''
      CREATE TABLE user (
        id PRIMARY KEY AUTO_INCREMENT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;

    db.insert("user", user);
  }

  Future<List<Map<String, dynamic>>> getAllUser() async {
    final db = await database;

    return await db.query("user");
  }

  Future<User?> getUser(int id) async {
    final db = await database;

    final user = await db.query(
                "user", 
                where: "id = ?", 
                whereArgs: [id]);

    if (user.isNotEmpty) {
      return User.fromMapToObject(user.first);
    }

    return User(
      id: 0, 
      email: "", 
      password: "");
  }

  Future<void> updateUser(int id, Map<String, dynamic> user) async {
    final db = await database;

    db.update(
      "user",
      user,
      where: "id = ?",
      whereArgs: [id]
    );
  }

  Future<void> deleteUser(int id) async {
    final db = await database;

    db.delete(
      "user",
      where: "id = ?",
      whereArgs: [id]
    );
  }
}