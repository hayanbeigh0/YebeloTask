import 'package:shopping_app_task/models/product_model.dart';

class ShoppingCartRepository {
  final List<ProductModel> _shoppingCartList = [];
  addToShoppingCart(ProductModel product) {
    if (_shoppingCartList.any((element) => element.pId == product.pId)) {
      throw Exception('Product already in the cart!');
    }
    _shoppingCartList.add(product);
  }

  removeFromShoppingCart(int productId) {
    _shoppingCartList.removeWhere((element) => element.pId == productId);
  }

  List<ProductModel> get shoppingCartList => _shoppingCartList.toSet().toList();
}
