import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/pages/product/pages/post_out_fit_view.dart';
import 'package:product_listing_pkg/src/pages/home/widgets/discovery_sort_card.dart';
import 'package:product_listing_pkg/utils/app_util.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';

import '../../../widgets/float_container.dart';
import '../../../widgets/product_card.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.grey,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView.builder(
          itemCount: _views.length,
          itemBuilder: (context, index) => _views[index],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatContainer(
        width: 155,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FloatLabelButton(
            label: 'Post Your Outfit',
            style: TextStyle(
              color: StyleColors.lukhuWhite,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            imageAsset: AppUtil.addImage,
            onTap: () {
              NavigationService.navigate(context, PostOutfitView.routeName);
            },
            alignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }

  List<Widget> get _views => [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: StyleColors.lukhuWhite,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#MyLukhu',
                      style: TextStyle(
                        color: StyleColors.lukhuRed,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      )),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Share. Shop. Get Inspired!',
                    style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  LukhuDialogue.blurredDialogue(
                      child: const Padding(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 80),
                        child: DiscoverySortCard(),
                      ),
                      context: context);
                },
                child: Image.asset(
                  AppUtil.filterSquareSvg,
                  package: AppUtil.packageName,
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .756,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (context, index) {
              return ProductCard(
                isProductInDiscovery: true,
                product: context.read<ProductController>().product(
                    index, context.watch<ProductController>().pickedForYou)!,
              );
            },
            itemCount:
                context.watch<ProductController>().pickedForYou.keys.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          ),
        ),
      ];
}
