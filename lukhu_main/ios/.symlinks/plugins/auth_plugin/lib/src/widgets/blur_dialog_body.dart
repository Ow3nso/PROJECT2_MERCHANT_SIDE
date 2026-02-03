import 'dart:ui';

import 'package:flutter/material.dart';

class BlurDialogBody extends StatelessWidget {
  const BlurDialogBody({super.key, this.child,this.bottomDistance =0});
  final Widget? child;
  final double? bottomDistance;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: BackdropFilter(
           filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
           child: Center(
            child: Stack(
              children: [
                Align(
                   alignment: Alignment.bottomCenter,
                   child: Padding(
                      padding:  EdgeInsets.only(bottom: bottomDistance??0),
                     child: child,
                   ),
                )
              ],
            ),
           ),
        ),
    );
  }
}
