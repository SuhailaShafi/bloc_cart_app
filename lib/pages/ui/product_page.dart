import 'package:cart_app/constants/product_list.dart';
import 'package:cart_app/models/api.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:cart_app/pages/bloc/prod_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
      body: BlocConsumer<ProdBloc, ProdState>(
          bloc: prodBloc,
          listenWhen: ((previous, current) => current is ProdActionState),
          buildWhen: ((previous, current) => current is! ProdActionState),
          builder: (context, state) {
            switch (state.runtimeType) {
              case ProdFetchingLoadingState:
                return Center(
                  child: const CircularProgressIndicator(),
                );
              case ProdFetchingSuccessfull:
                final successState = state as ProdFetchingSuccessfull;
                return Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: successState.product.length,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                successState.product[index].image,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return const Icon(Icons.error);
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                            ListTile(
                              title: Text(successState.product[index].title),
                              trailing: Icon(Icons.shopping_bag),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
          listener: (context, state) {}),
    );
  }
}
