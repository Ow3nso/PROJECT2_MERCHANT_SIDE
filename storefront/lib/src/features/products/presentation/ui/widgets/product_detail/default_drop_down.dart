import 'package:flutter/material.dart';

// import '../../../utils/app_util.dart';
// import '../../../utils/styles/colors.dart';

class DefaultDropdown<T> extends StatelessWidget {
  const DefaultDropdown({
    super.key,
    this.items = const [],
    this.hintWidget,
    this.isDense = false,
    this.isExpanded = false,
    required this.itemChild,
    this.color,
    this.onChanged,
    this.icon,
    this.radius = 6,
    this.onTap,
  });
  final List<T> items;
  final Widget Function(T) itemChild;
  final Widget? hintWidget;
  final bool isDense;
  final bool isExpanded;
  final Color? color;
  final void Function(T?)? onChanged;
  final Widget? icon;
  final double radius;
  final void Function()? onTap;

  @override
Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity, // Makes the dropdown take full width
    child: Container(
      decoration: BoxDecoration(
        color: color ?? const Color.fromARGB(255, 234, 243, 250),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<T>(
        underline: Container(),
        isExpanded: true, // Ensures full width usage
        isDense: isDense,
        onChanged: onChanged,
        hint: hintWidget,
        onTap: onTap,
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        icon: icon ?? Icon(Icons.keyboard_arrow_down),
        items: items
            .map<DropdownMenuItem<T>>(
              (value) => DropdownMenuItem<T>(
                value: value,
                child: itemChild(value),
              ),
            )
            .toList(),
      ),
    ),
  );
}

}
