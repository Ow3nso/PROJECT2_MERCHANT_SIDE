import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, Consumer, DefaultBackButton, DefaultButton, LuhkuAppBar, StyleColors;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/pages/product/widgets/size_guide_table.dart';

class SizeGuidView extends StatelessWidget {
  const SizeGuidView({super.key});
  static const routeName = 'size_guide_view';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<ProductController>(
        builder: (context, productController, _) {
      return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(productController.pickedSizes.toList());
          return true;
        },
        child: Scaffold(
          appBar: LuhkuAppBar(
            actions: [
              Expanded(
                child: DefaultButton(
                  label: "Done",
                  textColor: Colors.black,
                  onTap: () {
                     Navigator.of(context)
                        .pop(productController.pickedSizes.toList());
                  },
                  
                ),
              )
            ],
            appBarType: AppBarType.other,
            height: 100,
            color: Theme.of(context).colorScheme.onPrimary,
            enableShadow: true,
            backAction: DefaultBackButton(
              onTap: () {
                Navigator.of(context).pop(productController.pickedSizes.toList());
              },
            ),
            title: Text(
              'Size Guide',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: StyleColors.lukhuDark1,
              ),
            ),
          ),
          body: DefaultTabController(
            length: productController.sizes.length,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 34,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 240,
                          decoration: BoxDecoration(
                            border: Border.all(color: StyleColors.lukhuDark),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TabBar(
                            //labelColor: StyleColors.lukhuDark,
                            onTap: (value) {
                              productController.selectedIndex = value;
                            },
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorWeight: 2,
                            indicator: BoxDecoration(
                                color: StyleColors.lukhuDark,
                                borderRadius: productController.borderRadius),
                            tabs: ['UK Sizes', 'EU Sizes']
                                .asMap()
                                .map((key, value) => MapEntry(
                                    key,
                                    Tab(
                                      height: 40,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 2,
                                        ),
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: productController
                                                          .selectedIndex ==
                                                      key
                                                  ? StyleColors.white
                                                  : StyleColors.lukhuDark1),
                                        ),
                                      ),
                                    )))
                                .values
                                .toList(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                        height: 600,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: productController.sizes
                              .map((e) => SizeGuidTable(
                                    title: e,
                                  ))
                              .toList(),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
