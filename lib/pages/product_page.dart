import 'package:cart_app/constants/product_list.dart';
import 'package:cart_app/models/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    Api().getProduct();
    List<Product> list = [];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Shopify'),
        ),
        body: Container(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: PRODUCTS.length,
            itemBuilder: (context, index) {
              return GridTile(
                  child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(PRODUCTS[index].imagepath))),
                  ),
                  ListTile(
                    title: Text(PRODUCTS[index].name),
                    trailing: Icon(Icons.shopping_bag),
                  )
                ],
              ));
            },
          ),
        ));
  }
}
