// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart'; // For PDF preview and saving

// class OrderDetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);
//     final cartItems = cartProvider.items.values.toList();

//     // Extract the first image from each cart item
//     List<String> productImages = cartItems
//         .where((item) => item.images.isNotEmpty)
//         .expand((item) => item.images.take(1)) // Take only the first image per product
//         .toList();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Container(
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               color: Colors.black,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: Colors.white,
//               size: 16,
//             ),
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Order Details',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Container(
//         color: const Color(0xFF003CFF), // Background color
//         child: Center(
//           child: Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min, // Make height depend on contents
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: productImages
//                       .map((image) => Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: Image.network(
//                               image,
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return const Icon(Icons.image_not_supported, size: 80);
//                               },
//                             ),
//                           ))
//                       .toList(),
//                 ),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Lukhu Order Number',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       'L00000000356',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Number of Items',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       '3',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Customer Name',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       'Jeffrey Owen',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Date',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       'March 22, 2025',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Time',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       '7:30AM',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Payment Method',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       'MPESA',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Row(
//                   children: [
//                     Text(
//                       'Amount',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Spacer(),
//                     Text(
//                       'KSH 3750.00',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 24),
//                 // Download PDF Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       // Generate and download PDF
//                       final pdf = await generatePdf(cartItems);
//                       await Printing.layoutPdf(
//                         onLayout: (PdfPageFormat format) async => pdf.save(),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(color: Color(0xFF003CFF), width: 1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: const Text(
//                       'Download PDF',
//                       style: TextStyle(
//                         color: Color(0xFF003CFF),
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to generate PDF
//   Future<pw.Document> generatePdf(List<CartItem> cartItems) async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('Order Details', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 16),
//               pw.Text('Lukhu Order Number: L00000000356'),
//               pw.Text('Number of Items: ${cartItems.length}'),
//               pw.Text('Customer Name: Jeffrey Owen'),
//               pw.Text('Date: March 22, 2025'),
//               pw.Text('Time: 7:30AM'),
//               pw.Text('Payment Method: MPESA'),
//               pw.Text('Amount: KSH 3750.00'),
//               pw.SizedBox(height: 24),
//               pw.Text('Items in Cart:', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//               ...cartItems.map((item) => pw.Text('${item.label} - KSH ${item.price.toStringAsFixed(2)}')).toList(),
//             ],
//           );
//         },
//       ),
//     );

//     return pdf;
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:open_file/open_file.dart';
import 'package:storefront/src/features/cart/presentation/ui/widgets/disclaimer.dart';

class OrderDetailsPage extends StatelessWidget {
  final String customerName;
  final String selectedPaymentMethod;

  const OrderDetailsPage({
    Key? key,
    required this.customerName,
    required this.selectedPaymentMethod
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList();

    List<String> productImages = cartItems
        .where((item) => item.images.isNotEmpty)
        .expand((item) => item.images.take(1))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFF003CFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Order Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF003CFF),
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: productImages
                            .map((image) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Image.network(
                                    image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.image_not_supported, size: 80);
                                    },
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    buildInfoRow('Lukhu Order Number', 'L00000000356'),
                    buildInfoRow('Number of Items', cartProvider.itemCount.toString()),
                    buildInfoRow('Customer Name', customerName), // Use the passed customer name
                    buildInfoRow('Date', 'March 22, 2025'),
                    buildInfoRow('Time', '7:30AM'),
                    buildInfoRow('Payment Method', selectedPaymentMethod),
                    buildInfoRow('Amount', cartProvider.totalAmount.toStringAsFixed(2), fontSize: 16),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          await generateStyledPdf(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Color(0xFF003CFF), width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Download PDF',
                          style: TextStyle(
                            color: Color(0xFF003CFF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Add the Disclaimer widget here with margins
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Disclaimer(),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value, {double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
  

Future<void> generateStyledPdf(BuildContext context) async {
  final pdf = pw.Document();

  // Load fonts
  final robotoRegular = pw.Font.ttf(await rootBundle.load("assets/fonts/static/Roboto-Regular.ttf"));
  final robotoBold = pw.Font.ttf(await rootBundle.load("assets/fonts/static/Roboto-Bold.ttf"));

  // Load images
  final Uint8List logoData = (await rootBundle.load("assets/receipt_logo.png")).buffer.asUint8List();

  // Get cart data
  final cartProvider = Provider.of<CartProvider>(context, listen: false);
  final cartItems = cartProvider.items.values.toList();

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return [
          _buildHeader(logoData, robotoBold),
          pw.SizedBox(height: 20),
          pw.Divider(),
          pw.SizedBox(height: 10),

          // Order details
          pw.Text("Hi, $customerName", style: pw.TextStyle(font: robotoBold, fontSize: 24)),
          pw.SizedBox(height: 16),
          pw.Text("Thank you for shopping with us", style: pw.TextStyle(font: robotoBold, fontSize: 16)),
          pw.Text("Your order details can be found below", style: pw.TextStyle(font: robotoBold, fontSize: 16)),
          pw.SizedBox(height: 16),
          pw.Divider(),
          pw.SizedBox(height: 16),
          _buildOrderDetailRow("Order Number", "L03048WEOI", robotoRegular, robotoBold),
          pw.SizedBox(height: 8),
          _buildOrderDetailRow("Date", "Mar 22, 2023", robotoRegular, robotoBold),
          pw.SizedBox(height: 8),
          _buildOrderDetailRow("Customer Name", customerName, robotoRegular, robotoBold),
          pw.SizedBox(height: 8),
          _buildOrderDetailRow("Delivery Address", "House A1, Safinaz Villas", robotoRegular, robotoBold),
          pw.SizedBox(height: 16),
          pw.Divider(),
          pw.SizedBox(height: 16),

          // Products Section
          ...cartItems.map((item) {
            final imageData = item.images.isNotEmpty ? Uint8List.fromList(item.images.first.codeUnits) : Uint8List(0);
            return _buildItemSection(
              cartItems.indexOf(item) + 1,
              item.label,
              "Black", // item.color ?? "N/A",
              "UK 44", //item.size ?? "N/A",
              item.price.toStringAsFixed(2),
              "ff",
              robotoRegular,
              robotoBold,
            );
          }).toList(),
          pw.SizedBox(height: 16),

          // Payment Method & Order Amount Section (Displayed After Products)
          pw.Divider(),
          pw.SizedBox(height: 16),
          _buildOrderDetailRow("Payment Method", selectedPaymentMethod, robotoRegular, robotoBold),
          _buildOrderDetailRow("Total Amount", "KSH ${cartProvider.totalAmount.toStringAsFixed(2)}", robotoRegular, robotoBold),
          pw.SizedBox(height: 16),
          pw.Divider(),
          pw.SizedBox(height: 16),

          _buildFooter(robotoRegular, robotoBold),
        ];
      },
    ),
  );

  // Save PDF
  Directory? downloadsDir = await getDownloadsDirectory();
  String path = "${downloadsDir!.path}/receipt.pdf";
  final file = File(path);
  await file.writeAsBytes(await pdf.save());

  // Open PDF
  OpenFile.open(path);
}

// Header Section (Logo & Receipt Title)
pw.Widget _buildHeader(Uint8List logoData, pw.Font bold) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Image(pw.MemoryImage(logoData), width: 120),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: pw.BoxDecoration(
          color: PdfColors.blueAccent700,
          borderRadius: pw.BorderRadius.circular(8),
        ),
        child: pw.Text("RECEIPT", style: pw.TextStyle(font: bold, color: PdfColors.white, fontSize: 12)),
      ),
    ],
  );
}

// Footer Section (Company Info & Contact)
pw.Widget _buildFooter(pw.Font regular, pw.Font bold) {
  return pw.Column(
    children: [
      pw.Text("Dukastax by Lukhu is a registered product of Lukhu Inc.", style: pw.TextStyle(font: bold, fontSize: 16)),
      pw.Text("If you have any questions or inquiries, feel free to get in touch via +254 746 55 34 70", style: pw.TextStyle(font: regular, fontSize: 16)),
    ],
  );
}

// Order Details Row
pw.Widget _buildOrderDetailRow(String title, String value, pw.Font regular, pw.Font bold) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Text("$title:", style: pw.TextStyle(font: regular, fontSize: 16)),
      pw.Text(value, style: pw.TextStyle(font: bold, fontSize: 16)),
    ],
  );
}

// Product Item Section
pw.Widget _buildItemSection(int itemNum, String itemName, String color, String size, String price, String image, pw.Font regular, pw.Font bold) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      // pw.Container(
      //   width: 60,
      //   height: 60,
      //   child: pw.Image(pw.MemoryImage(image)),
      // ),
      pw.SizedBox(width: 10),
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text("Item $itemNum", style: pw.TextStyle(font: bold, fontSize: 12)),
          pw.Text("1x $itemName", style: pw.TextStyle(font: bold, fontSize: 12)),
          pw.SizedBox(height: 5),
          _buildOrderDetailRow("Item Color", color, regular, bold),
          _buildOrderDetailRow("Item Size", size, regular, bold),
          _buildOrderDetailRow("Price", "KSH $price", regular, bold),
        ],
      ),
    ],
  );
}


}
