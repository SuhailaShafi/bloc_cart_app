import 'package:cart_app/constants/product_list.dart';
import 'package:cart_app/models/api.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/pages/bloc/prod_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodeCopy extends StatefulWidget {
  CodeCopy({super.key});

  @override
  State<CodeCopy> createState() => _CodeCopyState();
}

class _CodeCopyState extends State<CodeCopy> {
  final ProdBloc prodBloc = ProdBloc();
  ValueNotifier<List<ProductModel>> getprodnotifiew = ValueNotifier([]);
  @override
  void initState() {
    prodBloc.add(ProdInitialFetchEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopify'),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ValueListenableBuilder<List<ProductModel>>(
              valueListenable: getprodnotifiew,
              builder: (context, productList, child) {
                return Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                productList[index].image,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return const Icon(Icons.error);
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                            ListTile(
                              title: Text(productList[index].title),
                              trailing: Icon(Icons.shopping_bag),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<ProductModel>> fetchData() async {
    List<ProductModel> products = await Api().getProduct();
    getprodnotifiew.value = products;
    return products;
  }
}
