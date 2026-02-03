import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CameraPosition, GoogleMap, GoogleMapController, LatLng, MapType;

class MapCard extends StatelessWidget {
  const MapCard({super.key, this.children = const [], this.height = 150});
  final List<Widget> children;
  final double height;

  @override
  Widget build(BuildContext context) {
    const CameraPosition kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
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
        ...children,
      ],
    );
  }
}
