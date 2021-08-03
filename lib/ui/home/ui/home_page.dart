import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/helper/db_helper.dart';
import 'package:flutter_application_4/helper/files_helper.dart';
import 'package:flutter_application_4/helper/url_launcher_helper.dart';
import 'package:flutter_application_4/models/task.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/register/LoginForm.dart';

class HomePage extends StatelessWidget {
  String name = 'Omar';
  FormUser formUser;
  HomePage(this.formUser);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            formUser.userType == User.customer
                ? 'hi I am customer, my email is ${formUser.emailAddress} and my password is ${formUser.password}'
                : 'hi I am mershant, my email is ${formUser.emailAddress} and my password is ${formUser.password}, my shop name is  ${formUser.shopeName}, and its place in  ${formUser.shopAddress},  ${formUser.bio}',
          ),
          ElevatedButton(
            child: Text('SignOut'),
            onPressed: () async {
              // Navigator.of(context).pop('hello this message from home page');
              // FilesHelper.filesHelper.writeInFile('gsk');
              // FilesHelper.filesHelper.readFromFile('gsk');
              // UrlLauncherHelper.urlLauncherHelper.makeCall();
              // UrlLauncherHelper.urlLauncherHelper.sendEmail();
              // UrlLauncherHelper.urlLauncherHelper.openFacebookPage();
              // UrlLauncherHelper.urlLauncherHelper.sendSMS();
              // UrlLauncherHelper.urlLauncherHelper.openInstegramPage();
              // UrlLauncherHelper.urlLauncherHelper.openWebPath();
              // UrlLauncherHelper.urlLauncherHelper.openWhatsupChat();
              // UrlLauncherHelper.urlLauncherHelper.shareContent();
              // UrlLauncherHelper.urlLauncherHelper.shareImages();

              // DbHelper.dbHelper.getDatabaseConnection();
              // TaskModel taskModel =
              //     TaskModel(name: 'working', isComplete: true);
              // DbHelper.dbHelper.insertTask(taskModel);
              // List<TaskModel> tasks = await DbHelper.dbHelper.getAllTask();
              // print(tasks.first.name);

              // TaskModel taskModel1 =
              //     TaskModel(id: 2, name: 'reading', isComplete: true);
              // DbHelper.dbHelper.insertTask(taskModel1);
            },
          )
        ],
      ),
    );
  }
}
