import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        Consumer,
        DefaultBackButton,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StyleColors,
        UserType,
        WatchContext;
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/src/controller/location_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import '../widgets/bag_message.dart';
import '../widgets/billing_card.dart';
import '../widgets/cart_card.dart';
import 'checkouk_view.dart';

class BagView extends StatefulWidget {
  const BagView({super.key});
  static const routeName = 'bag_view';

  @override
  State<BagView> createState() => _BagViewState();
}

class _BagViewState extends State<BagView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var userId = context.read<ProductController>().userId ?? '';
      context.read<LocationController>().getUserLocations(userId: userId);
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userType =
        ModalRoute.of(context)!.settings.arguments as Map<String, UserType>;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        enableShadow: true,
        title: Text(
          'Your Bag',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: StyleColors.lukhuDark1,
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Consumer<CartController>(
          builder: (context, cartController, _) {
            return Column(
              children: [
                Expanded(
                  flex: 6,
                  child: cartController.cart.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ListView.builder(
                            itemCount: cartController.cartCount,
                            itemBuilder: (context, index) {
                              var cartProduct = context
                                  .read<ProductController>()
                                  .product(index, cartController.cart);
                              return CartCard(cartProduct: cartProduct!);
                            },
                          ),
                        )
                      : const BagMessage(),
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: context.watch<CartController>().cart.isNotEmpty
          ? BillingCard(
              label: 'Checkout',
              onTap: context.watch<CartController>().cart.isNotEmpty
                  ? () {
                      NavigationService.navigate(
                          context, CheckoutView.routeName,
                          arguments: {'type': (userType['type'] as UserType)});
                    }
                  : null)
          : null,
    );
  }
}
