// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartEvent {}

class AddToCart extends ShoppingCartEvent {
  ProductModel product;
  AddToCart({
    required this.product,
  });
}

class RemoveFromCart extends ShoppingCartEvent {
  int productId;
  RemoveFromCart({
    required this.productId,
  });
}

class LoadCartProducts extends ShoppingCartEvent {}

class AddToCartError extends ShoppingCartEvent {
  final String error;

  AddToCartError(this.error);
}
