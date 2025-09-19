import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SignupDatabase {
  //*This ensures there’s only one instance of SignupDatabase in the entire app. Re use it By calling SignupDatabase.instance
  static final SignupDatabase instance = SignupDatabase._init();

  //*This is a variable that will hold our database connection once it’s opened.It starts as null, and the first time we request the database, we will initialize it.
  static Database? _database;


  //*This is a private constructor (_init) — meaning no one outside this file can call it directly.
  //* This is part of the Singleton pattern: users can’t do SignupDatabase() — they must use SignupDatabase.instance.
  SignupDatabase._init();


  //*this ensures the database is opened only once and reused everywhere.
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('signup.db');
    return _database!;
  }

  //*getDatabasesPath() → gives you the folder path where Flutter stores databases (differs per platform).
  //* join(dbPath, filePath) → creates the full path, e.g.:
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    // open database
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //* SQL statement to create a table
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        country TEXT NOT NULL,
        dob TEXT NOT NULL
      )
    ''');
  }

  /// Insert user into DB
  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }

  /// Fetch all users (for debugging / testing)
  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }

  /// Check if user already exists
  Future<bool> userExists(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }




  ///Siggnin

  /// Get user by email
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (result.isNotEmpty) {
      return result.first; // return first match
    }
    return null;
  }

  /// Close database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
