import 'package:shared_preferences/shared_preferences.dart';

class LikeHelper {
  static const String _likedProductsKey = 'liked_products';

  // Add a product ID to liked products
  static Future<void> likeProduct(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final likedProducts = prefs.getStringList(_likedProductsKey) ?? [];
    if (!likedProducts.contains(productId)) {
      likedProducts.add(productId);
      await prefs.setStringList(_likedProductsKey, likedProducts);
    }
  }

  // Remove a product ID from liked products
  static Future<void> unlikeProduct(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final likedProducts = prefs.getStringList(_likedProductsKey) ?? [];
    likedProducts.remove(productId);
    await prefs.setStringList(_likedProductsKey, likedProducts);
  }

  // Check if a product is liked
  static Future<bool> isProductLiked(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    final likedProducts = prefs.getStringList(_likedProductsKey) ?? [];
    return likedProducts.contains(productId);
  }

  // Get all liked product IDs
  static Future<List<String>> getLikedProducts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_likedProductsKey) ?? [];
  }
}