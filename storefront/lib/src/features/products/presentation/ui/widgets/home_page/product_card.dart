import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:storefront/src/features/products/data/models/product_model.dart';
import 'package:storefront/src/features/products/presentation/ui/pages/product_detail.dart';
import 'package:storefront/src/features/cart/data/models/model_cart.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:storefront/src/shared/ui/widgets/discount_card.dart'; // Import the DiscountCard widget

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final String name;
  final String price;
  final String image;

  const ProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // Check if the product is already in the cart
    final bool isInCart = cartProvider.items.containsKey(product.productId);

    // Calculate the new price based on discount type
    final double newPrice = product.isOnDiscount
        ? (product.discountPercentage != null && product.discountPercentage! > 0
            ? product.price * (1 - (product.discountPercentage! / 100)) // Percentage discount
            : product.price - (product.discountAmount ?? 0)) // Fixed amount discount
        : product.price;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(productId: product.productId),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported, size: 50);
                            },
                          ),
                          // Show DiscountCard if the product is on discount
                          if (product.isOnDiscount)
                            Positioned(
                              top: 5,
                              left: 5,
                              child: DiscountCard(
                                color: Colors.white,
                                description: (product.discountPercentage ?? 0) > 0
                                    ? '${product.discountPercentage?.round()}% Off'
                                    : 'KES ${product.discountAmount?.toStringAsFixed(2)} Off',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align to the start (left)
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Display prices in a row
                          Row(
                            children: [
                              Text(
                                'KSH ${newPrice.toStringAsFixed(2)}', // Show the new price first
                                style: TextStyle(
                                  fontSize: 14,
                                  color: product.isOnDiscount ? Colors.red : Colors.grey,
                                  fontWeight: product.isOnDiscount ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                              if (product.isOnDiscount) // Add spacing between prices
                                const SizedBox(width: 8),
                              if (product.isOnDiscount) // Show original price with line-through if discounted
                                Text(
                                  'KSH ${product.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 75,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: isInCart ? Color(0xFF2F9803) : const Color(0xFF003CFF), // Change color based on cart state
                      size: 24,
                    ),
                    onPressed: () {
                      // Create a CartItem with the discounted price if applicable
                      final CartItem cartItem = CartItem(
                        productId: product.productId,
                        label: product.label,
                        price: product.price,
                        images: product.images,
                        discountedPrice: product.isOnDiscount ? newPrice : null, // Pass discounted price

                        sellerId: product.sellerId,
                        availableColors: product.availableColors,
                      );

                      // Add to cart if not in cart
                      cartProvider.addToCart(cartItem);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${cartItem.label} added to cart!"),
                          backgroundColor: Color(0xFF2F9803), // Green background for addition
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}