import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CardOfferViewType,
        DateFormat,
        DeliveryStatus,
        Offer,
        StyleColors,
        SvgPicture;
import 'package:product_listing_pkg/src/widgets/offers/delivery_status_card.dart';

import '../../../utils/app_util.dart';
import '../product_image_holder.dart';
import 'offer_text_tile.dart';

// enum CardOfferViewType { offer, notification, promotion, updates, order }

// enum DeliveryStatus { pending, shipping, delivered, cancelled, none }

class CardOfferTile extends StatelessWidget {
  const CardOfferTile(
      {super.key,
      
      this.showStore = false,
      this.type = CardOfferViewType.offer,
      this.data,
      this.statusType = DeliveryStatus.pending,
      this.offer,
      this.onTap});
  final CardOfferViewType type;
  final DeliveryStatus statusType;
  final void Function()? onTap;
  final Map<String, dynamic>? data;
  final bool showStore;
  final Offer? offer;

  @override
  Widget build(BuildContext context) {
    bool isRead = data == null ? false : data!['isRead'];
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
              color: isRead ? StyleColors.lukhuGrey10 : StyleColors.lukhuWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: StyleColors.lukhuDividerColor)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type == CardOfferViewType.offer ||
                  type == CardOfferViewType.order)
                ProductImageHolder(
                  type: type,
                  imageUrl:
                      data == null ? offer!.images!.first : data!['image'],
                  height: showStore ? 90 : 79,
                  productId: offer == null ? null : offer!.productId,
                  width: showStore ? 90 : 79,
                  isProductInDiscovery: true,
                  isReadNotification: isRead,
                  fit: BoxFit.cover,
                ),
              if (type != CardOfferViewType.offer &&
                  type != CardOfferViewType.order)
                CircleAvatar(
                  radius: 14,
                  backgroundColor: type == CardOfferViewType.promotion
                      ? isRead
                          ? StyleColors.lukhuWhite
                          : StyleColors.lukhuRuby10
                      : isRead
                          ? StyleColors.lukhuWhite
                          : StyleColors.lukhuBlue0,
                  child: SvgPicture.asset(
                    type == CardOfferViewType.promotion
                        ? AppUtil.iconTicketDiscount
                        : AppUtil.iconInfo,
                    package: AppUtil.packageName,
                    height: 20,
                    width: 20,
                    // ignore: deprecated_member_use
                    color: isRead ? StyleColors.lukhuGrey50 : null,
                  ),
                ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (type == CardOfferViewType.offer ||
                        type == CardOfferViewType.order)
                      StatusCard(
                        width: 80,
                        // isRead: isRead,
                        type: offer == null ? statusType : offer!.offerType!,
                      ),
                    if (showStore)
                      const SizedBox(
                        height: 10,
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            (type != CardOfferViewType.offer
                                ? '${data!['title']} '
                                : 'Your Offer: KSH ${offer!.offerPrice}'),
                            style: TextStyle(
                                color: type == CardOfferViewType.order
                                    ? StyleColors.gray90
                                    : isRead
                                        ? StyleColors.lukhuPriceColor
                                        : StyleColors.gray90,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        Text(
                          type != CardOfferViewType.offer
                              ? data!['time'] ?? ''
                              : DateFormat('HH:mm ').format(offer!.createdAt!),
                          style: TextStyle(
                              color: isRead
                                  ? StyleColors.lukhuPriceColor
                                  : StyleColors.lukhuGrey500,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        )
                      ],
                    ),
                    if (!showStore)
                      Text(
                        type != CardOfferViewType.offer
                            ? data!['description'] ?? ''
                            : offer!.description,
                        style: TextStyle(
                            color: isRead
                                ? StyleColors.lukhuPriceColor
                                : StyleColors.lukhuGrey500,
                            fontSize: 16),
                      ),
                    if (showStore)
                      OfferTextTile(
                        title: 'Order Number: ',
                        description: data!['order_no'],
                      ),
                    if (showStore)
                      OfferTextTile(
                        title: 'Store Name: ',
                        description: data!['store'],
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
