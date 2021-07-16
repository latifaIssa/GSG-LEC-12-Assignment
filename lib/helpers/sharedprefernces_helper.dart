import 'dart:convert';

import 'package:flutter_application_4/models/user_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../globals.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPrefernces() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // saveUserType(String type) {
  //   sharedPreferences.setString('type', type);
  // }

  // String getUserType() {
  //   return sharedPreferences
  //       .getString('type'); //maybe return null if the key does not exist
  // }

  // saveUserName(String name) {
  //   sharedPreferences.setString('name', name);
  // }

  // String getUserName() {
  //   return sharedPreferences
  //       .getString('name'); //maybe return null if the key does not exist
  // }

  // saveUserPassword(String password) {
  //   sharedPreferences.setString('password', password);
  // }

  // String getUserPassword() {
  //   return sharedPreferences
  //       .getString('password'); //maybe return null if the key does not exist
  // }

  // saveUserEmail(String email) {
  //   sharedPreferences.setString('email', email);
  // }

  // String getUserEmail() {
  //   return sharedPreferences
  //       .getString('email'); //maybe return null if the key does not exist
  // }

  // saveShopName(String shopName) {
  //   sharedPreferences.setString('shopName', shopName);
  // }

  // String getShopName() {
  //   return sharedPreferences
  //       .getString('shopName'); //maybe return null if the key does not exist
  // }

  // saveShopAddress(String shopAddress) {
  //   sharedPreferences.setString('shopAddress', shopAddress);
  // }

  // String getShopAddress() {
  //   return sharedPreferences
  //       .getString('shopAddress'); //maybe return null if the key does not exist
  // }

  // saveCategory(String category) {
  //   sharedPreferences.setString('category', category);
  // }

  // String getCategory() {
  //   return sharedPreferences
  //       .getString('category'); //maybe return null if the key does not exist
  // }

  // savePhone(String phone) {
  //   sharedPreferences.setString('phone', phone);
  // }

  // String getPhone() {
  //   return sharedPreferences
  //       .getString('phone'); //maybe return null if the key does not exist
  // }

  // saveBio(String bio) {
  //   sharedPreferences.setString('bio', bio);
  // }

  // String getBio() {
  //   return sharedPreferences
  //       .getString('bio'); //maybe return null if the key does not exist
  // }

  saveUser(FormUser formUser) {
    sharedPreferences.setString('formUser', json.encode({...formUser.toMap()}));
  }

  FormUser getUser() {
    // try {
    String user = sharedPreferences.getString('formUser');
    if (user == null) {
      return null;
    }
    assert(user != null);
    Map userMap = json.decode(user);
    FormUser formUser = FormUser.map(userMap);
    Globals.globals.formUser = formUser;
    return formUser;
    // } on Exception catch (e) {
    //   return null;
    // }
  }

  signOut() {
    sharedPreferences.remove('formUser');
  }
}
