import 'package:flutter/material.dart';

import '../../../utils/styles/colors.dart';

class QuantityAdjustBtn extends StatelessWidget {
  const QuantityAdjustBtn(
      {super.key, this.quantity = 0, this.onAddQuantity, this.onMinusQuantity});
  final int quantity;
  final void Function()? onAddQuantity;
  final void Function()? onMinusQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: StyleColors.lukhuBlue10,
          radius: 13,
          child: IconButton(
            padding: const EdgeInsets.only(),
            onPressed: onMinusQuantity,
            iconSize: 12,
            icon: Icon(
              Icons.remove,
              color: StyleColors.lukhuBlue90,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$quantity',
            style: TextStyle(color: StyleColors.lukhuDark1, fontSize: 16),
          ),
        ),
        CircleAvatar(
          backgroundColor: StyleColors.lukhuBlue10,
          radius: 13,
          child: IconButton(
            padding: const EdgeInsets.only(),
            onPressed: onAddQuantity,
            icon: Icon(
              Icons.add,
              color: StyleColors.lukhuBlue90,
              size: 12,
            ),
          ),
        )
      ],
    );
  }
}
