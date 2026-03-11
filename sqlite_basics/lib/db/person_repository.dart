import 'package:sqlite_basics_2/db/database_helper.dart';

class PersonRepository {
  static final database = DatabaseHelper.instance.database;

  static Future<void> addPerson(Map<String, dynamic> person) async {
    final db = await database;

    await db.insert("person", person);
  }

  static Future<List<Map<String, dynamic>>> getAllPerson() async {
    final db = await database;

    return await db.query("person");
  }
}