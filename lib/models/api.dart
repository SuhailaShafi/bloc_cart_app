import 'dart:convert';
import 'dart:ffi';

import 'package:cart_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const geturl = 'https://fakestoreapi.com/products';
  Future<void> getProduct() async {
    final response = await http.get(Uri.parse(geturl));
    if (response.statusCode == 200) {
      print(response.body);
    }
  }
}
