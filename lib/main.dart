import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Router/router.dart';
import 'package:flutter_application_4/models/user_form.dart';
import 'package:flutter_application_4/ui/home/ui/home_page.dart';
import 'package:flutter_application_4/ui/login/login.dart';
import 'package:flutter_application_4/ui/register/LoginForm.dart';

import 'helpers/sharedprefernces_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //when exist onther code to execute
  await SpHelper.spHelper.initSharedPrefernces();
  runApp(MyApp());
}

// void main() {
//   runApp(MaterialApp(
// routes: {
//   '/': (context) => MyForm(),
//   // 'home': (context) => HomePage(),
// },
// onGenerateRoute: (RouteSettings routeSettings) {
//   String name = routeSettings.name;
//   var arguments = routeSettings.arguments;

//   if (name == 'home') {
//     return MaterialPageRoute(builder: (context) {
//       return HomePage(arguments);
//     });
//   } else  if (name == 'register') {
//     return MaterialPageRoute(builder: (context) {
//       return HomePage(arguments);
//     });
//   }
// },
// navigatorKey: AppRouter.router.navKey,
// // onGenerateRoute: (RouteSettings routesettings) {
// //   String name = routesettings.name;
// //   var arguments = routesettings.arguments;
// //   switch (name) {
// //     case ('/home'):
// //       return MaterialPageRoute(builder: (context) {
// //         return HomePage(arguments);
// //       });
// //       break;
// //     case ('/login'):
// //       return MaterialPageRoute(builder: (context) {
// //         return LoginPage();
// //       });
// //       break;
// //     default:
// //       return MaterialPageRoute(builder: (context) {
// //         return Scaffold(
// //           backgroundColor: Colors.red,
// //           body: Center(
// //             child: Text('404 Page not found'),
// //           ),
// //         );
// //       });
//   }
// },
// onUnknownRoute: (RouteSettings routeSetting){

// },
//     home: MyApp(),
//   ));
// }

class MyApp extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.router.navKey,
      // routes: {
      //   '/': (context) => MyForm(),
      //   // 'home': (context) => HomePage(),
      // },
      // onGenerateRoute: (RouteSettings routesettings) {
      //   String name = routesettings.name;
      //   var arguments = routesettings.arguments;
      //   switch (name) {
      //     case ('/home'):
      //       return MaterialPageRoute(builder: (context) {
      //         return HomePage(arguments);
      //       });
      //       break;
      //     case ('/login'):
      //       return MaterialPageRoute(builder: (context) {
      //         return LoginPage();
      //       });
      //       break;
      //     default:
      //       return MaterialPageRoute(builder: (context) {
      //         return Scaffold(
      //           backgroundColor: Colors.red,
      //           body: Center(
      //             child: Text('404 Page not found'),
      //           ),
      //         );
      //       });
      //   }
      // },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Forms'),
        ),
        body: Center(
          child: MyForm(),
        ),
      ),
      // child: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Forms'),
      //   ),
      //   // body: Column(
      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   // children: [
      //   //   // CustomTextfield('username', userNameController),
      //   //   // CustomTextfield('password', passController, true),
      //   //   // ElevatedButton(
      //   //   //   onPressed: () {},
      //   //   //   child: Text(
      //   //   //     'login',
      //   //   //   ),
      //   //   // ),
      //   // ],
      //   body: MyForm(),
      // ),
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
