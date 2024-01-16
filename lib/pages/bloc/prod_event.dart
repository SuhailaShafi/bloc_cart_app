part of 'prod_bloc.dart';

@immutable
sealed class ProdEvent {}

class ProdInitialFetchEvent extends ProdEvent {}
