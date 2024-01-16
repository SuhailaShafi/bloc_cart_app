import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_app/models/api.dart';
import 'package:cart_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'prod_event.dart';
part 'prod_state.dart';

class ProdBloc extends Bloc<ProdEvent, ProdState> {
  ProdBloc() : super(ProdInitial()) {
    on<ProdInitialFetchEvent>(prodInitialFetchEvent);
    // TODO: implement event handler
  }
  FutureOr<void> prodInitialFetchEvent(
      ProdInitialFetchEvent event, Emitter<ProdState> emit) async {
    List<ProductModel> prod = await Api().getProduct();
    emit(ProdFetchingLoadingState());
    emit(ProdFetchingSuccessfull(product: prod));
  }
}
