import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:storefront/src/features/cart/data/models/model_cart.dart';
import 'package:storefront/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:storefront/src/features/products/data/models/product_model.dart';
import 'package:storefront/src/features/products/presentation/ui/widgets/home_page/product_card.dart';
import 'package:storefront/src/features/products/presentation/ui/widgets/home_page/pagination.dart';
import '../widgets/home_page/header_section.dart';
import '../widgets/home_page/filters.dart';
import '../widgets/home_page/footer.dart';

class GetProductsPage extends StatefulWidget {
  final String searchQuery;

  const GetProductsPage({super.key, this.searchQuery = ''});

  @override
  _GetProductsPageState createState() => _GetProductsPageState();
}

class _GetProductsPageState extends State<GetProductsPage> {
  String selectedCategory = '';
  double minPrice = 0.0;
  double maxPrice = 10000000000000.0;
  int currentPage = 1;
  final int itemsPerPage = 10;
  int totalItems = 0;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: const RegaliaLogo(),
      ),
      body: FutureBuilder(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          List<Map<String, dynamic>> allProducts = snapshot.data as List<Map<String, dynamic>>;
          List<Map<String, dynamic>> filteredProducts = allProducts.where((product) {
            double productPrice = product['price'] ?? 0.0;
            bool matchesCategory = selectedCategory.isEmpty || product['category'] == selectedCategory;
            bool matchesPrice = productPrice >= minPrice && productPrice <= maxPrice;
            bool matchesSearch = widget.searchQuery.isEmpty ||
                product['label'].toLowerCase().contains(widget.searchQuery.toLowerCase());
            return matchesCategory && matchesPrice && matchesSearch;
          }).toList();

          totalItems = filteredProducts.length;
          int startIndex = (currentPage - 1) * itemsPerPage;
          int endIndex = startIndex + itemsPerPage;
          if (endIndex > filteredProducts.length) {
            endIndex = filteredProducts.length;
          }
          List<Map<String, dynamic>> productsForCurrentPage = filteredProducts.sublist(startIndex, endIndex);

          return Column(
            children: [
              if (widget.searchQuery.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetProductsPage(searchQuery: value),
                        ),
                      );
                    },
                  ),
                ),
              Padding(
                padding: widget.searchQuery.isNotEmpty
                    ? const EdgeInsets.only(top: 8.0)
                    : const EdgeInsets.all(0.0),
                child: Filters(
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                      currentPage = 1;
                    });
                  },
                  onPriceRangeSelected: (min, max) {
                    setState(() {
                      minPrice = min;
                      maxPrice = max;
                      currentPage = 1;
                    });
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: productsForCurrentPage.length,
                        itemBuilder: (context, index) {
                          List<String> images = [];
                          if (productsForCurrentPage[index]['images'] is String) {
                            images = [productsForCurrentPage[index]['images']];
                          } else if (productsForCurrentPage[index]['images'] is List) {
                            images = List<String>.from(productsForCurrentPage[index]['images']);
                          }

                          return ProductCard(
                            image: images.isNotEmpty ? images[0] : 'https://via.placeholder.com/150',
                            name: productsForCurrentPage[index]['label'],
                            price: 'KSH ${productsForCurrentPage[index]['price'].toStringAsFixed(2)}',
                            product: ProductModel.fromFirestore(productsForCurrentPage[index]),
                            // cart: CartItem(

                            //   productId: productsForCurrentPage[index]['productId'],
                            //   label: productsForCurrentPage[index]['label'],
                            //   price: productsForCurrentPage[index]['price'],
                            //   images: images,
                            // ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Center(
                        child: Pagination(
                          currentPage: currentPage,
                          totalPages: (totalItems / itemsPerPage).ceil(),
                          onPrevious: () => setState(() => currentPage--),
                          onNext: () => setState(() => currentPage++),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Footer(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('products').where('isAvailable', isEqualTo: true).get();
    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}
