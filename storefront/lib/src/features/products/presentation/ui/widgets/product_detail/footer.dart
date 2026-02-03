import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:storefront/src/features/products/data/models/product_model.dart';
import 'package:storefront/src/shared/ui/widgets/buttons.dart';
import 'package:storefront/src/features/cart/data/models/model_cart.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';

class Footer extends StatelessWidget {
  final CartItem cart;
  final String price;
  final String? originalPrice; // Original price for discount display

  const Footer({
    super.key,
    required this.cart,
    required this.price,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -5), // Shadow at the top of the footer
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price Section
          Row(
            children: [
              const Text(
                'KSH',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              if (originalPrice != null) // Show original price if discount exists
                Row(
                  children: [
                    Text(
                      originalPrice!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: originalPrice != null ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),

          // Buy Now Button
          CustomButton(
            name: "Buy Now",
            width: 150,
            height: 50,
            backgroundColor: Color(0xFF003CFF),
            onPressed: () {
              // Add to cart if not in cart
              cartProvider.addToCart(cart);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${cart.label} added to cart!"),
                  backgroundColor: Color(0xFF2F9803), // Green background for addition
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}