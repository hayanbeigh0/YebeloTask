// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app_task/models/product_model.dart';

import 'package:shopping_app_task/repository/shopping_cart_repository.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartRepository shoppingCartRepository;
  ShoppingCartBloc(
    this.shoppingCartRepository,
  ) : super(ShoppingCartInitial()) {
    on<AddToCart>((event, emit) {
      try {
        emit(ShoppingCartLoading());
        shoppingCartRepository.addToShoppingCart(event.product);
        emit(ShoppingCartLoaded(shoppingCartRepository.shoppingCartList));
      } catch (e) {
        print(e.toString());
        add(AddToCartError(e.toString()));
      }
    });
    on<RemoveFromCart>((event, emit) {
      emit(ShoppingCartLoading());
      shoppingCartRepository.removeFromShoppingCart(event.productId);
      emit(ShoppingCartLoaded(shoppingCartRepository.shoppingCartList));
    });
    on<LoadCartProducts>((event, emit) {
      emit(ShoppingCartLoaded(shoppingCartRepository.shoppingCartList));
    });
    on<AddToCartError>((event, emit) {
      emit(AddToCartErrorState(event.error));
      emit(ShoppingCartLoaded(shoppingCartRepository.shoppingCartList));
    });
  }
}
