import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart'; // Import Provider
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:storefront/src/features/products/presentation/ui/pages/get_products.dart';
import 'package:storefront/src/shared/ui/widgets/buttons.dart'; // Import your CartProvider

class RegaliaLogo extends StatefulWidget {
  const RegaliaLogo({super.key});

  @override
  _RegaliaLogoState createState() => _RegaliaLogoState();
}

class _RegaliaLogoState extends State<RegaliaLogo> {
  bool _showSearchBar = false; // Controls the visibility of the search bar
  String _searchQuery = ''; // Stores the search query

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Access the CartProvider
    final bool hasItemsInCart = cartProvider.items.isNotEmpty; // Check if cart has items

    return Column(
      children: [
        Container(
          height: 200,
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/mask_group.png',
                  fit: BoxFit.cover,
                ),
              ),
              // Foreground Content
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Column
                      GestureDetector(
                        onTap: () => _showModal(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ),
                      // Center Column
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/avatar_profile_photo.png',
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.image_not_supported, size: 50);
                              },
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Regalia Apparel',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right Column
                      Row(
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       _showSearchBar = !_showSearchBar; // Toggle search bar visibility
                          //     });
                          //   },
                          //   child: Container(
                          //     padding: const EdgeInsets.all(4.0),
                          //     child: const Icon(
                          //       Icons.search,
                          //       color: Colors.white,
                          //       size: 28.0,
                          //     ),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/cart_view');
                            },
                            child: Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4.0),
                                  child: const Icon(
                                    Icons.shopping_bag,
                                    color: Colors.white,
                                    size: 28.0,
                                  ),
                                ),
                                // Red dot indicator
                                if (hasItemsInCart)
                                  Positioned(
                                    right: 7,
                                    bottom: 4,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                              ],
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
        ),
        // Search Bar (Conditionally Rendered)
        if (_showSearchBar)
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onSubmitted: (value) {
                setState(() {
                  _searchQuery = value; // Update the search query
                });
                // Navigate to the GetProductsPage with the search query
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetProductsPage(searchQuery: _searchQuery),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  void _showModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect( // Ensures rounded edges for child container
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Apply border radius
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48), // Placeholder to balance the row
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildDividerRow('Home'),
                  _buildDividerRow('About Us'),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {}, 
                              icon: const Icon(
                                Icons.facebook_sharp, 
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  CustomButton(
                    name: "Open a free store", 
                    width: double.infinity, 
                    height: 50, 
                    backgroundColor: const Color(0xFF003CFF), 
                    onPressed: () {}
                  ),
                  const SizedBox(height: 16.0),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Made with ', 
                              style: TextStyle(
                                color: Color(0xFF615E69),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.favorite, color: Color(0xFF615E69), size: 14),
                            Text(
                              ' by Dukastax', 
                              style: 
                              TextStyle(
                                color: Color(0xFF615E69),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'A product of Lukhu Inc.',
                          style: TextStyle(
                            color: Color(0xFF615E69),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


  Widget _buildDividerRow(String title) {
    return Column(
      children: [
        const Divider(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetProductsPage(),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title, 
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}