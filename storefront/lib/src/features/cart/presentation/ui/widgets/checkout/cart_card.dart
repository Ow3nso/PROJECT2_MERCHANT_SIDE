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
import 'package:provider/provider.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:storefront/src/features/cart/data/models/model_cart.dart';

class CartCard extends StatelessWidget {
  final CartItem item;

  const CartCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
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
            // Product Details Row
            Row(
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(item.images.isNotEmpty ? item.images[0] : 'https://via.placeholder.com/80'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Spacer between image and text
                // Product Text Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Product Price
                      Text(
                        'KSH ${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Product Quantity
                      Text(
                        'Quantity: ${item.quantity}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                // Quantity Controls
                Row(
                  children: [
                    // Decrement Button
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        cartProvider.decrementQuantity(item.productId);
                      },
                    ),
                    // Quantity Display
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Increment Button
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        cartProvider.incrementQuantity(item.productId);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Divider
            const Divider(),
            const SizedBox(height: 16),
            // Footer (e.g., Total Price)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'KSH ${(item.price * item.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}