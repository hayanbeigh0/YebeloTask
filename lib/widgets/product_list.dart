import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.productList});
  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return Text(productList[index].pName.toString());
      },
    );
  }
}
