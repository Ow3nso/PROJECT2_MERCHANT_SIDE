import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CardOfferTile, DeliveryStatus, Offer, ReadContext;
import 'package:product_listing_pkg/src/controller/offer_controller.dart';

import '../../store/widgets/store_message.dart';

class OfferContainer<T> extends StatelessWidget {
  const OfferContainer(
      {super.key,
      required this.offers,
      this.future,
      required this.refresh,
      this.text = '',
      this.type});
  final Map<String, Offer> offers;
  final Future<T>? future;
  final Function() refresh;
  final DeliveryStatus? type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (_, snapshot) {
        var mainOffers = offers;
        if (snapshot.hasData) {
          if (mainOffers.isEmpty) {
            return StoreMessage(text: text);
          }
        }
    
        mainOffers = getOfferWithType(type);
        
        return RefreshIndicator(
          onRefresh: () {
            return getOffers();
          },
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: mainOffers.keys.length,
              itemBuilder: (context, index) {
                var offer = context
                    .read<OfferController>()
                    .getChildOffer(index, mainOffers);
                return CardOfferTile(
                  offer: offer,
                );
              }),
        );
      },
    );
  }

  Map<String, Offer> getOfferWithType(
    DeliveryStatus? type,
  ) {
    Map<String, Offer> offerType = {};

    for (var e in offers.values) {
      if (type == null && e.offerType != DeliveryStatus.approved) {
        offerType[e.id!] = e;
      } else if (e.offerType == type) {
        offerType[e.id!] = e;
      }
    }
    return offerType;
  }

  Future<void> getOffers() async {
    refresh();
  }
}
