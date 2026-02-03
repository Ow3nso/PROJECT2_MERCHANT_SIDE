import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, CardOfferViewType, DefaultBackButton, DefaultButton, DefaultIconBtn, LuhkuAppBar, OrderType, StyleColors;
import 'package:product_listing_pkg/src/widgets/offers/card_offer_tile.dart';

import '../../../../utils/app_util.dart';
import '../widgets/order_illustration.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const routeName = 'order_view';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    var illustration = data['illustration'] as List;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        height: 135,
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        backAction: const DefaultBackButton(),
        bottom: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Order',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: StyleColors.lukhuDark1,
                      ),
                    ),
                    DefaultIconBtn(
                      assetImage: AppUtil.iconCalling,
                      packageName: AppUtil.packageName,
                      onTap: () {},
                      radius: 15,
                      backgroundColor: StyleColors.lukhuDark,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      CardOfferTile(
                        data: data,
                        showStore: true,
                        type: CardOfferViewType.order,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ...List.generate(illustration.length, (index) {
                        var illustrationData = illustration[index];

                        return OrderIllustration(
                            data: illustrationData,
                            index: index,
                            type: illustrationData['type'] as OrderType);
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      DefaultButton(
                        onTap: () {},
                        color: StyleColors.lukhuBlue,
                        label: 'Track Order',
                        height: 40,
                        width: size.width,
                        style: TextStyle(
                            color: StyleColors.lukhuWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                          color: StyleColors.lukhuDividerColor,
                          boxShadow: kElevationToShadow[4]),
                      child: Row(children: [
                        Expanded(
                          child: Container(),
                        )
                      ]),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    DefaultButton(
                      onTap: () {},
                      color: StyleColors.lukhuBlue,
                      label: 'Message Seller',
                      height: 40,
                      width: size.width - 32,
                      style: TextStyle(
                          color: StyleColors.lukhuWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
