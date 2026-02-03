import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AccountType,
        AppBarType,
        // ConfirmationCard,
        DefaultBackButton,
        DefaultCallBtn,
        DefaultIconBtn,
        LoaderCard,
        LuhkuAppBar,
        ReadContext,
        ShortMessages,
        StepperTitle,
        StyleColors,
        UserType,
        WatchContext;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';
import 'package:product_listing_pkg/src/controller/location_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/billing_card.dart';

import '../../../../utils/app_util.dart';
import '../../../controller/cart_controller.dart';
import '../widgets/checkout_process/delivery_card.dart';

import '../widgets/checkout_process/payment_section.dart';
import '../widgets/checkout_process/review_card_section.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});
  static const routeName = 'checkout_view';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  PageController pageController = PageController();
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var userId = context.read<ProductController>().userId ?? '';
      context.read<LocationController>().getUserLocations(userId: userId);
      context.read<CheckoutController>().paymentType = null;
      context.read<CheckoutController>().resetCheckoutProcess();
      _setPage(_selectIndex);
      _pickLocation();
    });
  }

  void _pickLocation() {
    var controller = context.read<LocationController>();
    if (controller.userLocation.isNotEmpty) {
      controller.resetLocation();
      controller.location = controller.userLocation.values.first;
      controller.location = controller.location;
    }
  }

  void _setPage(int index) {
    setState(() {
      _selectIndex = index;
    });
    // pageController.animateToPage(
    //   index,
    //   curve: Curves.bounceIn,
    //   duration: AppUtil.animationDuration,
    // );
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.read<LocationController>();
    var checkoutController = context.read<CheckoutController>();
    var size = MediaQuery.of(context).size;
    var checkoutProcess = ['Delivery', 'Payment', 'Review'];
    var userType =
        ModalRoute.of(context)!.settings.arguments as Map<String, UserType>;
    var process = context.watch<CheckoutController>().checkoutProcess;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Scaffold(
              appBar: LuhkuAppBar(
                appBarType: AppBarType.other,
                backAction: const DefaultBackButton(),
                centerTitle: true,
                title: Text(
                  (userType['type'] as UserType).name == 'buyer'
                      ? 'Checkout'
                      : 'Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: StyleColors.lukhuDark1,
                  ),
                ),
                actions: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: DefaultCallBtn(),
                  ),
                  if ((userType['type'] as UserType).name == 'buyer')
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: DefaultIconBtn(
                        radius: 12,
                        assetImage: AppUtil.iconMessage,
                        packageName: AppUtil.packageName,
                        onTap: () {},
                      ),
                    ),
                ],
              ),
              body: SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    if ((userType['type'] as UserType).name == 'buyer')
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: StyleColors.lukhuDividerColor))),
                        padding: const EdgeInsets.only(
                            top: 12, right: 16, left: 16, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(process.length, (index) {
                            return StepperTitle(
                              data: process[index],
                              onTap: () {
                                _navigate(index, true);
                              },
                              index: index + 1,
                              title: checkoutProcess[index],
                              isActive: _selectIndex == index,
                              showDivider: index != checkoutProcess.length - 1,
                            );
                          }),
                        ),
                      ),
                    Expanded(
                      child: (userType['type'] as UserType).name == 'buyer'
                          ? PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: pageController,
                              itemCount: _views.length,
                              itemBuilder: (context, index) {
                                return _views[index];
                              },
                            )
                          : const PaymentSection(),
                    ),
                  ],
                ),
              ),
              bottomSheet: View.of(context).viewInsets.bottom > 0.0
                  ? null
                  : BillingCard(
                      index: _selectIndex,
                      label: _selectIndex != 2 ? 'Pay Now' : 'Complete Order',
                      onTap: () {
                        if (_selectIndex == 0) {
                          _setAddress(controller, checkoutController);
                          return;
                        }
                        if (_selectIndex == 1) {
                          _payNow(checkoutController);
                          return;
                        }

                        if (_selectIndex == 2) {
                          _completeOrder(checkoutController.paymentType!);
                        }
                      },
                      type: BillingCartType.checkout,
                    ),
            ),
            if (context.watch<CartController>().uploading)
              const Positioned(
                child: LoaderCard(
                  title:
                      'You’re almost there! We are processing your order payment',
                ),
              ),
            if (context.watch<CheckoutController>().allowTransaction)
              const Positioned(
                child: LoaderCard(
                  title: 'You’re almost there! We are processing your payment.',
                ),
              )
          ],
        ),
      ),
    );
  }

  void _setAddress(
      LocationController controller, CheckoutController checkoutController) {
    if (controller.location!.isSelected ?? false) {
      checkoutController.checkDetails(() {
        _setPage(1);
      }, 1, true);
    } else {
      ShortMessages.showShortMessage(message: 'Select a valid address!');
      return;
    }
  }

  void _payNow(CheckoutController checkoutController) {
    if (checkoutController.paymentType != null) {
      checkoutController.allowTransaction = true;
      checkoutController.startTimer(() {
        _setPage(2);
        pageController.animateToPage(
          2,
          curve: Curves.bounceIn,
          duration: AppUtil.animationDuration,
        );
      }, 1);
    } else {
      ShortMessages.showShortMessage(message: 'Selecta a valid payment method');
      return;
    }
  }

  void _completeOrder(AccountType type) {
    context.read<CartController>().addOrder();
  }

  void _navigate(int index, bool value) {
    context.read<CheckoutController>().checkDetails(() {
      _setPage(index);
    }, index, value);
  }

  List<Widget> get _views => [
        DeliveryCard(
          onTap: () {
            _navigate(1, true);
          },
        ),
        const PaymentSection(),
        const ReviewCardSection()
      ];
}
