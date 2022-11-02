// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

// ignore: must_be_immutable
class ProductsLoaded extends ProductsState {
  List<ProductModel> productList;
  ProductsLoaded({
    required this.productList,
  });
}

// ignore: must_be_immutable
class PremiumProductsLoaded extends ProductsState {
  List<ProductModel> productList;
  PremiumProductsLoaded({
    required this.productList,
  });
}

// ignore: must_be_immutable
class TamilNaduProductsLoaded extends ProductsState {
  List<ProductModel> productList;
  TamilNaduProductsLoaded({
    required this.productList,
  });
}
