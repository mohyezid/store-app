import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_consts.dart';
import 'package:store_api_flutter_course/modals/Category.dart';
import 'package:store_api_flutter_course/modals/Product.dart';
import 'package:store_api_flutter_course/modals/User.dart';

class APIHandler {
  static Future<dynamic> getall(String target) async {
    var uri = Uri.https(BASE_URL, 'api/v1/$target');
    var response = await http.get(uri);

    var decr = jsonDecode(response.body);
    final temp = [];
    for (var v in decr) {
      temp.add(v);
    }

    return temp;
  }

  static Future<List<ProductModal>> getallProdyct() async {
    List res = await getall('products');
    return ProductModal.ProductList(res);
  }

  static Future<List<Category>> getallCategory() async {
    List res = await getall('categories');

    return Category.CategoryList(res);
  }

  static Future<List<UserModal>> getallUser() async {
    List res = await getall('users');

    return UserModal.listUser(res);
  }

  static Future<ProductModal> getProductById(String id) async {
    var uri = Uri.https(BASE_URL, 'api/v1/products/$id');
    var response = await http.get(uri);

    var decr = jsonDecode(response.body);

    return ProductModal.fromJson(decr);
  }
}
