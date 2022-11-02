// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/blocs/shopping_cart_bloc/shopping_cart_bloc.dart';

import '/repository/product_repository.dart';
import '/repository/shopping_cart_repository.dart';
import '/screens/products_screen.dart';

import 'logic/blocs/products_bloc/products_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ProductRepository().loadProductsJson();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(ProductRepository())
            ..add(
              ProductLoadEvent(),
            ),
        ),
        BlocProvider<ShoppingCartBloc>(
          create: (context) => ShoppingCartBloc(ShoppingCartRepository())
            ..add(LoadCartProducts()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductsScreen(),
      ),
    );
  }
}
