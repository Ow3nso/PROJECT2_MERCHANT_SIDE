import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

class EditCard extends StatelessWidget {
  const EditCard({
    super.key,
    this.onTap,
    required this.title,
    this.description = '',
  });
  final void Function()? onTap;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: StyleColors.lukhuDividerColor))),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.scrim,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.scrim,
                  size: 15,
                ),
              )
            ],
          )),
    );
  }

}
