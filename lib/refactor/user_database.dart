import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class User {
  final int? id;
  final String name;
  final int age;
  final String email;
  final String country;

  User({
    this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.country,
  });

  User.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        age = res['age'],
        email = res['email'],
        country = res['country'];
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'country': country
    };
  }
}

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'sqlite_tutorial.db'),
      onCreate: (Database db, int version) {
        db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER NOT NULL, email TEXT NOT NULL, country TEXT NOT NULL )');
      },
      version: 1,
    );
  }

  //Save data into sqlite
  Future<int> insertUser(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert('users', user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  //Retrieve data from sqlite
  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('users');
    if (kDebugMode) {
      print(queryResult);
    }
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

  // Update data of database
  Future<int> updateUsers(
      int id, String name, String email, int age, String country) async {
    final Database db = await initializeDB();
    final data = {
      'name': name,
      'age': age,
      'email': email,
      'country': country,
    };
    final int updatedRow = await db.update(
      'user',
      data,
      where: 'id=?',
      whereArgs: [id],
    );
    return updatedRow;
  }

  //Delete user data from database
  Future<void> deleteUser(int id) async {
    final Database db = await initializeDB();
    await db.delete('users', where: 'id=?', whereArgs: [id]);
  }
}
