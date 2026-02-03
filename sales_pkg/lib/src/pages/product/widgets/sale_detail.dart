import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AddToBagBtn,
        CartController,
        ImageCard,
        Product,
        ReadContext,
        StyleColors;
import 'package:sales_pkg/src/pages/product/widgets/sale_card.dart';
import 'sale_text.dart';

class SaleDetail extends StatelessWidget {
  const SaleDetail({
    super.key,
    required this.data,
    this.type = ViewType.saleView,
    required this.alignment,
    this.isAddedToCart = false,
    this.product,
    this.isDraft = false,
  });

  final Map<String, dynamic> data;
  final ViewType type;
  final CrossAxisAlignment alignment;
  final Product? product;
  final bool isAddedToCart;
  final bool isDraft;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: alignment,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ImageCard(
              image: product?.images?.first ?? data['image'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _getProductName(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: StyleColors.lukhuDark1,
                      ),
                    ),
                  ),
                  if (type == ViewType.productView && !isDraft)
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: Theme.of(context).colorScheme.scrim)
                ],
              ),
              if (type != ViewType.editView)
                SaleText(
                  title: 'Size:',
                  description: _getSizeInfo(),
                ),
              Row(
                children: [
                  Text(
                    _getPriceInfo(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: StyleColors.lukhuDark1,
                    ),
                  ),
                  const Spacer(),
                  if (type == ViewType.saleView && !isDraft)
                    AddToBagBtn(
                      activeCart: isAddedToCart,
                      onTap: () {
                        if (product != null) {
                          context.read<CartController>().addToCart(product!);
                        }
                      },
                    )
                ],
              ),
              if (type == ViewType.editView)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: SaleText(
                        title: 'Liked: ',
                        description: _getLikesCount(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: SaleText(
                        title: 'Item Views: ',
                        description: _getViewsCount(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: SaleText(
                        title: 'Offers: ',
                        description: '0',
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 25),
              if (type == ViewType.productView)
                SaleText(
                  title: 'Quantity:',
                  description: _getQuantityInfo(),
                ),
              if (isDraft)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'DRAFT',
                    style: TextStyle(
                      color: Colors.amber[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }

  String? _getProductImage() {
    if (product?.images?.isNotEmpty == true) {
      return product!.images!.first;
    }
    return data['image'] ?? null;
  }

  String _getProductName() {
    if (product?.label?.isNotEmpty == true) {
      return product!.label!;
    }
    if (data['name']?.isNotEmpty == true) {
      return data['name'];
    }
    return isDraft ? 'Untitled Product' : 'No Name';
  }

  String _getSizeInfo() {
    if (product?.availableSizes?.isNotEmpty == true) {
      return product!.availableSizes!.join(',');
    }
    if (data['size']?.isNotEmpty == true) {
      return data['size'];
    }
    return isDraft ? 'Not specified' : 'No size';
  }

  String _getPriceInfo() {
    if (product?.price != null) {
      return 'KSh ${product!.price!.toStringAsFixed(2)}';
    }
    if (data['price'] != null) {
      return 'KSh ${data['price']}';
    }
    return isDraft ? 'Price not set' : 'KSh 0.00';
  }

  String _getLikesCount() {
    if (product?.likes?.isNotEmpty == true) {
      return product!.likes!.length.toString();
    }
    if (data['liked'] != null) {
      return data['liked'].toString();
    }
    return '0';
  }

  String _getViewsCount() {
    if (product?.views?.isNotEmpty == true) {
      return product!.views!.length.toString();
    }
    if (data['views'] != null) {
      return data['views'].toString();
    }
    return '0';
  }

  String _getQuantityInfo() {
    if (product?.stock != null) {
      return product!.stock.toString();
    }
    if (data['quantity'] != null) {
      return data['quantity'].toString();
    }
    return isDraft ? 'Not set' : '0';
  }
}