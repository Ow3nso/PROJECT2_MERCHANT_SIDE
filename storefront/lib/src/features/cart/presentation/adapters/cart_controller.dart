import 'package:flutter/material.dart';
import '../../data/models/model_cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.values.fold(0, (sum, item) => sum + ((item.discountedPrice ?? item.price) * item.quantity));
  }

  void addToCart(CartItem product) {
    if (_items.containsKey(product.productId)) {
      _items.update(
        product.productId,
        (existingItem) => existingItem.copyWith(quantity: existingItem.quantity + 1),
      );
    } else {
      // Add the product with the discounted price if available
      _items[product.productId] = product.copyWith(
        discountedPrice: product.discountedPrice ?? product.price,
      );
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => existingItem.copyWith(quantity: existingItem.quantity + 1),
      );
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!.quantity > 1) {
        _items.update(
          productId,
          (existingItem) => existingItem.copyWith(quantity: existingItem.quantity - 1),
        );
      } else {
        _items.remove(productId);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}