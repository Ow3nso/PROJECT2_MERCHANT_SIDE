import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultCheckbox, StyleColors;

class FilterColor extends StatelessWidget {
  const FilterColor({
    super.key,
    this.isSelected = false,
    required this.onChanged,
    this.data = const [],
    required this.onTap,
    required this.isColorSame,
    this.crossAxisCount = 5,
  });
  final bool isSelected;
  final void Function(bool?) onChanged;
  final List<Map<String, dynamic>> data;
  final void Function(Map<String, dynamic>) onTap;
  final bool Function(String) isColorSame;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: StyleColors.lukhuDividerColor),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: DefaultCheckbox(
            value: isSelected,
            activeColor: StyleColors.lukhuBlue10,
            checkedColor: StyleColors.lukhuBlue70,
            title: Text(
              'Any Color',
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
            onChanged: onChanged,
          ),
        ),
        Divider(color: StyleColors.lukhuDividerColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 6),
                itemCount: data.length,
                itemBuilder: (_, index) {
                  var color = data[index];
                  // var backgroundColor = color;

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          onTap(data[index]);
                        },
                        child: Container(
                          decoration: color['name'].toLowerCase() == 'white'
                              ? BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  shape: BoxShape.circle,
                                )
                              : null,
                          child: CircleAvatar(
                            //foregroundColor: Colors.black,
                            backgroundColor: color['value'],
                            radius: 19,
                            child: isColorSame(color['name'])
                                ? CircleAvatar(
                                    backgroundColor:
                                        color['name'].toLowerCase() == 'white'
                                            ? StyleColors.lukhuDividerColor
                                            : StyleColors.white,
                                    radius: 13,
                                    child: Icon(
                                      Icons.check,
                                      color: StyleColors.lukhuBlue90,
                                      size: 15,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        color['name'],
                        style: TextStyle(
                            color: StyleColors.lukhuDark,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }
}
