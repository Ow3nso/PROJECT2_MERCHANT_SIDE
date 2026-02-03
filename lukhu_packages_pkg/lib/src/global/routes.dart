import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AuthRoutes,
        ChatRoutes,
        ListingRoutes,
        LukhuPayRoutes,
        SalesRoutes,
        DukastaxRoutes;

class LuhkuRoutes {
  static Map<String, Widget Function(BuildContext)> guarded = {
    ...ListingRoutes.guarded,
    ...AuthRoutes.guarded,
    ...ChatRoutes.guarded,
    ...SalesRoutes.guarded,
    ...LukhuPayRoutes.guarded,
    ...DukastaxRoutes.guarded
  };

  static Map<String, Widget Function(BuildContext)> public = {
    ...AuthRoutes.availableRoutes(),
    ...ListingRoutes.public,
    ...ChatRoutes.public,
    ...SalesRoutes.public,
    ...LukhuPayRoutes.public,
    ...DukastaxRoutes.public,
  };
}
