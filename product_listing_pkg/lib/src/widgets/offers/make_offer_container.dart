import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        ConfirmationCard,
        DefaultBackButton,
        DefaultButton,
        DefaultInputField,
        DefaultPrefix,
        NavigationService,
        Product,
        ReadContext,
        StyleColors,
        UserRepository,
        WatchContext;
import 'package:product_listing_pkg/src/controller/offer_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';

import 'package:product_listing_pkg/utils/dialogues.dart';

import '../../../../utils/app_util.dart';
import '../../pages/product/pages/offer_view.dart';

class MakeOfferContainer extends StatelessWidget {
  const MakeOfferContainer({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var offerController = context.read<OfferController>();
    return FutureBuilder(
        future: context
            .read<ProductController>()
            .getSingleProduct(productId: id, isRefereshMode: true),
        builder: (context, snapshot) {
          var product = context.read<ProductController>().products[id];
          if (snapshot.hasData) {
            if (product == null) {
              return const Text('Product not available');
            }
          }
          return AnimatedPadding(
            duration: AppUtil.animationDuration,
            padding:
                EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 620,
              decoration: BoxDecoration(
                color: StyleColors.lukhuWhite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
              child: Form(
                key: offerController.offerFormKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14, right: 16, left: 16, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text('Make an offer',
                              style: TextStyle(
                                color: StyleColors.lukhuDark1,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                          DefaultBackButton(
                            assetIcon: AppUtil.iconClose,
                            packageName: AppUtil.packageName,
                          )
                        ],
                      ),
                    ),
                    Text('Once accepted, offers are valid for 24hrs',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: StyleColors.lukhuDark1,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        )),
                    const SizedBox(height: 16),
                    Divider(color: StyleColors.lukhuDividerColor),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            'Your Offer',
                            style: TextStyle(
                                color: StyleColors.lukhuDark1,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const Spacer(),
                          Text(
                            'Current Price: ',
                            style: TextStyle(
                                color: StyleColors.lukhuBlue,
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                          ),
                          Text(
                            'KSh ${product!.price}',
                            key: const Key('priceTag'),
                            style: TextStyle(
                                color: StyleColors.lukhuBlue,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DefaultInputField(
                        key: Key(AppUtil.offerInputTag),
                        controller: offerController.offerPricerController,
                        hintText: '4000',
                        border: InputBorder.none,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        prefix: const DefaultPrefix(text: 'KSh'),
                        onChange: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required!';
                          }
                          if (double.parse(value) > product.price!) {
                            return 'Offer price cannot be more than ${product.price!}';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: DefaultInputField(
                        radius: 4,
                        key: Key(AppUtil.offerDescriptionTag),
                        label: 'Add a message',
                        hintText: 'Please share more details (Optional)',
                        maxLines: 6,
                        onChange: (value) {},
                        controller: offerController.offerDescriptionController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 16, left: 16, right: 16),
                      child: DefaultButton(
                        key: Key(AppUtil.offerButtonTag),
                        loading: context.watch<OfferController>().isSubmitting,
                        onTap: offerController.allowOfer
                            ? () {
                                _addOffer(context, product);
                              }
                            : null,
                        color: StyleColors.lukhuBlue,
                        actionDissabledColor:
                            StyleColors.lukhuDisabledButtonColor,
                        label: 'Make Offer',
                        height: 40,
                        width: size.width - 32,
                        style: TextStyle(
                            color: StyleColors.lukhuWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: DefaultButton(
                        key:  Key(AppUtil.offerCancelTag),
                        onTap: () {
                          //context.read<FilterSortController>().filterTitle = null;
                          Navigator.of(context).pop();
                        },
                        label: 'Cancel',
                        color: StyleColors.lukhuWhite,
                        height: 40,
                        width: size.width - 32,
                        boarderColor: StyleColors.lukhuDividerColor,
                        textColor: StyleColors.lukhuDark1,
                      ),
                    ),
                    const SizedBox(height: 46)
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _addOffer(BuildContext context, Product product) {
    if (context.read<OfferController>().offerFormKey.currentState!.validate()) {
      context
          .read<OfferController>()
          .submitOffer(
              userId: context.read<UserRepository>().fbUser!.uid,
              originalProduct: product)
          .then((value) {
        if (value) {
  
          _showCard(context);
          context.read<OfferController>().init();
        } else {
          Navigator.of(context).pop();
        }
      });
    }
  }

  void _showCard(BuildContext context) {
    LukhuDialogue.blurredDialogue(
      distance: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ConfirmationCard(
          onPrimaryTap: () {
            Navigator.of(context).pop();
            Navigator.popUntil(
              context,
              (route) => route.isFirst,
            );
          },
          title: 'Your offer has been sent',
          description:
              'You made an offer for KSh 4,000. We will notify you once the seller responds',
          height: 310,
          primaryLabel: 'Continue Shopping',
          secondaryLabel: 'View My Offers',
          onSecondaryTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            NavigationService.navigate(context, OfferView.routeName);
          },
        ),
      ),
      context: context,
    );
  }
}
