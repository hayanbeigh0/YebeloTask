import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import '/models/product_model.dart';

class ProductRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> getProductsJson() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File("$path/products.json");
    print(file);
    return rootBundle.loadString('assets/products.json');
  }

  Future<List<ProductModel>> loadProductsJson() async {
    final list = json.decode(await getProductsJson()) as List<dynamic>;
    final productList = list.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
  }
}
