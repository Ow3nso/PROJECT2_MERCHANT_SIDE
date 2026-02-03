import 'package:flutter/material.dart';
import 'package:storefront/src/features/products/data/repository/product_repo_impl.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:storefront/src/shared/ui/widgets/app_bar.dart';
import 'package:storefront/src/features/products/data/models/product_model.dart';
import 'package:storefront/src/features/cart/data/models/model_cart.dart';
import 'package:storefront/src/shared/ui/widgets/discount_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets/product_detail/disclaimer.dart';
import '../widgets/product_detail/filter_selection.dart';
import '../widgets/product_detail/footer.dart';
import '../widgets/product_detail/default_drop_down.dart';
import '../widgets/product_detail/filter_color_text.dart';
import '../../adapters/products_controller.dart';
import '../../functions/like_helper.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ProductModel?> getProductById(String productId) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('products').doc(productId).get();

      if (doc.exists) {
        return ProductModel.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching product: $e");
      return null;
    }
  }
}

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

  class _ProductDetailPageState extends State<ProductDetailPage> {
    ProductModel? product;
    bool isLoading = true;
    bool isLiked = false;
    bool isUpdating = false;
    final String userId = Uuid().v4(); // Generate a unique user ID

    @override
    void initState() {
      super.initState();
      _fetchProduct();
      _checkIfLiked();
    }

    Future<void> _checkIfLiked() async {
    if (widget.productId.isNotEmpty && product != null) {
      isLiked = product!.likes.contains(userId);
      setState(() {});
    }
  }

  Future<void> _toggleLike() async {
  if (product == null || isUpdating) return;

  setState(() {
    isUpdating = true;
  });

  try {
    // Access the repository using Provider
    final repository = Provider.of<ProductRepositoryImpl>(context, listen: false);
    final result = await repository.toggleProductLike(product!.productId, userId);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.message)),
        );
      },
      (_) {
        setState(() {
          if (isLiked) {
            product!.likes.remove(userId);
          } else {
            product!.likes.add(userId);
          }
          isLiked = !isLiked;
        });
      },
    );
  } finally {
    setState(() {
      isUpdating = false;
    });
  }
}
    Future<void> _fetchProduct() async {
      ProductModel? fetchedProduct = await ProductRepository().getProductById(widget.productId);
      setState(() {
        product = fetchedProduct;
        isLoading = false;
      });
    }

    bool isExpanded = false;
    bool showReadMore = false;

    Color _parseColor(String colorString) {
      if (colorString.isEmpty || !RegExp(r'^#?[0-9A-Fa-f]{6}$').hasMatch(colorString)) {
        return Colors.black; // Default fallback color
      }
      colorString = colorString.replaceFirst('#', ''); // Ensure hex format
      return Color(int.parse('0xFF$colorString')); // Convert to Color
    }

    String _selectedColor = 'Color'; // Default text
    String _selectedSize = 'Size'; // Default text

    void _shareProduct() {
      if (product != null) {
        String productLink = "https://yourstore.com/product/${product!.productId}"; // Change to actual product URL
        String message = "Check out this amazing product: ${product!.label}!\n\n"
            "🔹 ${product!.description}\n"
            "💰 Price: \$${product!.price}\n"
            "📌 Category: ${product!.category}\n"
            "👉 Buy now: $productLink";

        Share.share(message);
      }
    }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Regalia Apparel',
        onBackPressed: () {
          Navigator.pop(context);
        },
        onCartPressed: () {
          Navigator.pushNamed(context, '/cart_view');
        },
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : product == null
              ? Center(child: Text("Product not found"))
              : Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 80.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                product!.images.isNotEmpty ? product!.images.first : 'https://via.placeholder.com/300',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 300,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image_not_supported, size: 50);
                                },
                              ),
                              if (product?.isOnDiscount ?? false)
                                Positioned(
                                  top: 5,
                                  left: 5,
                                  child: DiscountCard(
                                    color: Colors.white,
                                    description: (product!.discountPercentage) > 0
                                        ? '${product!.discountPercentage.round()}% Off'
                                        : 'KES ${product!.discountAmount.toStringAsFixed(2)} Off',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        isLiked ? Icons.favorite : Icons.favorite_border,
                                        color: isLiked ? Colors.red : Colors.black,
                                      ),
                                      onPressed: _toggleLike,
                                    ),
                                    const SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: _shareProduct,
                                      child: const Icon(Icons.share, color: Colors.black),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '🔥 ${product!.likes.length} people love this item',
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  product!.label,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  product!.description,
                                  style: const TextStyle(fontSize: 14),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Condition: ${product!.subCategory}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Category: ${product!.category}',
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DefaultDropdown(
                                        isExpanded: true,
                                        hintWidget: Text(_selectedColor),
                                        items: product!.availableColors
                                            .map((color) => {'color': color, 'name': color})
                                            .toList(),
                                        itemChild: (value) => FilterColorText(
                                          color: _parseColor(value['color']!),
                                          value: value['name'],
                                          isSelected: _selectedColor == value['name'],
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedColor = value!['name']!;
                                          });
                                        },
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      child: DefaultDropdown(
                                        isExpanded: true,
                                        hintWidget: Text(_selectedSize),
                                        items: product!.availableSizes
                                            .map((size) => {'value': size, 'label': size})
                                            .toList(),
                                        itemChild: (value) => Text(value['label']!),
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedSize = value!['label']!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Text(
                                      'Item Code: ',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      product!.productId,
                                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Disclaimer()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Footer(
                        price: product!.isOnDiscount
                            ? (product!.discountPercentage != null && product!.discountPercentage! > 0
                                ? (product!.price * (1 - (product!.discountPercentage! / 100))).toStringAsFixed(2) // Percentage discount
                                : (product!.price - (product!.discountAmount ?? 0)).toStringAsFixed(2)) // Fixed amount discount
                            : product!.price.toStringAsFixed(2),
                        originalPrice: product!.isOnDiscount ? product!.price.toStringAsFixed(2) : null,
                        cart: CartItem(
                          sellerId: product!.sellerId,
                          availableColors: product!.availableColors,
                          
                          productId: product!.productId,
                          label: product!.label,
                          price: product!.price,
                          images: product!.images,
                          discountedPrice: product!.isOnDiscount
                              ? (product!.discountPercentage != null && product!.discountPercentage! > 0
                                  ? (product!.price * (1 - (product!.discountPercentage! / 100))) // Percentage discount
                                  : (product!.price - (product!.discountAmount ?? 0))) // Fixed amount discount
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
