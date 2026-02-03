import 'package:auth_plugin/src/controllers/settings/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        DefaultButton,
        DefaultInputField,
        DefaultPrefix,
        GlobalAppUtil,
        LocationController,
        MapCard,
        ReadContext,
        ShortMessages,
        StyleColors,
        UserRepository,
        WatchContext;

import '../../utils/app_util.dart';
import 'location_category.dart';

class AddAddressCard extends StatelessWidget {
  const AddAddressCard(
      {super.key,
      this.showPhone = false,
      this.title,
      this.description,
      this.isCustomerAddress = false});
  final bool showPhone;
  final String? title, description;
  final bool isCustomerAddress;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<AddressController>();
    return AnimatedPadding(
      duration: AppUtil.animationDuration,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: size.width,
        height: showPhone ? 585 : 512,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: Form(
          key: context.watch<LocationController>().setLocationFormKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(title ?? 'Add an address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.scrim,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: Text(
                    description ??
                        'Search for your location below and select it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
              ),
              const MapCard(),
              Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: DefaultInputField(
                    keyboardType: TextInputType.streetAddress,
                    controller:
                        context.watch<LocationController>().locationController,
                    onChange: (value) {},
                    prefix: Image.asset(
                      AppUtil.location,
                      package: GlobalAppUtil.productListingPackageName,
                    ),
                    hintText: 'Select your location',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    },
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: DefaultInputField(
                  keyboardType: TextInputType.text,
                  controller: context
                      .watch<LocationController>()
                      .buildingHouseController,
                  onChange: (value) {},
                  hintText: 'Building/House Number',
                ),
              ),
              if (showPhone)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: DefaultInputField(
                    keyboardType: TextInputType.phone,
                    controller: context
                        .watch<LocationController>()
                        .phoneNumberController,
                    onChange: (value) {},
                    prefix: const DefaultPrefix(text: '+254'),
                    hintText: '0712 345 678',
                  ),
                ),
              LocationCategory(
                locationCategory: controller.locationCategory,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, top: 8),
                child: DefaultButton(
                  loading: context.watch<LocationController>().uploading,
                  label: 'Add Address',
                  actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  onTap: context
                          .watch<LocationController>()
                          .locationController
                          .text
                          .isEmpty
                      ? null
                      : () {
                          _addLocation(context);
                        },
                  width: size.width - 32,
                  height: 40,
                  color: Theme.of(context).extension<CustomColors>()?.neutral,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DefaultButton(
                  label: 'Cancel',
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  width: size.width - 32,
                  height: 40,
                  textColor: Theme.of(context).colorScheme.scrim,
                  boarderColor: StyleColors.lukhuDividerColor,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addLocation(BuildContext context) async {
    context.read<LocationController>().retainLocation = isCustomerAddress;
    if (context
        .read<LocationController>()
        .setLocationFormKey
        .currentState!
        .validate()) {
      context
          .read<LocationController>()
          .addLocation(
            userId: context.read<UserRepository>().fbUser!.uid,
            status: isCustomerAddress,
          )
          .then((value) {
        if (value) {
          context.read<LocationController>().clear();

          Navigator.of(context).pop(true);
          return;
        }
      });
    } else {
      ShortMessages.showShortMessage(message: 'Provide a valid location!.');
    }
  }
}
