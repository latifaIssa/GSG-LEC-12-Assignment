import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/register/signUpForm.dart';

import '../../../globals.dart';

class HomePage extends StatelessWidget {
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
            Globals.globals.formUser.userType == User.customer
                ? 'hi I am customer, my email is ${Globals.globals.formUser.emailAddress} and my password is ${Globals.globals.formUser.password}'
                : 'hi I am mershant, my email is ${Globals.globals.formUser.emailAddress} and my password is ${Globals.globals.formUser.password}, my shop name is  ${Globals.globals.formUser.shopeName}, and its place in  ${Globals.globals.formUser.shopAddress},  ${Globals.globals.formUser.bio}',
          ),
          ElevatedButton(
            child: Text('SignOut'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
