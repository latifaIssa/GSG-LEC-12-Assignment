import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../MyFormTextField.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      // key: formKey,
      child: Column(
        children: [
          //email
          MyFormTextField(
            isObscure: false,

            // EmailAddress decoration
            decoration: InputDecoration(
              labelText: "EmailAddress",
              hintText: "me@abc.com",
            ),

            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter an email address';
              } else if (!isEmail(value)) return 'invalid syntax';
              return null;
            },

            // onSaved: (value) {
            //   setEmail(value);
            // },
          ),
          // paasword
          MyFormTextField(
            isObscure: true,

            // Password box decoration
            decoration:
                InputDecoration(labelText: "Password", hintText: "my password"),

            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a password';
              }
              return null;
            },

            // onSaved: (value) {
            //   setPassword(value);
            // },
          ),
        ],
      ),
    );
  }
}
