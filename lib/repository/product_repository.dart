import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import '/models/product_model.dart';

class ProductRepository {
  Future<String> getProductsJson() {
    return rootBundle.loadString('assets/products.json');
  }

  Future<List<ProductModel>> loadProductsJson() async {
    final list = json.decode(await getProductsJson()) as List<dynamic>;
    final productList = list.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
  }
}
