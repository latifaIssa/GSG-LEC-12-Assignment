import 'package:flutter/cupertino.dart';
import 'package:flutter_application_4/ui/register/LoginForm.dart';

class FormUser {
  User userType;
  String name;
  String emailAddress;
  String password;
  String phone;
  String shopeName;
  String shopAddress;
  String bio;
  String category;
  FormUser.customer({
    @required this.name,
    @required this.emailAddress,
    @required this.password,
    @required this.phone,
    this.userType = User.customer,
  });
  FormUser.mershant({
    @required this.name,
    @required this.emailAddress,
    @required this.password,
    @required this.phone,
    @required this.shopAddress,
    @required this.shopeName,
    @required this.bio,
    @required this.category,
    this.userType = User.mershant,
  });
}
