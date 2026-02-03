import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CartController,
        CustomerController,
        DateFormat,
        DefaultButton,
        ShortMessages,
        StyleColors,
        ReadContext,
        TransactionController,
        WatchContext;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/payment/description_tile.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

class OrderDetail extends StatelessWidget {
  const OrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    final customerController = context.watch<CustomerController>();
    final order = cartController.order;

    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 20),
      child: Column(
        children: [
          DescriptionTile(
            title: 'Lukhu Order Number',
            description: order?.orderId ?? 'LUKHU-300325-1567',
          ),
          DescriptionTile(
            title: 'Number of Items',
            description: '${cartController.getBagQuantity()}',
          ),
          DescriptionTile(
            title: 'Customer Name',
            description: customerController.customer?.name ?? '',
          ),
          DescriptionTile(
            title: 'Date',
            description: DateFormat('MMM dd, yyyy')
                .format(order?.createdAt ?? DateTime.now()),
          ),
          DescriptionTile(
            title: 'Time',
            description: DateFormat('hh:mm a')
                .format(order?.createdAt ?? DateTime.now()),
          ),
          DescriptionTile(
            title: 'Payment Method',
            description: 'M-PESA',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 40),
            child: DescriptionTile(
              title: 'Amount',
              allowBold: true,
              description:
                  'KSh ${cartController.cartTotal.toStringAsFixed(0)}',
            ),
          ),
          DefaultButton(
            label: 'Download PDF',
            onTap: () async {
              await generateAndSharePdf(context);
            },
            asssetIcon: AppUtil.documeDownloadIcon,
            packageName: AppUtil.packageName,
            color: StyleColors.lukhuWhite,
            textColor: StyleColors.lukhuBlue,
            boarderColor: StyleColors.lukhuBlue,
          )
        ],
      ),
    );
  }

  Future<void> generateAndSharePdf(BuildContext context) async {
    try {
      final pdfBytes = await generatePdfBytes(context);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/Order_Receipt.pdf');
      await file.writeAsBytes(pdfBytes);
      
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Here is your order receipt',
        subject: 'Order Receipt',
      );
    } catch (e) {
      ShortMessages.showShortMessage(message: 'Failed to share PDF: $e');
    }
  }

  Future<Uint8List> generatePdfBytes(BuildContext context) async {
    final pdf = pw.Document();
    final cartController = context.read<CartController>();
    final customerController = context.read<CustomerController>();
    final order = cartController.order;
    final cartItems = cartController.cart.values.toList();

    // Load logo image (replace with your actual logo asset)
    // final ByteData logoData = await rootBundle.load('assets/images/logo.png');
    // final Uint8List logoBytes = logoData.buffer.asUint8List();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            //_buildHeader(logoBytes),
            pw.SizedBox(height: 20),
            pw.Divider(),
            pw.SizedBox(height: 10),

            // Order details
            pw.Text("Hi, ${customerController.customer?.name ?? 'Customer'}", 
                style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            pw.Text("Thank you for shopping with us", 
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.Text("Your order details can be found below", 
                style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            pw.Divider(),
            pw.SizedBox(height: 16),
            _buildOrderDetailRow("Order Number", order?.orderId ?? 'N/A'),
            pw.SizedBox(height: 8),
            _buildOrderDetailRow("Date", DateFormat('MMM dd, yyyy').format(order?.createdAt ?? DateTime.now())),
            pw.SizedBox(height: 8),
            _buildOrderDetailRow("Customer Name", customerController.customer?.name ?? 'N/A'),
            pw.SizedBox(height: 8),
            _buildOrderDetailRow("Payment Method", "M-PESA"),
            pw.SizedBox(height: 16),
            pw.Divider(),
            pw.SizedBox(height: 16),

            // Products Section
            pw.Text("Order Items", style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            ...cartItems.map((item) {
              return _buildItemSection(
                cartItems.indexOf(item) + 1,
                item.label ?? 'N/A',
                cartController.cartColors[item.productId] ?? 'N/A',
                cartController.cartSizes[item.productId] ?? 'N/A',
                item.price?.toStringAsFixed(2) ?? '0.00',
                cartController.cartQuantity[item.productId] ?? 1,
              );
            }).toList(),
            pw.SizedBox(height: 16),

            // Total Amount Section
            pw.Divider(),
            pw.SizedBox(height: 16),
            _buildOrderDetailRow("Total Amount", "KSh ${cartController.cartTotal.toStringAsFixed(0)}"),
            pw.SizedBox(height: 16),
            pw.Divider(),
            pw.SizedBox(height: 16),

            _buildFooter(),
          ];
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildHeader(Uint8List logoBytes) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Image(pw.MemoryImage(logoBytes), width: 120),
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: pw.BoxDecoration(
            color: PdfColors.blue700,
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Text("RECEIPT", 
              style: pw.TextStyle(
                  color: PdfColors.white,
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold)),
        ),
      ],
    );
  }

  pw.Widget _buildFooter() {
    return pw.Column(
      children: [
        pw.Text("Dukastax by Lukhu is a registered product of Lukhu Inc.", 
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
        pw.Text("If you have any questions or inquiries, feel free to get in touch via +254 746 55 34 70", 
            style: pw.TextStyle(fontSize: 16)),
      ],
    );
  }

  pw.Widget _buildOrderDetailRow(String title, String value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text("$title:", style: pw.TextStyle(fontSize: 16)),
        pw.Text(value, style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  pw.Widget _buildItemSection(int itemNum, String itemName, String color, String size, String price, int quantity) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text("Item $itemNum", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
        pw.Text("$quantity x $itemName", style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 5),
        _buildOrderDetailRow("Item Color", color),
        _buildOrderDetailRow("Item Size", size),
        _buildOrderDetailRow("Price per item", "KSh $price"),
        _buildOrderDetailRow("Subtotal", "KSh ${(double.parse(price) * quantity).toStringAsFixed(2)}"),
        pw.Divider(),
        pw.SizedBox(height: 10),
      ],
    );
  }
}
