import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        DefaultIconBtn,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/widgets/filter_sort/filter_row.dart';
import 'package:product_listing_pkg/src/widgets/filter_sort/filter_card.dart';
import 'package:product_listing_pkg/src/pages/home/widgets/sort_card.dart';
import '../../../../utils/app_util.dart';
import '../../../../utils/dialogues.dart';
import '../../../widgets/cart_icon.dart';
import '../../../widgets/float_container.dart';
import '../../../widgets/product_card.dart';
import '../../search/screens/item_view.dart';

class ProductListingView extends StatelessWidget {
  const ProductListingView({super.key, this.title});
  static const routeName = 'product_listing_view';
  final String? title;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var screenTitle =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var viewType = screenTitle['type'] == null
        ? ListingType.normal
        : screenTitle['type'] as ListingType;

    var controller = context.watch<ProductController>();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        title: Text(
          screenTitle['title'] ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: StyleColors.lukhuDark1,
          ),
        ),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        backAction: const DefaultBackButton(),
        actions: [
          DefaultIconBtn(
            assetImage: AppUtil.iconSearch,
            packageName: AppUtil.packageName,
            onTap: () {
              NavigationService.navigate(context, SearchItemPage.routeName);
            },
          ),
          const SizedBox(width: 16),
          DefaultIconBtn(
            assetImage: AppUtil.iconSend,
            packageName: AppUtil.packageName,
            onTap: () {},
          ),
          const CartIcon(),
          const SizedBox(width: 16),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            if (viewType == ListingType.other) const FilterRow(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .756,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: context
                        .read<ProductController>()
                        .product(index, controller.pickedForYou)!,
                  );
                },
                itemCount: controller.pickedForYou.keys.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: viewType == ListingType.normal
          ? FloatContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatLabelButton(
                    imageAsset: AppUtil.filterAssetImage,
                    label: 'Filter',
                    onTap: () {
                      LukhuDialogue.blurredDialogue(
                        distance: 0,
                        child: FilterCard(),
                        context: context,
                      );
                    },
                  ),
                  Container(
                    height: 32,
                    width: 1,
                    decoration: BoxDecoration(
                      color: StyleColors.lukhuPriceColor,
                    ),
                  ),
                  FloatLabelButton(
                    imageAsset: AppUtil.sortAssetImage,
                    label: 'Sort',
                    onTap: () {
                      LukhuDialogue.blurredDialogue(
                        distance: 0,
                        child: const SortCard(
                          title: 'Sort',
                        ),
                        context: context,
                      );
                    },
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
