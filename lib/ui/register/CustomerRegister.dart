import 'package:flutter/material.dart';
import 'package:flutter_application_4/MyFormTextField.dart';
import 'package:flutter_application_4/Router/router.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/home/ui/home_page.dart';
import 'package:flutter_application_4/ui/register/FormSubmitButton.dart';
import 'package:string_validator/string_validator.dart';

class CustomerRegister extends StatelessWidget {
  String emailAddress;
  String password;
  String phone;
  String name;
  FormUser formUser;
  setFormUser(formuser) {
    this.formUser = formuser;
  }

  setEmail(String email) {
    this.emailAddress = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  setName(String name) {
    this.name = name;
  }

  setPhone(String phone) {
    this.phone = phone;
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CustomerRegister();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          //name
          MyFormTextField(
            isObscure: false,
            decoration: InputDecoration(
              labelText: "Name",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            // onSaved: (value) {
            //   setName(value);
            // },
          ),
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

            onSaved: (value) {
              setEmail(value);
            },
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

            onSaved: (value) {
              setPassword(value);
            },
          ),
          //phone number
          MyFormTextField(
            isObscure: false,
            decoration: InputDecoration(
              labelText: "Phones",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a phone number';
              }
              return null;
            },
            // onSaved: (value) {
            //   setPhone(value);
            // },
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                FormUser formUser = FormUser.customer(
                  name: name,
                  emailAddress: emailAddress,
                  password: password,
                  phone: phone,
                );
                // String result = await Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return HomePage(formUser);
                //     },
                //   ),
                // );
                // dynamic result =
                //     Navigator.pushNamed(context, '/home', arguments: formUser);

                // return result;
                // print(result);
                AppRouter.router.pushFunction(HomePage(formUser));
              }
            },
            child: Text('Sign Up As Customer'),
          ),
        ],
      ),
    );
  }
}
