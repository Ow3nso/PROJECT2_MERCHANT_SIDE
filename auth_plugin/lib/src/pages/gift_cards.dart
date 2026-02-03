import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:auth_plugin/src/pages/your_gifts.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        BlurDialogBody,
        ConfirmationCard,
        CustomColors,
        DefaultBackButton,
        DefaultButton,
        DefaultInputField,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StyleColors,
        WatchContext;

import '../utils/app_util.dart';
import '../widgets/buttons/default_call_btn.dart';
import '../widgets/gift_card/balance_card.dart';
import '../widgets/gift_card/gift_container.dart';
import '../widgets/gift_card/your_gift_tile.dart';
import 'terms_and_condition.dart';

class GiftCardPage extends StatelessWidget {
  const GiftCardPage({super.key});
  static const routeName = 'gift_card';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<GiftsController>();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Gift Cards",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        height: 90,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: DefaultCallBtn(),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              NavigationService.navigate(context, TermsConditionPage.routeName);
            },
          )
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 10),
              child: YourGiftTile(
                label: 'Your Gift Cards',
                onTap: () {
                  NavigationService.navigate(context, YourGiftPage.routeName);
                },
              ),
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              padding: const EdgeInsets.all(16),
              child: Form(
                key: controller.giftFormKey,
                child: Column(
                  children: [
                    DefaultInputField(
                      controller: controller.giftCardNumberController,
                      onChange: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Cannot be empty';
                        }
                        return null;
                      },
                      label: 'Gift Card Number',
                      hintText: '12937987378930',
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: DefaultInputField(
                        controller: controller.giftCardPinController,
                        onChange: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Cannot be empty';
                          }
                          return null;
                        },
                        label: 'Gift Card Pin',
                        hintText: '1234',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    DefaultButton(
                      label: 'Check Balance',
                      onTap: () {
                        validate(context);
                      },
                      color:
                          Theme.of(context).extension<CustomColors>()?.neutral,
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GiftContainer(
                label: 'Available Gift Cards',
                items: context.read<GiftsController>().availableGifts,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validate(BuildContext context) {
    if (context.read<GiftsController>().giftFormKey.currentState!.validate()) {
      if (context
          .read<GiftsController>()
          .giftCardPinController
          .text
          .isNotEmpty) {
        showBalanceCard(context);
      } else {
        show(
            context,
            ConfirmationCard(
              assetImage: AppUtil.alertIcon,
              color: StyleColors.lukhuError10,
              title: 'There was an error',
              description:
                  'Your Gift Card Number and PIN do not match. Tap the button below to retry.',
              primaryLabel: 'Retry',
              onPrimaryTap: () {
                Navigator.of(context).pop();
              },
              height: 300,
              secondaryLabel: 'Cancel',
              onSecondaryTap: () {
                Navigator.of(context).pop();
              },
            ));
      }
    }
  }

  void showBalanceCard(BuildContext context) {
    show(
      context,
      GiftCardBalance(
        label: 'Gift Card Balnce',
        onTap: () {},
        type: GiftType.verify,
      ),
    );
  }

  void show(BuildContext context, Widget child) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            child: child,
          );
        });
  }
}
