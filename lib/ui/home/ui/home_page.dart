import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/sharedprefernces_helper.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            formUser.userType == User.customer
                ? 'hi I am customer, my email is ${formUser.emailAddress} and my password is ${formUser.password}'
                : 'hi I am mershant, my email is ${formUser.emailAddress} and my password is ${formUser.password}, my shop name is  ${formUser.shopeName}, and its place in  ${formUser.shopAddress},  ${formUser.bio}',
          ),
          // Column(
          //   children: [
          //     Text('User Type: ${SpHelper.spHelper.getUserType()}'),
          //     Text('User Name: ${SpHelper.spHelper.getUserName()}'),
          //     Text('User Email: ${SpHelper.spHelper.getUserEmail()}'),
          //     Text('User Password: ${SpHelper.spHelper.getUserPassword()}'),
          //     Text('User Phone: ${SpHelper.spHelper.getPhone()}'),
          //     Text(
          //         'shopName: (${SpHelper.spHelper.getUserType()} == Mershant)?${SpHelper.spHelper.getShopName()}:""'),
          //     Text(
          //         'shop Address: (${SpHelper.spHelper.getUserType()} == Mershant)?${SpHelper.spHelper.getShopAddress()}:""'),
          //     Text(
          //         'Category: (${SpHelper.spHelper.getUserType()} == Mershant)?${SpHelper.spHelper.getCategory()}:""'),
          //     Text(
          //         'Bio: (${SpHelper.spHelper.getUserType()} == Mershant)?${SpHelper.spHelper.getBio()}:""'),
          //   ],
          // ),
          ElevatedButton(
            child: Text('SignOut'),
            onPressed: () {
              Navigator.of(context).pop('hello this message from home page');
            },
          )
        ],
      ),
    );
  }
}
