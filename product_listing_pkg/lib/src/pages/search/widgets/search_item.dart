import 'package:flutter/material.dart';

class SearchMenuItem extends StatelessWidget {
  const SearchMenuItem({
    super.key,
    required this.data,
    this.isSelected = false,
    this.onCallback,
  });
  final bool isSelected;
  final Map<String, dynamic> data;
  final void Function()? onCallback;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onCallback,
      child: Container(
        width: size.width,
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(
                    left: BorderSide(
                        width: 3.46,
                        color: Theme.of(context).colorScheme.scrim))),
        child: Text(
          data['name'],
          style: isSelected
              ? TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                )
              : null,
        ),
      ),
    );
  }
}
