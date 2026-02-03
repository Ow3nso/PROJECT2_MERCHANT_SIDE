import 'package:flutter/material.dart';

class GiftText extends StatelessWidget {
  const GiftText({
    super.key,
    required this.title,
    required this.description,
    this.alignment = MainAxisAlignment.start,
    this.titleWeight = FontWeight.w500,
    this.fontSize = 12,
  });
  final String title;
  final String description;
  final MainAxisAlignment alignment;
  final double fontSize;
  final FontWeight titleWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: titleWeight,
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.scrim),
        ),
        Text(
          description,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
              color: Theme.of(context).colorScheme.scrim),
        )
      ],
    );
  }
}
