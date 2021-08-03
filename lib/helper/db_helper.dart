import 'dart:io';

import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/models/product.dart';
import 'package:flutter_application_4/models/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  static final String databaseName = 'ecommerceDb.db';
  static final String productTableName = 'products';
  static final String productIdColumnName = 'id';
  static final String productNameColumnName = 'name';
  static final String productCategoryIdColumnName = 'catId';
  static final String categoryTableName = 'categories';
  static final String categoryIdColumnName = 'categoryId';
  static final String categoryNameColumnName = 'name';

  String todoTable = 'todo_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colDate = 'date';
  String colStatus = 'status';

  Database database;
  initDatabase() async {}
  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + databaseName;
    Database database = await openDatabase(
      path,
      version: 1,
      onOpen: (database) {
        print('the database has been opened');
      },
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (db, v) async {
        print('the database has been created');
        await db.execute(
            '(CREATE TABLE $productTableName (id INTEGER PRIMARY KEY AUTOINCREMENT, categoryNameColumnName TEXT, '
            'productCategoryIdColumnName INTEGER,  FOREIGN KEY productCategoryIdColumnName REFERENCES categoryTableName ( categoryIdColumnName) ON DELETE CASCADE,  ))');

        // await db.execute(
        //     'CREATE TABLE $productTableName($productIdColumnName INTEGER PRIMARY KEY, $categoryNameColumnName TEXT, $productCategoryIdColumnName INTEGER, FOREIGN KEY $productCategoryIdColumnName REFERENCES $categoryTableName ($categoryIdColumnName) ON DELETE CASCADE)');

        await db.execute(
            'CREATE TABLE $categoryTableName($categoryIdColumnName INTEGER PRIMARY KEY, $categoryNameColumnName TEXT)');
      },
    );
    // onUpgrade: (database, old, oldv) {
    //   database.execute(
    //       '''CREATE TABLE Tasks (id INTEGER PRIMARY KEY AUTOIN, title TEXT, details TEXT)''');
    // }
    return database;
  }

  insertCategory(Category category) async {
    int rowNum = await database.insert(categoryTableName, category.toMap());
    print(rowNum);
  }

  insertProduct(Product product) async {
    int rowNum = await database.insert(productTableName, product.toMap());
    print(rowNum);
  }

  Future<List<Category>> getAllCategories() async {
    List<Map<String, Object>> results = await database.query(categoryTableName);
    List<Category> categories = results.map((e) {
      return Category.fromMap(e);
    }).toList();
    return categories;
  }

  Future<List<Product>> getAllProducts() async {
    List<Map<String, Object>> results = await database.query(productTableName);
    List<Product> products = results.map((e) {
      return Product.fromMap(e);
    }).toList();
    return products;
  }

  Future<Category> getSpecificCategory(int id) async {
    List<Map<String, dynamic>> results =
        await database.query(categoryTableName, where: 'id=?', whereArgs: [id]);
    Category category = Category.fromMap(results.first);
  }

  Future<Product> getSpecificProduct(int id) async {
    List<Map<String, dynamic>> results =
        await database.query(productTableName, where: 'id=?', whereArgs: [id]);
    Product product = Product.fromMap(results.first);
  }

  deleteCategory(int id) async {
    database.delete(categoryTableName, where: 'id=?', whereArgs: [id]);
  }

  deleteProduct(int id) async {
    database.delete(productTableName, where: 'id=?', whereArgs: [id]);
  }

  // updateTask(TaskModel taskModel) async {
  //   database.update(tableName, taskModel.toMap(), whereArgs: [taskModel.id]);
  // }
  getTablesNames() async {
    List<Map<String, Object>> tables = await database
        .query('sqlite_master', where: 'type=?', whereArgs: ['table']);
    List<String> tablesNames = tables.map((e) => e['name'].toString()).toList();
    print(tablesNames);
  }
}
