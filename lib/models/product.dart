import 'package:flutter/cupertino.dart';

class Product {
  int id;
  String name;
  int catId;
  Product({
    this.id,
    @required this.name,
    this.catId,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'catId': catId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      catId: map['catId'],
    );
  }
}
