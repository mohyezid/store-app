import 'package:flutter/widgets.dart';
import 'package:store_api_flutter_course/modals/Category.dart';

class ProductModal with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;

  Category? category;

  ProductModal(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.category});

  ProductModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();

    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  static List<ProductModal> ProductList(List data) {
    print('producy');
    return data.map((value) {
      return ProductModal.fromJson(value);
    }).toList();
  }
}
