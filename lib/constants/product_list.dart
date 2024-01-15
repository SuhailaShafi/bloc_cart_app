import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;
  final String imagepath;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.color,
      required this.imagepath});
}

//url of get function of api
String url = 'https://fakestoreapi.com/products';

final List<Product> PRODUCTS = [
  Product(
      id: 0,
      name: 'Laptop1',
      price: 999.9,
      color: Colors.amber,
      imagepath: 'assets/images/lap1.jpg'),
  Product(
      id: 1,
      name: 'Laptop2',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/lap2.jpg'),
  Product(
      id: 1,
      name: 'SmartPhone 1',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/mob1.jpeg'),
  Product(
      id: 1,
      name: 'SmartPhone 2',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/mob4.jpg'),
  Product(
      id: 1,
      name: 'SmartPhone3',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/mob2.jpeg'),
  Product(
      id: 1,
      name: 'Laptop3',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/lap3.jpg'),
  Product(
      id: 1,
      name: 'Laptop4',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/lap4.jpg'),
  Product(
      id: 1,
      name: 'SmartPhone 4',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/mob3.jpeg'),
  Product(
      id: 1,
      name: 'SmartPhone 5',
      price: 999.9,
      color: Colors.green,
      imagepath: 'assets/images/mob5.jpg')
];
