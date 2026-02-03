import 'package:auth_plugin/src/widgets/blur_dialog_body.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AddNumber, ConfirmationCard, PaymentOptionTile, ReadContext, StyleColors, WatchContext;

import '../../controllers/gift/gifts_controller.dart';
import '../../utils/app_util.dart';
import 'balance_description.dart';

class SelectPayment extends StatelessWidget {
  const SelectPayment({super.key, this.data = const []});
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<GiftsController>();
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
          child: Text(
            'Select a Payment Method',
            style: TextStyle(
              color: Theme.of(context).colorScheme.scrim,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(right: 16, left: 16),
          itemBuilder: (context, index) {
            var data = controller.paymentOptions[index];
            return Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: PaymentOptionTile(
                data: data,
                onTap: () {
                  context.read<GiftsController>().selectedPayment = index;
                  _showAddNumber(context, index);
                },
                isChecked: controller.selectedPayment == index,
              ),
            );
          },
          itemCount: controller.paymentOptions.length,
        ),
      ],
    );
  }

  void _show(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (ctx) {
        return BlurDialogBody(
          bottomDistance: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        );
      },
    );
  }

  void _showAddNumber(BuildContext context, int index) {
    var controller = context.read<GiftsController>();
    Widget child = Container();
    if (index == 0) {
      child = ConfirmationCard(
        title: 'Your wallet balance is insufficient',
        description:
            'Continue to select a payment method to complete your payment of KSh 500',
        onPrimaryTap: () {
          Navigator.of(context).pop();
          controller.hasBalance = false;
        },
        packageName: AppUtil.packageName,
        assetImage: AppUtil.infoIcon,
        primaryLabel: 'Continue',
        color: StyleColors.lukhuWarning10,
        onSecondaryTap: () {
          Navigator.of(context).pop();
        },
        secondaryLabel: 'Cancel',
        height: 366,
        child: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: BalanceTile(),
        ),
      );
    } else {
      child = AddNumber(
        label: 'Add Phone Number',
        onTap: (value) {
          if (value != null) {
            Navigator.of(context).pop();
            controller.setPaymentMethod(index, value);
          }
        },
      );
    }
    _show(context, child);
  }
}
