part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartState {}

class ShoppingCartInitial extends ShoppingCartState {}

class ShoppingCartLoading extends ShoppingCartState {}

class ShoppingCartLoaded extends ShoppingCartState {
  List<ProductModel> shoppingCartList;
  ShoppingCartLoaded(this.shoppingCartList);
}
