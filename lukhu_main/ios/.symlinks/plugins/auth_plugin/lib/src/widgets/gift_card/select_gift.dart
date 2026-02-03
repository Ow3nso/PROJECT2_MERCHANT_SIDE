import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, StyleColors, WatchContext;

class SelectGift extends StatelessWidget {
  const SelectGift({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<GiftsController>();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: .764,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        mainAxisExtent: 35,
      ),
      itemCount: controller.gifts.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.read<GiftsController>().selectedGift = index;
            context.read<GiftsController>().selectedGiftLabel =
                controller.gifts[index];
          },
          child: Container(
            width: size.width,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              border: Border.all(
                  color: context.read<GiftsController>().isColor(index)
                      ? Theme.of(context).colorScheme.scrim
                      : StyleColors.lukhuGrey50),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'KSh ${controller.gifts[index]}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: context.read<GiftsController>().isColor(index)
                    ? FontWeight.w700
                    : FontWeight.w600,
                color: context.read<GiftsController>().isColor(index)
                    ? Theme.of(context).colorScheme.scrim
                    : StyleColors.lukhuGrey50,
              ),
            ),
          ),
        );
      },
    );
  }
}
