import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.data,
    this.onTap,
  });

  final String data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                data,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              )),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Theme.of(context).colorScheme.scrim,
              )
            ],
          ),
        ),
      ),
    );
  }
}
