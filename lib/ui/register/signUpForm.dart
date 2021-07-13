import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/home/ui/home_page.dart';
import 'package:flutter_application_4/ui/register/CustomerRegister.dart';
import 'package:flutter_application_4/ui/register/MershantRegister.dart';

// enum Gender { male, female }
enum User { customer, mershant }

class MyForm extends StatefulWidget {
  // const MyForm({ Key? key ) : super(key: key);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  User groupValue = User.customer;

  FormUser formUser;

  //after call this, all save function will be executed
  saveForm() {
    // formKey.currentState.save();
    Navigator.of(context).push(MaterialPageRoute(builder: (contex) {
      return HomePage();
    }));
  }

  GlobalKey<FormState> mershantKey = GlobalKey<FormState>();
  GlobalKey<FormState> customerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: RadioListTile(
                  title: Text('Customer'),
                  value: User.customer,
                  groupValue: groupValue,
                  onChanged: (v) {
                    this.groupValue = v;
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: RadioListTile(
                  title: Text('Mershant'),
                  value: User.mershant,
                  groupValue: this.groupValue,
                  onChanged: (v) {
                    this.groupValue = v;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              this.groupValue == User.customer
                  ? CustomerRegister(mershantKey)
                  : MershantRegister(customerKey),
            ],
          ),
        ],
      ),
    );
  }
}
