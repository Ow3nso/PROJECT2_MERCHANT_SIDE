import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, Review, StyleColors;

class ReviewCardPop extends StatelessWidget {
  const ReviewCardPop({super.key, required this.store});
  final Review store;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: StyleColors.lukhuWhite,
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 16),
        child: SizedBox(
          height: 210,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: StyleColors.pink,
                radius: 24,
                backgroundImage: store.imageUrl != null
                    ? NetworkImage(store.imageUrl ?? '')
                    : null,
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                    text: 'Review from ',
                    style: TextStyle(
                        color: StyleColors.lukhuDark1,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    children: [
                      TextSpan(
                          text: '${store.name}:',
                          style: const TextStyle(fontWeight: FontWeight.w800))
                    ]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(store.description!,
                  style: TextStyle(
                    color: StyleColors.lukhuDark1,
                  )),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => Icon(Icons.star,
                        size: 20,
                        color: index == 4
                            ? StyleColors.lukhuDividerColor
                            : StyleColors.rateColor)),
              ),
              const SizedBox(
                height: 24,
              ),
              DefaultButton(
                boarderColor: StyleColors.lukhuDividerColor,
                label: 'Go Back',
                textColor: StyleColors.lukhuWhite,
                color: StyleColors.lukhuBlue,
                height: 40,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
