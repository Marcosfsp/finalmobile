import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/anime.dart';

class AnimeDAO {
  static final AnimeDAO instance = AnimeDAO._init();
  static Database? _database;

  AnimeDAO._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('anime.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE anime (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        genero TEXT NOT NULL,
        ano INTEGER NOT NULL,
        assistido INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  // Método para criar um novo anime no banco de dados
  Future<int> create(Anime anime) async {
    final db = await instance.database;
    return await db.insert('anime', anime.toMap());
  }

  // Método para ler todos os animes do banco de dados
  Future<List<Anime>> readAllAnimes() async {
    final db = await instance.database;
    final result = await db.query('anime');

    return result.map((json) => Anime.fromMap(json)).toList();
  }

  // Método para atualizar um anime no banco de dados
  Future<int> update(Anime anime) async {
    final db = await instance.database;
    return await db.update(
      'anime',
      anime.toMap(),
      where: 'id = ?',
      whereArgs: [anime.id],
    );
  }

  // Método para excluir um anime do banco de dados
  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      'anime',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Método para fechar o banco de dados
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
