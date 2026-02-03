import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Helpers, LocationController, ReadContext;
import 'delivery_options/user_location.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var locationController = context.read<LocationController>();
    var location = locationController.userLocation;

    return Column(
      children: List.generate(location.keys.length, (index) {
        var pickedLocation = locationController.getLocation(index, location)!;
        return UserLocation(
          onTap: () {
            pickedLocation = pickedLocation.copyWith(
                isSelected: !(pickedLocation.isSelected ?? false));
            locationController.location = pickedLocation;
            locationController.userLocation[pickedLocation.id!] =
                pickedLocation;
            Helpers.debugLog(
                '[PICKED] ${locationController.location!.toJson()}');
          },
          showCheck: true,
          location: pickedLocation,
        );
      }),
    );
  }
}
