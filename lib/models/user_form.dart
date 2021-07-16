import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/home/ui/customer_page.dart';
import 'package:flutter_application_4/ui/home/ui/mershant_page.dart';
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

  FormUser.formUserType(User userType, BuildContext context) {
    if (userType == User.mershant) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MershantPage();
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return CustomerPage();
      }));
    }
  }
  factory FormUser.map(Map map) {
    if (map['isMershant'] == true) {
      return FormUser.mershant(
          name: map['name'],
          emailAddress: map['emailAddress'],
          password: map['password'],
          phone: map['phone'],
          shopAddress: map['shopAddress'],
          shopeName: map['shopeName'],
          bio: map['bio'],
          category: map['category']);
    } else {
      return FormUser.customer(
        name: map['name'],
        emailAddress: map['emailAddress'],
        password: map['password'],
        phone: map['phone'],
      );
    }
  }

  Map<String, dynamic> toMap() {
    Map map = this.userType == User.customer
        ? {
            'isMershant': false,
            'email': this.emailAddress,
            'password': this.password,
            'name': this.name,
            'phone': this.phone,
          }
        : {
            'isMershant': true,
            'email': this.emailAddress,
            'password': this.password,
            'name': this.name,
            'phone': this.phone,
            'shopName': this.shopeName,
            'shopAdress': this.shopAddress,
            'category': this.category,
            'bio': this.bio,
          };
    return {...map};
  }
}
