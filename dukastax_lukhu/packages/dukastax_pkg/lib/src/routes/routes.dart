import 'package:dukastax_pkg/src/controllers/dukastax_controller.dart';
import 'package:dukastax_pkg/src/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ChangeNotifierProvider, SingleChildWidget;

class DukastaxRoutes {
  static Map<String, Widget Function(BuildContext)> public = {
    DukastaxGenesis.routeName: (_) => const DukastaxGenesis(),
    DukastaxOnboard.routeName: (_) => const DukastaxOnboard(),
  };

  static Map<String, Widget Function(BuildContext)> guarded = {};

  static String initialRoute = DukastaxGenesis.routeName;

  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider(
          create: (_) => DukastaxController(),
        ),
      ];
}
