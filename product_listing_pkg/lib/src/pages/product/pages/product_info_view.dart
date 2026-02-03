import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        ChatService,
        DefaultBackButton,
        DefaultButton,
        DefaultDropdown,
        DefaultIconBtn,
        DefaultTextBtn,
        LuhkuAppBar,
        NavigationService,
        Product,
        ProductFields,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/controller/review_controller.dart';
import 'package:product_listing_pkg/src/controller/shop_controller.dart';
import 'package:product_listing_pkg/src/pages/product/pages/review_product_view.dart';
import 'package:product_listing_pkg/src/pages/product/widgets/product_button.dart';
import 'package:product_listing_pkg/src/pages/search/screens/item_view.dart';
import 'package:product_listing_pkg/src/widgets/cart_icon.dart';
import 'package:product_listing_pkg/src/widgets/filter_sort/filter_color_text.dart';
import 'package:product_listing_pkg/src/widgets/product_image_holder.dart';
import 'package:product_listing_pkg/utils/app_util.dart';
import '../../../widgets/content_loader.dart';
import '../../../widgets/offers/offer_card.dart';
import '../../../widgets/profile_card.dart';
import '../../store/pages/store_view.dart';
import '../widgets/follow_button.dart';
import '../widgets/info_button.dart';
import '../widgets/info_product.dart';
import '../widgets/like_button.dart';
import 'size_guide_view.dart';

class ProductInfoView extends StatelessWidget {
  const ProductInfoView({super.key});
  static const routeName = 'product_info_view';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var productController = context.read<ProductController>();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: DefaultBackButton(
          onTap: () {
            Navigator.popUntil(
              context,
              (route) => route.isFirst,
            );
          },
        ),
        title: Expanded(
          flex: 8,
          child: DefaultButton(
            packageName: AppUtil.packageName,
            buttonIconType: ButtonIconType.image,
            asssetIcon: AppUtil.iconSearch,
            onTap: () {
              NavigationService.navigate(context, SearchItemPage.routeName);
            },
            width: size.width,
            height: 35,
            label: 'Search on Lukhu',
            textColor: StyleColors.lukhuGrey500,
            boarderColor: StyleColors.lukhuDividerColor,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        actions: const [CartIcon()],
      ),
      body: FutureBuilder(
          future: productController.getSingleProduct(
              productId: args[ProductFields.productId]),
          builder: (_, snapshot) {
            var product =
                productController.products[args[ProductFields.productId]];

            if (product == null) {
              return const ContentLoader();
            }

            return SizedBox(
                height: size.height,
                width: size.width,
                child: RefreshIndicator(
                  onRefresh: () {
                    return refreshProduct(context, product);
                  },
                  child: ListView(
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(color: StyleColors.lukhuWhite),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: ProfileCard(
                                  shopId: product.shopId!,
                                  onTap: () {
                                    context
                                        .read<ShopController>()
                                        .getStoresStats(product.shopId!);
                                    NavigationService.navigate(
                                        context, StoreView.routeName,
                                        arguments: {
                                          ProductFields.shopId: product.shopId!,
                                          ProductFields.sellerId:
                                              product.sellerId!
                                        });
                                  },
                                  trailing: DefaultIconBtn(
                                    radius: 15,
                                    onTap: () {},
                                    child: Icon(Icons.more_horiz,
                                        color: StyleColors.lukhuDark1),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      ProductImageHolder(
                        radius: 0,
                        allowNavigation: false,
                        product: product,
                        width: size.width,
                        height: 360,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 10, right: 16),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: LikeButton(
                                        productId: product.productId!,
                                        isLiked: productController.hasUserLiked(
                                            product.productId!,
                                            productController.userId),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: DefaultIconBtn(
                                      radius: 15,
                                      onTap: () {
                                        ChatService.openChat(
                                            recipientId: product.sellerId!);
                                      },
                                      assetImage: AppUtil.iconMessage,
                                      packageName: AppUtil.packageName,
                                    ),
                                  ),
                                  ProductShareBtn(
                                    isLoading: context
                                        .watch<ProductController>()
                                        .productLinkIsLoading(
                                            productId: product.productId!),
                                    onTap: () {
                                      productController.shareProuct(
                                        productId: product.productId!,
                                        context: context,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                context
                                    .watch<ProductController>()
                                    .getProductsLikes(product.productId!),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: StyleColors.gray90),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.label!,
                              style: TextStyle(
                                color: StyleColors.lukhuDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.description!,
                                  style: TextStyle(
                                    color: StyleColors.lukhuGrey70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Condition: ',
                                  style: TextStyle(
                                    color: StyleColors.lukhuGrey70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  product.subCategory!,
                                  style: TextStyle(
                                    color: StyleColors.lukhuDark1,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                                Expanded(child: Container()),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: DefaultTextBtn(
                                      label: 'View Style Guide',
                                      onTap: () {
                                        NavigationService.navigate(
                                            context, SizeGuidView.routeName);
                                      }),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DefaultDropdown(
                                    items:
                                        productController.optionColors(product),
                                    hintWidget: FilterColorText(
                                      color: productController
                                          .getProductColor(product),
                                      value: productController.selectedColor ??
                                          'Select Color',
                                    ),
                                    isExpanded: true,
                                    itemChild: (value) => FilterColorText(
                                      color: value['color'],
                                      value: value['name'],
                                      isSelected:
                                          productController.selectedColor ==
                                              value['name'],
                                    ),
                                    onChanged: (value) {
                                      productController.selectedColor =
                                          value!['name'];
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: DefaultDropdown(
                                    isExpanded: true,
                                    hintWidget:
                                        Text(productController.selectedSize),
                                    itemChild: (value) => Text(value),
                                    items: product.availableSizes!,
                                    onChanged: (value) {
                                      productController.selectedSize = value!;
                                    },
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text('Item Code: ${product.productId}'),
                            const SizedBox(height: 16),
                            Text(
                              'About Seller',
                              style: TextStyle(
                                color: StyleColors.lukhuDark1,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            ProfileCard(
                              shopId: product.shopId!,
                              type: ViewTitleType.rating,
                              onTap: () {
                                context
                                    .read<ShopController>()
                                    .getStoresStats(product.shopId!);
                                NavigationService.navigate(
                                    context, StoreView.routeName, arguments: {
                                  ProductFields.shopId: product.shopId!,
                                  ProductFields.sellerId: product.sellerId!
                                });
                              },
                              trailing: FollowButton(
                                userId: productController.userId,
                                shopId: product.shopId!,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(color: StyleColors.lukhuDividerColor),
                      InfoButton(
                        title: 'Reviews',
                        description:
                            '${context.watch<ReviewController>().reviews.keys.length}',
                        onTap: () {
                          NavigationService.navigate(
                              context, ReviewProductView.routeName,
                              arguments: {
                                ProductFields.productId: product.productId,
                              });
                        },
                      ),
                      InfoButton(
                        title: 'Items Being Sold',
                        description:
                            '${(context.read<ProductController>().sellerProuducts[product.sellerId!] ?? {}).keys.length}',
                        onTap: () {
                          context
                              .read<ShopController>()
                              .getStoresStats(product.shopId!);
                          NavigationService.navigate(
                              context, StoreView.routeName,
                              arguments: {
                                'title': 'zenyeziko',
                                ProductFields.shopId: product.shopId!,
                                ProductFields.sellerId: product.sellerId!,
                              });
                        },
                      ),
                      InfoProducts(product: product),
                    ],
                  ),
                ));
          }),
      bottomNavigationBar: OfferCard(id: args[ProductFields.productId]!),
    );
  }

  Future<void> refreshProduct(BuildContext context, Product product) async {
    await context
        .read<ProductController>()
        .getSingleProduct(productId: product.productId!, isRefereshMode: true);
  }
}
