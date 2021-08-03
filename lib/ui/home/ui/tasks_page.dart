import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/helper/db_helper.dart';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/models/task.dart';

class TaskPage extends StatelessWidget {
  // const TaskPage({ Key? key }) : super(key: key);
  TaskModel taskModel1 = TaskModel(id: 2, name: 'reading', isComplete: true);
  Category category = Category(
    name: 'Electronic',
    categoryId: 1,
  );
  TaskPage() {
    DbHelper.dbHelper.getDatabaseConnection();
    DbHelper.dbHelper.getTablesNames();
  }

  @override
  Widget build(BuildContext context) {
    // DbHelper.dbHelper.insertTask(taskModel1);
    // DbHelper.dbHelper.getDatabaseConnection();
    // DbHelper.dbHelper.insertCategory(category);
    // DbHelper.dbHelper.getTablesNames();
    return Container(
      child: Text('sss'),

      // body: Container(
      //   margin: EdgeInsets.symmetric(
      //     horizontal: 10,
      //     vertical: 10,
      //   ),
      //   child: FutureBuilder<List<TaskModel>>(
      //     // future: DbHelper.dbHelper.getAllTask(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         if (snapshot.hasError) {
      //           return Center(
      //             child: Text(
      //               '${snapshot.error} occured',
      //               style: TextStyle(fontSize: 18),
      //             ),
      //           );
      //         } else if (snapshot.hasData) {
      //           // Extracting data from snapshot object
      //           List<TaskModel> tasks = snapshot.data;
      //           return ListView.builder(
      //               itemCount: tasks.length,
      //               itemBuilder: (context, index) {
      //                 return Text(
      //                   (tasks[index].name),
      //                 );
      //               });
      //         } else {
      //           return Center(child: Text('Done'));
      //         }
      //       } else {
      //         return Center(child: Text('Done'));
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
