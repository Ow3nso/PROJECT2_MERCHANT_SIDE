import 'package:flutter/material.dart';

import '../../../utils/styles/colors.dart';


class DefaultCheckbox extends StatelessWidget {
  const DefaultCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.title,
    this.activeColor,
    this.checkedColor,
    this.shape,
    this.controlAffinity = ListTileControlAffinity.leading,
  });
  final bool? value;
  final void Function(bool?) onChanged;
  final Widget? title;
  final Color? activeColor;
  final Color? checkedColor;
  final ShapeBorder? shape;
  final ListTileControlAffinity controlAffinity;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      tristate: true,
      onChanged: onChanged,
      title: title,
      shape: shape,
      dense: true,
      isThreeLine: false,
      visualDensity: VisualDensity.standard,
      activeColor: activeColor ?? StyleColors.lukhuBlue,
      side: BorderSide(width: 1, color: StyleColors.lukhuDividerColor),
      checkColor: checkedColor ?? StyleColors.lukhuWhite,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      contentPadding: const EdgeInsets.all(0),
      controlAffinity: controlAffinity,
    );
  }
}
