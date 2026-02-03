import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show HourGlass;

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  static const routeName = 'sell_page';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: HourGlass(
          endRadius: 50,
          glow: true,
        ),
      ),
    );
  }
}
