import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

class DukastaxContainer extends StatelessWidget {
  const DukastaxContainer({super.key, this.height = 300});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            AuthConstants.dukastaxImage,
            package: AuthConstants.pluginName,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  AuthConstants.dukaIcon,
                  package: AuthConstants.pluginName,
                  color: StyleColors.lukhuWhite,
                ),
              ),
              Image.asset(
                AuthConstants.duka,
                package: AuthConstants.pluginName,
                color: StyleColors.lukhuWhite,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 27,
                    right: 47,
                    left: 47,
                  ),
                  child: Text(
                    "All you need to manage and grow your fashion business. Online and Offline.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: StyleColors.lukhuWhite,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Text(
          //   "All you need to manage and grow your fashion business. Online and Offline.",
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     color: StyleColors.lukhuWhite,
          //     fontSize: 20,
          //     // fontFamily: 'DM Sans',
          //     fontWeight: FontWeight.w700,
          //     height: 24,
          //   ),
          // ),
        ],
      ),
    );
  }
}
