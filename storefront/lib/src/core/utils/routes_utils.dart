import 'package:flutter/material.dart';
import 'package:storefront/src/features/cart/presentation/ui/pages/delivery_checkout_view.dart';

import 'package:storefront/src/features/products/presentation/ui/pages/get_products.dart';
import 'package:storefront/src/features/products/presentation/ui/pages/product_detail.dart';
import 'package:storefront/src/features/cart/presentation/ui/pages/cart_view.dart';

class AppRoutes{
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // case '/': 
      //   return _materialRoute(TenantHomeView());
      // case '/featured':
      //   return _materialRoute(FeaturedPage());
      case '/cart_view':
        return _materialRoute(CartView());
      case '/delivery_view':
        return _materialRoute(DeliveryView());
      case '/product_detail_page':
        final args = settings.arguments as Map<String, dynamic>?;
        if (args != null && args.containsKey('productId')) {
          return _materialRoute(ProductDetailPage(productId: args['productId']));
        }
        return _materialRoute(GetProductsPage()); // Default to home
        
      default:
        return _materialRoute(GetProductsPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}