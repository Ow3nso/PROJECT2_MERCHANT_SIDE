import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        Consumer,
        DefaultInputField,
        ReadContext,
        ShortMessages,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';
import 'package:product_listing_pkg/src/controller/location_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/checkout_pop_card.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';

import '../../../../../utils/app_util.dart';
import '../../../../controller/product_controller.dart';
import '../checkout_process/delivery_tile_card.dart';
import '../label_card.dart';
import 'user_location.dart';

class HomePickUp extends StatelessWidget {
  const HomePickUp({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var locationController = context.read<LocationController>();
    return Consumer<CheckoutController>(
        builder: (context, checkoutController, _) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            locationController.userLocation.isEmpty
                ? DefaultInputField(
                    onChange: (value) {},
                    onTap: () {
                      show(context, onTap: () {
                        context
                            .read<LocationController>()
                            .validateLoation(context);
                      },
                          title: 'Set your address',
                          description:
                              'Search for your location below and select it',
                          label: 'Select Location');
                    },
                    controller: locationController.locationController,
                    hintText: 'Select yout location',
                    readOnly: true,
                    prefix: Image.asset(
                      AppUtil.locationOutlined,
                      package: AppUtil.packageName,
                      height: 20,
                      width: 20,
                    ),
                    textInputAction: TextInputAction.done,
                  )
                : UserLocation(
                    onTap: () {
                      locationController.location = locationController.location!
                          .copyWith(isSelected: true);
                      locationController
                              .userLocation[locationController.location!.id!] =
                          locationController.location!;
                    },
                    location: context.watch<LocationController>().location!),
            const SizedBox(height: 16),
            locationController.userLocation.isEmpty
                ? DefaultInputField(
                    controller: locationController.buildingHouseController,
                    onChange: (value) {},
                    hintText: 'Building/House Number',
                    textInputAction: TextInputAction.done,
                  )
                : DeliveryTileCard(
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    onTap: () {
                      show(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        context,
                        callback: () {
                          Navigator.of(context).pop();
                          Future.delayed(const Duration(milliseconds: 350));
                          show(context,
                              height: 550,
                              type: CheckoutPopType.newAddress,
                              title: 'Add an address',
                              description:
                                  'Search for your location below and select it.',
                              label: 'Add an address', onTap: () {
                            Navigator.of(context).pop();
                            locationController.addLocation(
                              userId: context.read<ProductController>().userId!,
                            );
                          });
                        },
                        title: 'Your addreses',
                        type: CheckoutPopType.addresses,
                        description:
                            'Pick your ideal delivery address or add a new one that is convenient for you.',
                        label: 'Select Delivery Address',
                      );
                    },
                    iconSize: 14,
                    child: Text(
                      'Change Address',
                      style: TextStyle(
                        color: StyleColors.lukhuGrey80,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
            const SizedBox(height: 16),
            if (locationController.userLocation.isEmpty)
              Text(
                'Label this location',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: StyleColors.lukhuDark1,
                  fontSize: 12,
                ),
              ),
            const SizedBox(height: 16),
            if (locationController.userLocation.isEmpty)
              LabelCard(onTap: () {
                if (locationController.locationController.text.isEmpty) {
                  ShortMessages.showShortMessage(
                      message: 'Add a valid location');
                  return;
                }
                locationController.addLocation(
                    userId: context.read<ProductController>().userId!);
                Future.delayed(const Duration(seconds: 2), () {
                  if (onTap != null) {
                    onTap!();
                  }
                });
              })
          ],
        ),
      );
    });
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
          height: height ?? 460,
          title: title,
          label: label,
          description: description,
          onTap: onTap,
        ),
      ),
    );
  }
}
