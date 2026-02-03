import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Consumer, DefaultInputField;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import '../../../../utils/card_util.dart';
import '../../../../utils/text_formatter.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutController>(
        builder: (context, checkoutController, _) {
      return Column(
        children: [
          DefaultInputField(
            label: 'Name on card',
            controller: checkoutController.nameController,
            hintText: '',
            onChange: (value) {},
          ),
          const SizedBox(
            height: 16,
          ),
          DefaultInputField(
            label: 'Card number',
            validator: CardUtil.validateCardNum,
            prefix: CardUtil.getCardIcon(checkoutController.cardType),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            textInputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              CardNumberInputFormatter(),
              LengthLimitingTextInputFormatter(19)
            ],
            controller: checkoutController.cardNumberController,
            hintText: '',
            onChange: (value) {
              if (value!.isNotEmpty) {
                checkoutController.cardType =
                    CardUtil.getCardTypeFromNumber(value);

                checkoutController.choosePayment(
                    checkoutController.chosenPaymentOption!, value);
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: DefaultInputField(
                  label: 'CVV',
                  controller: checkoutController.cvvController,
                  hintText: '',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onChange: (value) {},
                  textInputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: DefaultInputField(
                  label: 'Expiry',
                  controller: checkoutController.expiryController,
                  hintText: '',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  textInputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardMonthInputFormatter()
                  ],
                  onChange: (value) {},
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
