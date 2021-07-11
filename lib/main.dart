import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/ui/register/LoginForm.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms'),
      ),
      // body: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: [
      //   // CustomTextfield('username', userNameController),
      //   // CustomTextfield('password', passController, true),
      //   // ElevatedButton(
      //   //   onPressed: () {},
      //   //   child: Text(
      //   //     'login',
      //   //   ),
      //   // ),
      // ],
      body: MyForm(),
      // ),
    );
  }
}

class CustomTextfield extends StatefulWidget {
  TextEditingController controller;
  String label;
  bool isPassword;

  CustomTextfield(this.label, this.controller, [this.isPassword = false]);
  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool disappear = true;

  // CustomTextfield(this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        obscureText: widget.isPassword ? disappear : disappear,
        controller: widget.controller,
        decoration: InputDecoration(
          prefix: Icon(Icons.email),
          suffix: Visibility(
            visible: widget.isPassword,
            child: IconButton(
              onPressed: () {
                setState(() {
                  this.disappear = widget.isPassword ? !disappear : disappear;
                });
              },
              icon: Icon(Icons.lock),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: widget.label,
          fillColor: Colors.blueGrey.withOpacity(0.2),
          filled: true,
        ),
      ),
    );
  }
}
