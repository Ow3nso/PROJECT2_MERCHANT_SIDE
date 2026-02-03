import 'package:flutter/material.dart';

import '../../../utils/styles/colors.dart';


class DefaultSwitch extends StatelessWidget {
  const DefaultSwitch({
    super.key,
    this.value = false,
    required this.onChanged,
    this.title,
    this.activeColor,
    this.checkedColor,
    this.shape,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.inActiveTrackColor,
  });
  final bool value;
  final void Function(bool?) onChanged;
  final Widget? title;
  final Color? activeColor;
  final Color? checkedColor;
  final ShapeBorder? shape;
  final Color? inActiveTrackColor;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      onChanged: onChanged,
      title: title,
      dense: true,
      activeTrackColor: activeColor,
      activeColor: StyleColors.lukhuWhite,
      inactiveThumbColor: StyleColors.lukhuWhite,
      contentPadding: const EdgeInsets.all(0),
      inactiveTrackColor: inActiveTrackColor ?? StyleColors.lukhuBlue0,
      controlAffinity: controlAffinity,
    );
  }
}
