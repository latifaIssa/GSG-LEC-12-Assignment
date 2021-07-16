import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/sharedprefernces_helper.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/home/ui/home_page.dart';
import 'package:flutter_application_4/ui/register/LoginForm.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FormUser formUser;
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        if (SpHelper.spHelper.getUser() != null) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return HomePage(formUser);
          }));
        } else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return MyForm();
          }));
        }
      },
    );
    // throw UnimplementedError();
    return MyForm();
  }
}
