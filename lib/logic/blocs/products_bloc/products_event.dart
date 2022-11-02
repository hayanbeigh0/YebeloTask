part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class ProductLoadEvent extends ProductsEvent {}

class LoadPremiumProducts extends ProductsEvent {}

class LoadTamilNaduProducts extends ProductsEvent {}
