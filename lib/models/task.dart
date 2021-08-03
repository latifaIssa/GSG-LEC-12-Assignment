import 'package:flutter_application_4/helper/db_helper.dart';

class TaskModel {
  int id;
  String name;
  bool isComplete;

  TaskModel({this.id, this.name, this.isComplete});

  TaskModel.fromMap(Map map) {}

  toMap() {
    // return {
    //   DbHelper.nameColumnName: this.name,
    //   DbHelper.isCompletedColumnName: this.isComplete ? 1 : 0
    // };
  }
}
