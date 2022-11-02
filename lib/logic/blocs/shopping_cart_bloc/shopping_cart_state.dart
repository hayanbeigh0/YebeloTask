part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartState {}

class ShoppingCartInitial extends ShoppingCartState {}

class ShoppingCartLoading extends ShoppingCartState {}

class AddToCartErrorState extends ShoppingCartState {
  final String error;

  AddToCartErrorState(this.error);
}

// ignore: must_be_immutable
class ShoppingCartLoaded extends ShoppingCartState {
  List<ProductModel> shoppingCartList;
  ShoppingCartLoaded(this.shoppingCartList);
}
