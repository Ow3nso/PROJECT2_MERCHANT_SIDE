import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DateFormat, ImageCard, StyleColors;

class OrderTileCard extends StatelessWidget {
  const OrderTileCard({super.key, required this.orderData});
  final Map<String, dynamic> orderData;

  // Helper method to get status color
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'shipping':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract order-level information
    final Timestamp? createdAtTimestamp = orderData['createdAt'];
    final DateTime? createdAt =
        createdAtTimestamp != null ? createdAtTimestamp.toDate() : null;
    final String orderName = orderData['name'] ?? '';
    final String orderId = orderData['orderId'] ?? '';
    final List<dynamic> items = orderData['items'] ?? [];
    final String status = orderData['statusType']?.toString().toLowerCase() ?? 'pending';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order header information
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: StyleColors.lukhuWhite,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: StyleColors.lukhuDividerColor,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date and Status row
              if (createdAt != null)
                Row(
                  children: [
                    Text(
                      DateFormat('EEE d MMM, h:mm a').format(createdAt),
                      style: TextStyle(
                        color: StyleColors.lukhuGrey50,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getStatusColor(status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                    
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          color: _getStatusColor(status),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              Text(
                orderName,
                style: TextStyle(
                  color: StyleColors.lukhuDark1,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text.rich(TextSpan(
                text: 'Order Number:\t',
                style: TextStyle(
                  color: StyleColors.lukhuDark1,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    text: orderId,
                    style: TextStyle(
                      color: StyleColors.lukhuDark1,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Items list
        Text(
          'Items (${items.length})',
          style: TextStyle(
            color: StyleColors.lukhuDark1,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        
        const SizedBox(height: 8),
        
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final item = items[index] as Map<String, dynamic>;
            return _buildItemCard(context, item);
          },
        ),
      ],
    );
  }

  Widget _buildItemCard(BuildContext context, Map<String, dynamic> item) {
    final String? imageUrl = (item['orderImages'] != null && 
                            item['orderImages'] is List && 
                            item['orderImages'].isNotEmpty)
        ? item['orderImages'][0]
        : null;
    final String itemName = item['name'] ?? 'No name';
    final String color = item['colour'] ?? 'No color';
    final String size = item['size'] ?? 'No size';
    final int quantity = item['quantity'] ?? 0;
    final double amount = (item['amount'] ?? 0).toDouble();

    return Container(
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: StyleColors.lukhuDividerColor,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: imageUrl != null
                  ? ImageCard(
                      image: imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: StyleColors.lukhuGrey50,
                      child: const Icon(Icons.image_not_supported),
                    ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Color: $color',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey50,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Size: $size',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey50,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Qty: $quantity',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey50,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
