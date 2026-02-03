class CartItem {
  final String productId;
  final String label;
  final double price;
  final List<String> images;
  final int quantity;
  final double? discountedPrice; // Add this field
  final List<String> availableColors;

  final String sellerId;

  CartItem({
    required this.productId,
    required this.label,
    required this.price,
    required this.images,
    required this.availableColors,
    this.quantity = 1,
    this.discountedPrice, // Initialize this field

    required this.sellerId,
  });

  // Add a copyWith method to handle updates
  CartItem copyWith({
    String? productId,
    String? label,
    double? price,
    List<String>? images,
    int? quantity,
    double? discountedPrice,

    String? sellerId,
    List<String>? availableColors,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      label: label ?? this.label,
      price: price ?? this.price,
      images: images ?? this.images,
      quantity: quantity ?? this.quantity,
      discountedPrice: discountedPrice ?? this.discountedPrice,

      sellerId: sellerId ?? this.sellerId,
      availableColors: availableColors ?? this.availableColors,
    );
  }
}