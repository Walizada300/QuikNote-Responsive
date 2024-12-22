import 'package:path/path.dart';
import 'package:quiknote/model/notes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class QuiknoteServices {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    sqfliteFfiInit(); // For desktop or testing purposes only
    databaseFactory = databaseFactoryFfi;
    final path = join(await getDatabasesPath(), 'quiknote.db');
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              content TEXT,
              color TEXT,
              created TEXT,
              isRemoved INTEGER
          );
        ''');
      },
      version: 1,
    );
  }

  Future<List<Map<String, dynamic>>> getAllNotes(
      String tableName, int isRemoved) async {
    final db = await database;
    return await db.query(
      tableName,
      where: 'isRemoved = ?',
      whereArgs: [isRemoved],
      orderBy: 'id desc',
    );
  }

  Future<int> insertData(String tableName, Map<String, dynamic> note) async {
    final db = await database;
    return await db.insert(tableName, note);
  }

  Future<int> updateData(String tableName, Notes note, int id) async {
    final db = await database;
    return await db.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteData(String tableName, int id) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> emptyData(String tableName, int isRemoved) async {
    final db = await database;
    return await db.delete(
      tableName,
      where: 'isRemoved = ?',
      whereArgs: [isRemoved],
    );
  }
}
