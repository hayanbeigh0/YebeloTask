import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import '/models/product_model.dart';

class ProductRepository {
  Future<String> getProductsJson() async {
    return rootBundle.loadString('assets/products.json');
  }

  Future<List<ProductModel>> loadProductsJson() async {
    final list = json.decode(await getProductsJson()) as List<dynamic>;
    final productList = list.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
  }
}
