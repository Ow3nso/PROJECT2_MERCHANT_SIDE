import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AccountType,
        AddCard,
        AddNumber,
        Consumer,
        DefaultInputField,
        DefaultTextBtn,
        PaymentOptionTile,
        ReadContext,
        StyleColors,
        UserType,
        WatchContext;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import '../../../../../utils/dialogues.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, this.userType = UserType.buyer});
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutController>(
        builder: (context, checkoutController, _) {
      var options = context.watch<CheckoutController>().paymentOptions;
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Choose a payment method',
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            ...List.generate(options.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PaymentOptionTile(
                  data: options[index],
                  isChecked: options[index]['isSelected'],
                  onTap: () {
                    checkoutController.choosePayment(options[index]);
                    _showCard(context, options[index]['type'], index);
                  },
                ),
              );
            }),
            const SizedBox(height: 16),
            DefaultInputField(
              onChange: (value) => checkoutController.setState(),
              controller: checkoutController.discountController,
              suffix: checkoutController.hasDiscount
                  ? DefaultTextBtn(
                      onTap: () {},
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: StyleColors.lukhuBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ))
                  : null,
              label: 'Discount code',
              hintText: 'Enter discount code here',
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (p0) {},
            )
          ],
        ),
      );
    });
  }

  void _showCard(BuildContext context, AccountType type, int index) {
    Widget? child;
    if (type == AccountType.mpesa) {
      child = AddNumber(
        label: 'Add Phone',
        onTap: (value) {
          if (value != null) {
            var data = value as Map<String, dynamic>;
            context
                .read<CheckoutController>()
                .addAddAccount(index, data['account']);
          }
          Navigator.of(context).pop();
        },
      );
    } else {
      child = AddCard(
        label: 'Add Card',
        onTap: (value) {
          if (value != null) {
            var data = value as Map<String, dynamic>;
            context
                .read<CheckoutController>()
                .addAddAccount(index, data['account']);
          }
          Navigator.of(context).pop();
        },
      );
    }

    show(context, child);
  }

  void show(BuildContext context, Widget child) {
    LukhuDialogue.blurredDialogue(
      context: context,
      distance: 80,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16), child: child),
    );
  }
}
