import 'package:flutter/material.dart';
import 'package:storefront/src/features/products/presentation/ui/pages/get_products.dart';
import 'package:storefront/src/shared/ui/widgets/buttons.dart';
import 'package:storefront/src/shared/ui/widgets/cancel_button.dart';

class Filters extends StatefulWidget {
  final String selectedCategory; // For category filter
  final Function(String) onCategorySelected; // Callback for category selection
  final Function(double, double) onPriceRangeSelected; // Callback for price range selection

  const Filters({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onPriceRangeSelected,
  });

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  String? selectedTitle;
  double minPrice = 0.0; // Default minimum price
  double maxPrice = 1000.0; // Default maximum price

  // Show category modal
  void _showCategoryModal(BuildContext context, Function(String) onCategorySelected) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String selectedCategory = widget.selectedCategory;

      return StatefulBuilder(
        builder: (context, setState) {
          Widget _buildCategoryRow(String title) {
            return Column(
              children: [
                const Divider(height: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = title;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: selectedCategory == title,
                            onChanged: (bool? value) {
                              setState(() {
                                selectedCategory = title;
                              });
                            },
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              color: selectedCategory == title ? Colors.blue : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCategoryRow('Men'),
                  _buildCategoryRow('Women'),
                  _buildCategoryRow('Unisex'),
                  _buildCategoryRow('Kids'),
                  const Divider(),
                  const SizedBox(height: 16),
                  CustomButton(
                    name: "View",
                    width: double.infinity,
                    height: 50,
                    backgroundColor: const Color(0xFF003CFF),
                    onPressed: () {
                      Navigator.pop(context);
                      onCategorySelected(selectedCategory);
                    },
                  ),
                  const SizedBox(height: 16),
                  CancelButton(
                    name: "Cancel",
                    width: double.infinity,
                    height: 50,
                    backgroundColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}


  // Show price modal
  void _showPriceModal(BuildContext context, Function(double, double) onPriceRangeSelected) {
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Increased border radius
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Consistent border radius
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(context, 'Price Range'),
                  const Divider(),
                  const SizedBox(height: 16),
                  _buildPriceInputs(minPriceController, maxPriceController),
                  const SizedBox(height: 16),
                  CustomButton(
                    name: "View",
                    width: double.infinity,
                    height: 50,
                    backgroundColor: const Color(0xFF003CFF),
                    onPressed: () {
                      double min = double.tryParse(minPriceController.text) ?? 0.0;
                      double max = double.tryParse(maxPriceController.text) ?? 1000.0;
                      Navigator.pop(context);
                      onPriceRangeSelected(min, max);
                    },
                  ),
                  const SizedBox(height: 16),
                  CancelButton(
                    name: "Cancel",
                    width: double.infinity,
                    height: 50,
                    backgroundColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildHeader(BuildContext context, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 16,
          ),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(width: 48), // Placeholder for symmetry
    ],
  );
}

Widget _buildPriceInputs(TextEditingController minController, TextEditingController maxController) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: TextField(
          controller: minController,
          decoration: InputDecoration(
            prefixText: 'KSH ',
            hintText: 'Min Price',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Rounded edges
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
      const SizedBox(width: 8),
      const Text('-'),
      const SizedBox(width: 8),
      Expanded(
        child: TextField(
          controller: maxController,
          decoration: InputDecoration(
            prefixText: 'KSH ',
            hintText: 'Max Price',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), // Rounded edges
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    ],
  );
}


  void _showCollectionModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Increased border radius
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12), // Consistent border radius
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(context, 'Collections'),
                    const SizedBox(height: 16),
                    _buildDividerRow('Upeo Collection', setState),
                    _buildDividerRow('Drip Collection', setState),
                    const Divider(),
                    const SizedBox(height: 16),
                    CustomButton(
                      name: "View",
                      width: double.infinity,
                      height: 50,
                      backgroundColor: const Color(0xFF003CFF),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    CancelButton(
                      name: "Cancel",
                      width: double.infinity,
                      height: 50,
                      backgroundColor: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }


  Widget _buildDividerRow(String title, StateSetter setState) {
    return Column(
      children: [
        const Divider(height: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedTitle = title;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: selectedTitle == title,
                    onChanged: (bool? value) {
                      setState(() {
                        selectedTitle = title;
                      });
                    },
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetProductsPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE6ECFF),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Row(
                  children: [
                    Text('View all'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () => _showCategoryModal(context, widget.onCategorySelected),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE6ECFF),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Row(
                  children: [
                    Text('Category'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () => _showCollectionModal(context),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE6ECFF),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Row(
                  children: [
                    Text('Collection'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () => _showPriceModal(context, widget.onPriceRangeSelected),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE6ECFF),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Row(
                  children: [
                    Text('Price'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}