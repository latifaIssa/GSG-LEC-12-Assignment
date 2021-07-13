import 'package:flutter/material.dart';
import 'package:flutter_application_4/MyFormTextField.dart';
import 'package:flutter_application_4/Router/router.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/home/ui/home_page.dart';
import 'package:flutter_application_4/ui/register/FormSubmitButton.dart';
import 'package:string_validator/string_validator.dart';

class MershantRegister extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  MershantRegister();
  @override
  _MershantRegisterState createState() => _MershantRegisterState();
}

class _MershantRegisterState extends State<MershantRegister> {
  List categories = <String>['Fashion', 'Shoes', 'Electronies'];
  String emailAddress;
  String password;
  String phone;
  String name;
  String shopeName;
  String shopAddress;
  String category = 'Fashion';

  String bio;
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

  setShopName(String shopeName) {
    this.shopeName = shopeName;
  }

  setShopAddress(String shopAddress) {
    this.shopAddress = shopAddress;
  }

  setBio(String bio) {
    this.bio = bio;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
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
              onSaved: (value) {
                setName(value);
              },
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
              decoration: InputDecoration(
                  labelText: "Password", hintText: "my password"),

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
              onSaved: (value) {
                setPhone(value);
              },
            ),
            //shope Name
            MyFormTextField(
              isObscure: false,
              decoration: InputDecoration(
                labelText: "shope name",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a shop name';
                }
                return null;
              },
              onSaved: (value) {
                setShopName(value);
              },
            ),
            //shope Address
            MyFormTextField(
              isObscure: false,
              decoration: InputDecoration(
                labelText: "shope address",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a shop address';
                }
                return null;
              },
              onSaved: (value) {
                setShopAddress(value);
              },
            ),
            //Bio
            MyFormTextField(
              isObscure: false,
              decoration: InputDecoration(
                labelText: "Bio",
              ),
              onSaved: (value) {
                setBio(value);
              },
            ),
            DropdownButton(
              value: this.category,
              items: categories.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  this.category = value;
                });
              },
              isExpanded: true,
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.formKey.currentState.validate()) {
                  widget.formKey.currentState.save();
                  FormUser formUser = FormUser.mershant(
                    name: name,
                    emailAddress: emailAddress,
                    password: password,
                    phone: phone,
                    shopAddress: shopAddress,
                    shopeName: shopeName,
                    bio: bio,
                    category: category,
                  );

                  // String result = await Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return HomePage(formUser);
                  //     },
                  //   ),
                  // );
                  // // return result;
                  // print(result);
                  // String result = await Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return HomePage(formUser);
                  //     },
                  //   ),
                  // );
                  // // return result;
                  // print(result);

                  //remove pages until x=2
                  // int x = 0;
                  // String result = await Navigator.of(context).pushAndRemoveUnti(
                  //     MaterialPageRoute(
                  //   builder: (context) {
                  //     return HomePage(formUser);
                  //   },
                  // ), (r) => x++ == 2);
                  // // return result;
                  // print(result);

                  //give name to the route
                  // dynamic result = Navigator.of(context)
                  //     .pushNamed('home', arguments: formUser);
                  // // return result;
                  // print(result);
                  AppRouter.router.pushFunction(HomePage(formUser));
                }
              },
              child: Text('Sign Up As Mershant'),
            )
          ],
        ),
      ),
    );
  }
}
