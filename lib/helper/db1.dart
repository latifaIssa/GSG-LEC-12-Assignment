import 'dart:io';

import 'package:flutter_application_4/models/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  static final String databaseName = 'taskDb.db';
  static final String tableName = 'Tasks';
  static final String idColumnName = 'id';
  static final String nameColumnName = 'name';
  static final String isCompletedColumnName = 'isCompleted';

  Database database;
  initDatabase() async {}
  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$databaseName';
    Database database =
        await openDatabase(path, version: 1, onOpen: (database) {
      print('the database has been opened');
    }, onCreate: (db, v) {
      print('the database has been created');
      db.execute(
          '''CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOIN, title TEXT, details TEXT)''');
    }, onUpgrade: (database, old, oldv) {
      database.execute(
          '''CREATE TABLE Tasks (id INTEGER PRIMARY KEY AUTOIN, title TEXT, details TEXT)''');
    });
    return database;
  }

  insertTask(TaskModel taskModel) async {
    // database.rawInsert(sql);
    int rowNum = await database.insert(tableName, taskModel.toMap());
    // print(Sqflite.firstIntValue(
    //     await database.rawQuery('SELECT COUNT(*) FROM $tableName')));
    print(rowNum);
  }

  Future<List<TaskModel>> getAllTask() async {
    List<Map<String, Object>> results = await database.query(tableName);
    List<TaskModel> tasks = results.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
    return tasks;
  }

  Future<TaskModel> getSpecificTask(int id) async {
    List<Map<String, dynamic>> results =
        await database.query(tableName, where: 'id=?', whereArgs: [id]);
    TaskModel taskModel = TaskModel.fromMap(results.first);
  }

  deleteTask(int id) async {
    database.delete(tableName, where: 'id=?', whereArgs: [id]);
  }

  updateTask(TaskModel taskModel) async {
    database.update(tableName, taskModel.toMap(), whereArgs: [taskModel.id]);
  }
}
