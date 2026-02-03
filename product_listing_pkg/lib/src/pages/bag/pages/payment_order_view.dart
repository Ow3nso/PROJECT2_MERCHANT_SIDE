import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        LuhkuAppBar,
        PaymentCommand,
        StyleColors;

import 'package:product_listing_pkg/src/pages/bag/widgets/payment/forder_image.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/payment/order_detail.dart.dart';

import '../widgets/payment/support_button.dart';

class PaymentOrderView extends StatefulWidget {
  const PaymentOrderView({super.key});
  static const routeName = 'payment_order';

  @override
  State<PaymentOrderView> createState() => _PaymentOrderViewState();
}

class _PaymentOrderViewState extends State<PaymentOrderView> {
  late PaymentCommand _paymentCommand;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _paymentCommand = PaymentCommand(context);
      _paymentCommand.insert();
    });
  }

  @override
  void dispose() {
    _paymentCommand.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _reset(context);

        return true;
      },
      child: Scaffold(
          backgroundColor: StyleColors.lukhuBlue,
          appBar: LuhkuAppBar(
            color: Theme.of(context).colorScheme.onPrimary,
            enableShadow: true,
            backAction: DefaultBackButton(
              onTap: () {
                _reset(context);
              },
            ),
            title: Text(
              'Order Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            appBarType: AppBarType.other,
          ),
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 16,
                        right: 16,
                      ),
                      child: Container(
                        height: 550.0,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          color: StyleColors.lukhuWhite,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: OrderImage(),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: OrderDetail(),
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SupportButton(),
                ),
              ],
            ),
          )),
    );
  }

  void _reset(BuildContext context) async {
    PaymentCommand(context).clear().then((value) {
      if (value) {
        Navigator.popUntil(
          context,
          (route) => route.isFirst,
        );
      }
    });
  }
}
