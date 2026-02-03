import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CameraPosition,
        DefaultInputField,
        GoogleMap,
        GoogleMapController,
        Helpers,
        LatLng,
        MapType,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/location_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/checkout_pop_card.dart';
import '../../../../utils/app_util.dart';
import '../../../controller/checkout_controller.dart';
import 'label_card.dart';

class MapCard extends StatelessWidget {
  const MapCard({super.key, this.type});
  final CheckoutPopType? type;

  @override
  Widget build(BuildContext context) {
    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    return Form(
      key: context.read<LocationController>().setLocationFormKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: StyleColors.lukhuGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                liteModeEnabled: true,
                compassEnabled: false,
                mapToolbarEnabled: false,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {},
              ),
            ),
          ),
          const SizedBox(height: 16),
          DefaultInputField(
            controller: context.watch<LocationController>().locationController,
            hintText: 'Select your location',
            onChange: (value) {},
            validator: (value) {
              if (value!.isEmpty) {
                return 'Location cannot be empty!';
              }
              return null;
            },
            prefix: Image.asset(
              AppUtil.locationOutlined,
              package: AppUtil.packageName,
              height: 20,
              width: 20,
            ),
            textInputAction: TextInputAction.done,
          ),
          if (type == CheckoutPopType.newAddress)
            Column(
              children: [
                const SizedBox(height: 16),
                DefaultInputField(
                  controller: context
                      .watch<LocationController>()
                      .buildingHouseController,
                  onChange: (value) {},
                  hintText: 'Building/House Number',
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 16),
                LabelCard(
                  onTap: () {
                    Helpers.debugLog(
                        '[LOCATIONS]${context.read<CheckoutController>().userLocations}');
                  },
                )
              ],
            )
        ],
      ),
    );
  }
}
