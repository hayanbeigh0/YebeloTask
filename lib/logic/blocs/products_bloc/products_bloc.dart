// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app_task/models/product_model.dart';

import 'package:shopping_app_task/repository/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductRepository productRepository;
  ProductsBloc(
    this.productRepository,
  ) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is ProductLoadEvent) {
        emit(ProductsLoading());
        final productList = await productRepository.loadProductsJson();
        emit(ProductsLoaded(productList: productList));
      }
    });
    on<LoadPremiumProducts>((event, emit) async {
      emit(ProductsLoading());
      final productList = await productRepository.loadProductsJson().then(
            (products) => products
                .where((element) => element.pCategory == 'Premium')
                .toList(),
          );
      emit(ProductsLoaded(productList: productList));
    });
    on<LoadTamilNaduProducts>((event, emit) async {
      emit(ProductsLoading());
      final productList = await productRepository.loadProductsJson().then(
            (products) => products
                .where((element) => element.pCategory == 'Tamilnadu')
                .toList(),
          );
      emit(ProductsLoaded(productList: productList));
    });
  }
}
