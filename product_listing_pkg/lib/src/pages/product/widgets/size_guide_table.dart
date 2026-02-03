import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, StyleColors;
import 'package:product_listing_pkg/src/controller/product_controller.dart';

class SizeGuidTable extends StatelessWidget {
  const SizeGuidTable({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
        builder: (context, productController, _) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: DataTable(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          border: TableBorder.all(
              borderRadius: BorderRadius.circular(4),
              color: StyleColors.lukhuDividerColor),
          headingRowColor: MaterialStateColor.resolveWith(
            (states) {
              return StyleColors.dataColumbBg;
            },
          ),
          columns: productController.columns
              .map((column) => DataColumn(
                      label: Text(
                    column,
                    style: TextStyle(
                        color: StyleColors.lukhuDark1,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  )))
              .toList(),
          rows: productController.sizeGuide.map((e) {
            var data = e.values.toList();
            return DataRow(
                cells: data
                    .map<DataCell>((value) => DataCell(
                      Text(
                      value,
                      style: TextStyle(
                          color:!productController.pickedSizes.contains(value)? Theme.of(context).colorScheme.secondary  :StyleColors.lukhuDark1,
                          fontWeight: productController.pickedSizes.contains(value) ? FontWeight.bold:  FontWeight.w600,
                          fontSize: 14),
                                        ),
                    onTap: () =>  productController.addSizes(value)
                    ))
                    .toList());
          }).toList(),
        ),
      );
    });
  }
}
