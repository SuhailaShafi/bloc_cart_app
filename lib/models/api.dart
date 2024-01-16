import 'dart:convert';
import 'dart:ffi';

import 'package:cart_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const geturl = 'https://fakestoreapi.com/products';
  Future<List<ProductModel>> getProduct() async {
    final response = await http.get(Uri.parse(geturl));
    if (response.statusCode == 200) {
      final List<dynamic> productList = json.decode(response.body);
      return productList.map((item) => ProductModel.fromJson(item)).toList();
      print(response.body);
      print(productList);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
