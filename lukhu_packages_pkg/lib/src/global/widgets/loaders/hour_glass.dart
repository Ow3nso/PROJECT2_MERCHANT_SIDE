import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AvatarGlow, SvgPicture;

import '../../../utils/app_util.dart';
import '../../../utils/styles/colors.dart';


class HourGlass extends StatefulWidget {
  const HourGlass({super.key, this.endRadius = 32, this.glow = true});
  final double endRadius;
  final bool glow;

  @override
  State<HourGlass> createState() => _HourGlassState();
}

class _HourGlassState extends State<HourGlass> {
  late Timer _timer;
  double _turns = 0.0;
  double get turns => _turns;
  set turns(double value) {
    if (mounted) {
      setState(() {
        _turns = value;
      });
    }
  }

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  void initState() {
    _timer = Timer.periodic(
        const Duration(milliseconds: 1000), (timer) => _changeRotation());
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
        glowColor:  StyleColors.lukhuBlue,
        endRadius: widget.endRadius,
        duration: const Duration(milliseconds: 2000),
        repeat: widget.glow,
        showTwoGlows: true,
        animate: widget.glow,
        child: AnimatedRotation(
            turns: turns,
            duration: const Duration(milliseconds: 1000),
            child: SvgPicture.asset(
              AppUtil.hourGlass,
              package: AppUtil.packageName,
              width: widget.endRadius,
              height: widget.endRadius,
            )));
  }
}
