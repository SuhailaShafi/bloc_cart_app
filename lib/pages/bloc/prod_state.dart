part of 'prod_bloc.dart';

@immutable
sealed class ProdState {}

final class ProdInitial extends ProdState {}

abstract class ProdActionState extends ProdState {}

class ProdFetchingSuccessfull extends ProdState {
  List<ProductModel> product = [];
  ProdFetchingSuccessfull({required this.product});
}

class ProdFetchingLoadingState extends ProdState {}

class ProdFetchingErrorState extends ProdState {}
