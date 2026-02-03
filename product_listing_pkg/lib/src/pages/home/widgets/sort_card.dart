import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, DefaultButton, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/filter_sort_controller.dart';


class SortCard extends StatefulWidget {
  const SortCard({
    super.key,
    this.title = '',
  });
  final String title;

  @override
  State<SortCard> createState() => _SortCardState();
}

class _SortCardState extends State<SortCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      height: 499,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: _views.length,
        itemBuilder: (context, index) => _views[index],
      ),
    );
  }

  List<Widget> get _views => [
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: StyleColors.lukhuDark1,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Divider(
          color: StyleColors.lukhuDividerColor,
        ),
        ...List.generate(
          context.watch<FilterSortController>().sortOptions.length,
          (index) {
            var sort = context.watch<FilterSortController>().sortOptions[index];
            return Consumer<FilterSortController>(
                builder: (context, cartState, _) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      cartState.selectedSortItem = sort;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: 12,
                        right: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sort,
                            style: TextStyle(
                              color: StyleColors.lukhuDark1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (sort ==
                              context
                                  .watch<FilterSortController>()
                                  .selectedSortItem)
                            Icon(
                              Icons.check,
                              color: StyleColors.lukhuPriceColor,
                              size: 24,
                            )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: StyleColors.lukhuDividerColor,
                  )
                ],
              );
            });
          },
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  color: StyleColors.lukhuBlue,
                  actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  label: 'View Item',
                  height: 40,
                  width: 180,
                  style: TextStyle(
                      color: StyleColors.lukhuWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Cancel',
                  color: StyleColors.lukhuWhite,
                  height: 40,
                  width: 156,
                  boarderColor: StyleColors.lukhuDividerColor,
                  textColor: StyleColors.lukhuDark1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 42,
        ),
      ];
}
