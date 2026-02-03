import 'package:auth_plugin/src/controllers/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AddAddressCard,
        AppBarType,
        BlurDialogBody,
        BottomCard,
        DefaultBackButton,
        DefaultIconBtn,
        DefaultMessage,
        GlobalAppUtil,
        LocationController,
        LocationModel,
        LuhkuAppBar,
        ReadContext,
        ShortMessages,
        WatchContext;

import '../utils/app_util.dart';
import '../widgets/address/address_card.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({super.key});
  static const routeName = 'addresses';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Delivery Address",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: DefaultIconBtn(
              assetImage: AppUtil.callIcon,
              onTap: () {},
              packageName: GlobalAppUtil.productListingPackageName,
            ),
          ),
        ],
      ),
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
                future: context.read<LocationController>().getUserLocations(
                    userId: context.watch<UserRepository>().fbUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (context
                        .watch<LocationController>()
                        .userLocation
                        .isEmpty) {
                      return DefaultMessage(
                        assetImage: AppUtil.location,
                        packageName: GlobalAppUtil.productListingPackageName,
                        title: 'An error occured!',
                        description: '${snapshot.error ?? ''}',
                        label: 'Try again',
                        onTap: () {},
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<LocationController>().getUserLocations(
                            isrefreshMode: true,
                            userId: context.read<UserRepository>().fbUser!.uid);
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        itemCount: context
                            .watch<LocationController>()
                            .userLocation
                            .keys
                            .length,
                        itemBuilder: (context, index) {
                          var location = context
                              .read<LocationController>()
                              .getLocation(
                                  index,
                                  context
                                      .watch<LocationController>()
                                      .userLocation)!;
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: AddressCard(
                              location: location,
                              onDelete: () async {
                                _deleteLocation(context, location);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return DefaultMessage(
                      title: 'An error occured!',
                      description: '${snapshot.error ?? ''}',
                      label: 'Try again',
                      assetImage: AppUtil.location,
                      packageName: GlobalAppUtil.productListingPackageName,
                      onTap: () {
                        context.read<LocationController>().getUserLocations(
                            isrefreshMode: true,
                            userId: context.read<UserRepository>().fbUser!.uid);
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  // return ListView.builder(
                  //   padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                  //   itemBuilder: (context, index) {
                  //     var location = controller.address[index];
                  //     return AddressCard(
                  //       onDelete: () {
                  //         show(
                  //           context,
                  //           ConfirmationCard(
                  //             title: 'Your address has been deleted',
                  //             height: 300,
                  //             description:
                  //                 'Tap below to add a new address or go back to your account settings.',
                  //             primaryLabel: 'Add Address',
                  //             secondaryLabel: 'Cancel',
                  //             onPrimaryTap: () {
                  //               Navigator.of(context).pop(true);
                  //               show(context, const AddAddressCard());
                  //             },
                  //             onSecondaryTap: () {
                  //               Navigator.of(context).pop(true);
                  //             },
                  //           ),
                  //         );
                  //       },
                  //       onTap: () {
                  //         show(context, const AddAddressCard());
                  //       },
                  //     );
                  //   },
                  //   itemCount: controller.address.length,
                  // );
                }),
          )),
      bottomSheet: BottomCard(
        label: 'Add New Address',
        height: 140,
        onTap: () {
          show(context, const AddAddressCard());
        },
      ),
    );
  }

  void _deleteLocation(BuildContext context, LocationModel location) {
    context.read<LocationController>().location = location;
    ShortMessages.showShortMessage(
      message: 'Deleting ${location.location} in progress...',
    );
    Future.delayed(const Duration(milliseconds: 400));
    context.read<LocationController>().deleteLocation().then((value) {
      if (value) {
        context.read<LocationController>().userLocation.remove(location.id);
        return;
      } else {
        ShortMessages.showShortMessage(
            message: 'Something happened. Please try again!.');
      }
    });
  }

  void show(BuildContext context, Widget child) {
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
        });
  }
}
