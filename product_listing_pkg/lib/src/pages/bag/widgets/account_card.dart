import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show CircularCheckbox, DefaultTextBtn, ReadContext, StyleColors;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';
import '../../../../utils/app_util.dart';
import '../../../../utils/dialogues.dart';
import 'checkout_pop_card.dart';

enum AccountCardType { payment, review }

enum CardType { mpesa, mastercard, visa, debit, invalid }

class AccountCard extends StatelessWidget {
  const AccountCard({
    super.key,
    required this.data,
    this.isSelected = false,
    this.type = AccountCardType.payment,
    this.backgroundColor,
  });
  final Map<String, dynamic> data;
  final bool isSelected;
  final AccountCardType type;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CheckoutController>().choosePayment(data);
        if (data['account'] == '') {}
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ??
                (isSelected ? StyleColors.lukhuBlue0 : StyleColors.lukhuWhite),
            border: Border.all(
                color: isSelected
                    ? StyleColors.lukhuDisabledButtonColor
                    : StyleColors.lukhuDividerColor),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                  color: StyleColors.lukhuWhite,
                  border: Border.all(color: StyleColors.lukhuDividerColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(
                  data['image'],
                  width: 60,
                  height: 15,
                  package: AppUtil.packageName,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (type == AccountCardType.review)
                      Text(
                        'Payment Details',
                        style: TextStyle(
                          color: StyleColors.lukhuGrey60,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data['name']} ${data['account'] == '' ? '' : '- ${data['account']}'}',
                          style: TextStyle(
                            color: data['account'] != '' &&
                                    type == AccountCardType.payment
                                ? isSelected
                                    ? StyleColors.lukhuBlue
                                    : StyleColors.gray90
                                : StyleColors.gray90,
                            fontWeight: data['account'] == ''
                                ? FontWeight.w500
                                : FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        if (type == AccountCardType.payment)
                          CircularCheckbox(
                            isChecked: isSelected,
                          )
                      ],
                    ),
                    if (type == AccountCardType.review)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: DefaultTextBtn(
                          onTap: () {
                            show(
                              context,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              height: 510,
                              title: 'Add your credit/debit card',
                              description: 'Enter your card details below.',
                              label: 'Add Card',
                              type: CheckoutPopType.payment,
                            );
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: StyleColors.lukhuBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    if (type == AccountCardType.payment)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            DefaultTextBtn(
                              onTap: () {
                                if (data['account'] != '') return;

                                show(
                                  context,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  height: 510,
                                  title: 'Add your credit/debit card',
                                  description: 'Enter your card details below.',
                                  label: 'Add Card',
                                  type: CheckoutPopType.payment,
                                );
                              },
                              child: Text(
                                data['account'] == ''
                                    ? 'Enter card details'
                                    : 'Set as default',
                                style: TextStyle(
                                  color: data['account'] == ''
                                      ? StyleColors.lukhuBlue
                                      : isSelected
                                          ? StyleColors.lukhuBlue50
                                          : StyleColors.lukhuGrey500,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            if (data['account'] != '')
                              DefaultTextBtn(
                                onTap: () {
                                  show(
                                    context,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    height: 510,
                                    title: 'Add your credit/debit card',
                                    description:
                                        'Enter your card details below.',
                                    label: 'Add Card',
                                    type: CheckoutPopType.payment,
                                  );
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    color: StyleColors.lukhuBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void show(BuildContext context,
      {required String title,
      required String description,
      required String label,
      double? height,
      CheckoutPopType type = CheckoutPopType.address,
      void Function()? callback,
      void Function()? onTap}) async {
    LukhuDialogue.blurredDialogue(
      context: context,
      distance: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CheckoutPopCard(
          callback: callback,
          type: type,
          height: height ?? 440,
          title: title,
          label: label,
          description: description,
          onTap: onTap,
        ),
      ),
    );
  }
}
