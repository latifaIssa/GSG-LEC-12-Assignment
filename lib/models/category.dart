import 'package:flutter/cupertino.dart';

class Category {
  int categoryId;
  String name;
  Category({
    this.categoryId,
    @required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': categoryId,
      'name': name,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoryId: map['id'],
      name: map['name'],
    );
  }
}
