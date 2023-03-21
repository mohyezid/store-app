import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({this.id, this.name, this.image, this.creationAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  static List<Category> CategoryList(List data) {
    print('a');
    var ans = data.map((value) {
      return Category.fromJson(value);
    }).toList();
    print(ans);
    return ans;
  }
}
