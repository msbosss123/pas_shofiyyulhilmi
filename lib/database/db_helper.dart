import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../menus/anime/football_Model.dart';  // Import model anime

class animes {
  final int id;
  final String title;
  final String type;
  final String imageUrl;

  animes({
    required this.id,
    required this.title,
    required this.type,
    required this.imageUrl,
  });

  factory animes.fromJson(Map<String, dynamic> json) {
    return animes(
      id: json['mal_id'],
      title: json['title'],
      type: json['type'],
      imageUrl: json['images']['jpg']['image_url'],
    );
  }
  Map<String, dynamic> toMap() {
  return {
    'id': id,
    'title': title,
    'type': type,
    'imageUrl': imageUrl,
  };
}
}







class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('anime.db');  // Ubah nama database
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
    const animeTable = '''
      CREATE TABLE favorites (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        type TEXT NOT NULL,
        imageUrl TEXT NOT NULL
      )
    ''';  // Sesuaikan dengan field di PostModel

    await db.execute(animeTable);
  }

  Future<void> addFavorite(PostModel anime) async {
    final db = await instance.database;
    await db.insert('favorites', {
      'id': anime.id,
      'title': anime.title,
      'type': anime.type,
      'imageUrl': anime.imageUrl,
    });
  }

  Future<List<PostModel>> getFavorites() async {
    final db = await instance.database;
    final result = await db.query('favorites');
    return result.map((map) => PostModel(
      id: map['id'] as int,
      title: map['title'] as String,
      type: map['type'] as String,
      imageUrl: map['imageUrl'] as String,
    )).toList();
  }

  Future<void> removeFavorite(int id) async {
    final db = await instance.database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> checkFavorite(int id) async {  // Ubah parameter menjadi id
    final db = await instance.database;
    final maps = await db.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return maps.isNotEmpty;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}