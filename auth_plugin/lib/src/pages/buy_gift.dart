import 'dart:developer';

import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:auth_plugin/src/widgets/gift_card/gift_text.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        BottomCard,
        CustomColors,
        DefaultBackButton,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StyleColors,
        WatchContext;

import '../utils/app_util.dart';
import '../widgets/gift_card/select_gift.dart';
import 'pay_gift.dart';

class BuyGiftPage extends StatelessWidget {
  const BuyGiftPage({super.key});
  static const routeName = 'buy_gift';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final data = args['gift'] as Map<String, dynamic>;
    log('[DART]$data');
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Buy a Gift Card",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        height: 90,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => () {},
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: size.width,
                padding: const EdgeInsets.only(
                    top: 23, left: 44, right: 44, bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary),
                child: Image.asset(
                  data['image'],
                  package: AppUtil.packageName,
                  fit: BoxFit.cover,
                  width: size.width,
                  height: 160,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: size.width,
                padding: const EdgeInsets.only(
                    top: 10, left: 16, right: 16, bottom: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary),
                child: GiftText(
                  alignment: MainAxisAlignment.spaceBetween,
                  title: 'Gift Card Amount',
                  description:
                      'KSh ${context.watch<GiftsController>().selectedGiftLabel}',
                ),
              ),
            ),
            Container(
                width: size.width,
                padding: const EdgeInsets.only(
                    top: 10, left: 16, right: 16, bottom: 10),
                child: const SelectGift()),
            Container(
              width: size.width,
              height: 180,
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Select Recipient',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.scrim,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  const Divider(),
                  ListView.separated(
                    separatorBuilder: (context, index) =>
                        Divider(color: StyleColors.lukhuDividerColor),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: Recipient.values.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return RadioListTile<Recipient>(
                        activeColor: Theme.of(context)
                            .extension<CustomColors>()
                            ?.neutral,
                        contentPadding: EdgeInsets.zero,
                        value: Recipient.values[index],
                        groupValue: context.watch<GiftsController>().recipient,
                        onChanged: (value) {
                          context.read<GiftsController>().recipient = value;
                        },
                        title: Text(
                          context
                              .read<GiftsController>()
                              .getRecipient(Recipient.values[index]),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.scrim,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: BottomCard(
        label: 'Buy Gift Card',
        onTap: context.watch<GiftsController>().recipient == null
            ? null
            : () {
                NavigationService.navigate(context, PayGiftPage.routeName);
              },
        height: 140,
      ),
    );
  }
}
