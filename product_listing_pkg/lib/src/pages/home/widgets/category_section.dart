import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show StyleColors, NavigationService;
import 'package:product_listing_pkg/src/pages/product/pages/product_listing_view.dart';
import '../../../../utils/app_util.dart';
import '../../../../utils/data/category_data.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.categoryData});
  final List<CategoryData> categoryData;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: StyleColors.lukhuWhite,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: categoryData
              .map(
                (value) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.navigate(
                            context, ProductListingView.routeName,
                            arguments: {
                              'title': value.title,
                            });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: StyleColors.categoryIconBackground,
                            radius: 35,
                            child: Image.asset(
                              value.image,
                              height: 25,
                              width: 28,
                              fit: BoxFit.contain,
                              package: AppUtil.packageName,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            value.title,
                            style: TextStyle(
                              color: StyleColors.lukhuDark,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
