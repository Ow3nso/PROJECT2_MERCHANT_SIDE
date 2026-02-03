// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
// import 'package:storefront/src/features/cart/presentation/ui/widgets/filter_selection.dart';

// class CartCard extends StatelessWidget {
//   final String name;
//   final String price;
//   final String image;

//   const CartCard({
//     super.key,
//     required this.image,
//     required this.name,
//     required this.price,
//   });
//   @override
//   Widget build(BuildContext context) {
//     // final cartProvider = Provider.of<CartProvider>(context);
//     // final cartItems = cartProvider.items.values.toList();

//     return Padding(
//       padding: const EdgeInsets.all(16.0), // Add padding on all four sides
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8), // Add border radius
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.4),
//               spreadRadius: 0,
//               blurRadius: 1,
//               offset: const Offset(0, 0), // changes position of shadow to the bottom
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Container(
//                     width: 100, // Set a specific width for the image
//                     height: 100, // Set a specific height for the image
//                     child: Image.network(
//                       image,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 8.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8.0),
//                         Text(
//                           'Size: Various Sizes available',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey
//                           ),
//                         ),
//                         const SizedBox(height: 8.0),
//                         Text(
//                           price,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     )
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Column(
//                 children: [
//                   const Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           FilterSelection(name: "Color", onPressed: () {}),
//                           const SizedBox(width: 8.0),
//                           FilterSelection(name: "Size", onPressed: () {}),
//                           // const SizedBox(width: 8.0),
//                           IconButton(
//                             icon: Container(
//                               width: 24,
//                               height: 24,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 234, 243, 250), // Set the background color to black
//                                 shape: BoxShape.rectangle,
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: const Icon(
//                                 Icons.remove,
//                                 color: Colors.black,
//                                 size: 16,
//                               ),
//                             ),
//                             onPressed: () {},
//                           ),
//                           // const SizedBox(width: 8.0),
//                           const Text(
//                             '1',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           // const SizedBox(width: 8.0),
//                           IconButton(
//                             icon: Container(
//                               width: 24,
//                               height: 24,
//                               decoration: BoxDecoration(
//                                 color: const Color.fromARGB(255, 234, 243, 250), // Set the background color to black
//                                 shape: BoxShape.rectangle,
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: const Icon(
//                                 Icons.add,
//                                 color: Colors.black,
//                                 size: 16,
//                               ),
//                             ),
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:storefront/src/features/products/data/models/product_model.dart';
import 'package:storefront/src/features/cart/data/models/model_cart.dart';
import 'package:storefront/src/features/cart/presentation/ui/widgets/filter_selection.dart';
import 'package:storefront/src/features/products/presentation/ui/widgets/product_detail/default_drop_down.dart';
import 'package:storefront/src/features/products/presentation/ui/widgets/product_detail/filter_color_text.dart';

class CartCard extends StatefulWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onDelete;
  final ProductModel? product;

  const CartCard({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
    this.product,
  });

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
   ProductModel? product;
   
  String? _selectedColor;
  String? _selectedSize;

  Color _parseColor(String colorString) {
    if (colorString.isEmpty || !RegExp(r'^#?[0-9A-Fa-f]{6}$').hasMatch(colorString)) {
      return Colors.black; // Default fallback color
    }
    colorString = colorString.replaceFirst('#', ''); // Ensure hex format
    return Color(int.parse('0xFF$colorString')); // Convert to Color
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          widget.item.images[0],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.image_not_supported, size: 50);
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.label,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Size: Various Sizes available',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            if (widget.item.discountedPrice != null)
                              Text(
                                'KSH ${widget.item.discountedPrice!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                // if (widget.product != null)
                                  Expanded(
                                    child: DefaultDropdown(
                                      isExpanded: true,
                                      hintWidget: Text(_selectedColor ?? 'Color'),
                                      items: (product?.availableColors ?? [])
                                                                    .map((color) => {'color': color, 'name': color})
                                                                    .toList(),
                                      itemChild: (value) => FilterColorText(
                                        color: _parseColor(value['color']!), 
                                        value: value['name'], 
                                        isSelected: _selectedColor == value['name'],
                                      ),
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            _selectedColor = value['name']!;
                                            print("Selected Color: $_selectedColor");
                                          });
                                        }
                                      },
                                    ),
                                  ),

                                const SizedBox(width: 8.0),
                                Expanded(
                                    child: DefaultDropdown(
                                      isExpanded: true,
                                      hintWidget: Text(_selectedSize ?? 'Size'), // Handle null case
                                      items: (product?.availableSizes ?? [])
                                          .map((size) => {'value': size, 'label': size})
                                          .toList(),
                                      itemChild: (value) => Text(value['label']!),
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            _selectedSize = value['label']!;
                                          });
                                        }
                                      },
                                    ),
                                  ),

                                IconButton(
                                  icon: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 234, 243, 250),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                  onPressed: widget.onDecrement,
                                ),
                                Text(
                                  widget.item.quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 234, 243, 250),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 16,
                                    ),
                                  ),
                                  onPressed: widget.onIncrement,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            right: 0,
            child: IconButton(
              icon: const Icon(
                Icons.delete_outlined,
                color: Colors.black,
                size: 30,
              ),
              onPressed: widget.onDelete,
            ),
          ),
        ],
      ),
    );
  }
}