// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
//     show
//         AppDBConstants,
//         AuthGenesisPage,
//         DynamicLinkServices,
//         FieldValue,
//         FirebaseFirestore,
//         FirebaseStorage,
//         GlobalAppUtil,
//         Helpers,
//         NavigationService,
//         Product,
//         ProductFields,
//         ProductInfoView,
//         ReadContext,
//         Share,
//         ShortMessageType,
//         ShortMessages,
//         UserRepository;

// class ProductController extends ChangeNotifier {
//   final storage = FirebaseStorage.instance;
//   final db = FirebaseFirestore.instance;

//   Map<String, Product> _recentlyViewed = {};
//   Map<String, Product> get recentlyViewed => _recentlyViewed;
//   set recentlyViewed(Map<String, Product> value) {
//     _recentlyViewed = value;
//     notifyListeners();
//   }

//   Map<String, Product> _shopProducts = {};
//   Map<String, Product> get shopProducts => _shopProducts;
//   set shopProducts(Map<String, Product> value) {
//     _shopProducts = value;
//     notifyListeners();
//   }

//   Map<String, Product> _similarProducts = {};
//   Map<String, Product> get similarProducts => _similarProducts;
//   set similarProducts(Map<String, Product> value) {
//     _similarProducts = value;
//     notifyListeners();
//   }

//   Map<String, Product> offerProducts = {};

//   Map<String, Product> _itemsLoved = {};
//   Map<String, Product> get itemsLoved => _itemsLoved;
//   set itemsLoved(Map<String, Product> value) {
//     _itemsLoved = value;
//     notifyListeners();
//   }

//   Map<String, Product> _pickedForYou = {};
//   Map<String, Product> get pickedForYou => _pickedForYou;
//   set pickedForYou(Map<String, Product> value) {
//     _pickedForYou = value;
//     notifyListeners();
//   }

//   void addOfferProduct(Product? value) {
//     if (!offerProducts.keys.any((key) => key == value!.productId)) {
//       offerProducts.addAll({value?.productId ?? '': value!});
//     }
//     notifyListeners();
//   }

//   bool _hasAmountDiscount = false;
//   bool get hasAmountDiscount => _hasAmountDiscount;
//   set hasAmountDiscount(bool value) {
//     _hasAmountDiscount = value;
//     notifyListeners();
//   }

//   /// The function updates the discount information of a selected product.
//   ///
//   /// Args:
//   ///   id (String): The parameter "id" is a string that represents the unique identifier of a product.
//   /// It is used to retrieve the product from a collection of products (presumably stored in a data
//   /// structure like a dictionary or map) and update its discount information.
//   ///
//   /// Returns:
//   ///   If the `product` variable is `null`, then the function will return nothing (i.e., it will exit
//   /// early and not execute any further code). Otherwise, the function will not explicitly return
//   /// anything, so it will implicitly return `undefined`.
//   void updateProductDiscount(String id) {
//     var product = products[id];
//     selectedProduct = product;
//     if (product == null) return;
//     setLoadingProductLink(productId: product.productId!, isLoading: false);
//     hasAmountDiscount =
//         product.discountAmount != 0 || product.discountPercentage! > 0;
//   }

//   /// This function calculates the final price of a selected product based on its original price and any
//   /// applicable discounts.
//   ///
//   /// Returns:
//   ///   a double value which represents the price of the selected product after applying any applicable
//   /// discounts. If there is no selected product, the function returns 0.
//   double getProductAmount(String productId, [bool originalPrice = false]) {
//     var product = products[productId];
//     if (product == null) return 0;
//     if (originalPrice) return product.price!;
//     double amount = product.price!;
//     double discountAmount = product.discountAmount!;
//     double price = amount;
//     double percentage = product.discountPercentage!;
//     if (discountAmount > 0) {
//       price = amount - discountAmount;
//     } else if (percentage > 0) {
//       price = amount - (amount * percentage / 100);
//     }
//     return price;
//   }

//   /// The function returns a discount text for a product based on its discount percentage or amount.
//   ///
//   /// Args:
//   ///   product (Product): The "product" parameter is an object of the "Product" class, which contains
//   /// information about a particular product, such as its name, price, and discount details.
//   ///
//   /// Returns:
//   ///   The function `getDiscoountText` returns a string that represents the discount text for a given
//   /// product. If the product has a discount percentage greater than 0, the function returns a string
//   /// with the percentage followed by "% Off". If the product has a discount amount greater than 0, the
//   /// function returns a string with the discount amount rounded to the nearest integer followed by "KES
//   /// Off".
//   String getDiscoountText(Product product) {
//     if ((product.discountPercentage ?? 0) > 0) {
//       return '${product.discountPercentage?.round()}% Off';
//     } else {
//       return 'KES ${product.discountAmount?.round()} Off';
//     }
//   }

//   /// The function returns a product from a map based on its index.
//   ///
//   /// Args:
//   ///   index (int): The index parameter is an integer value that represents the index of the product
//   /// that we want to retrieve from the Map of products.
//   ///   value (Map<String, Product>): The parameter "value" is a Map object that contains a collection
//   /// of Product objects. The keys of the map are strings that uniquely identify each product. The
//   /// values of the map are the Product objects themselves. The function "product" takes an index and
//   /// the map "value" as input parameters and returns
//   ///
//   /// Returns:
//   ///   a `Product` object from the `value` map based on the `index` parameter passed to the function.
//   /// The key used to retrieve the `Product` object from the map is generated by calling the
//   /// `_productKey` function.
//   Product? product(int index, Map<String, Product> value) {
//     return value[_productKey(index, value)];
//   }

//   /// This function returns the key of a product in a map at a given index.
//   ///
//   /// Args:
//   ///   index (int): An integer representing the index of the key in the map that we want to retrieve.
//   ///   value (Map<String, Product>): A Map object with String keys and Product values.
//   ///
//   /// Returns:
//   ///   The function `_productKey` is returning a string which is the key at the specified index in the
//   /// given map `value`.
//   String _productKey(int index, Map<String, Product> value) {
//     return value.keys.elementAt(index);
//   }

//   /// The function finds a product based on its ID and returns it, or returns null if the ID is empty.
//   ///
//   /// Args:
//   ///   id (String): The parameter "id" is a String variable that represents the unique identifier of a
//   /// product that needs to be retrieved from the "pickedForYou" collection.
//   ///
//   /// Returns:
//   ///   The method `findProduct` returns a `Product` object with the specified `id` if it exists in the
//   /// `pickedForYou` map. If the `id` is empty or null, it returns `null`.
//   Product? findProduct(String id) {
//     if (id.isNotEmpty) {
//       return pickedForYou[id];
//     }
//     return null;
//   }

//   TextEditingController offerController = TextEditingController();

//   Product? _selectedProduct;
//   Product? get selectedProduct => _selectedProduct;

//   set selectedProduct(Product? value) {
//     _selectedProduct = value;

//     notifyListeners();
//   }

//   String getProductsLikes(String id) {
//     var product = products[id];
//     if (product == null) return '';
//     return product.likes!.isEmpty
//         ? ''
//         : '🔥 ${product.likes!.length} love this item';
//   }

//   Product? getProductById(String id) {
//     return products[id];
//   }

//   String? _userId;
//   String? get userId => _userId;
//   set userId(String? value) {
//     _userId = value;
//     notifyListeners();
//   }

//   String? _userName;
//   String? get userName => _userName;
//   set userName(String? value) {
//     _userName = value;
//     notifyListeners();
//   }

//   void getUserLoggedIn() {
//     BuildContext? context = NavigationService.navigatorKey.currentContext;
//     if (context == null) return;
//     userId = context.read<UserRepository>().fbUser?.uid;
//     userName = context.read<UserRepository>().fbUser?.displayName;
//   }

//   int _selectedIndex = 0;
//   int get selectedIndex => _selectedIndex;

//   set selectedIndex(int value) {
//     _selectedIndex = value;
//     if (value == 0) {
//       borderRadius = const BorderRadius.only(
//           bottomLeft: Radius.circular(4), topLeft: Radius.circular(4));
//       columns[1] = 'US';
//     } else {
//       borderRadius = const BorderRadius.only(
//           bottomRight: Radius.circular(4), topRight: Radius.circular(4));
//       columns[1] = 'EU';
//     }
//     notifyListeners();
//   }

//   BorderRadius _borderRadius = const BorderRadius.only(
//       bottomLeft: Radius.circular(4), topLeft: Radius.circular(4));
//   BorderRadius get borderRadius => _borderRadius;
//   set borderRadius(BorderRadius value) {
//     _borderRadius = value;
//     notifyListeners();
//   }

//   Set<String> pickedSizes = {};

//   void addSizes(String value) {
//     if (pickedSizes.contains(value)) {
//       pickedSizes.remove(value);
//       log("removed $value");
//       notifyListeners();
//       return;
//     }
//     pickedSizes.add(value);
//     log("added $value");
//     notifyListeners();
//   }

//   List<String> columns = [
//     'UK',
//     'US',
//     'Bust\n(cm)',
//     'Waist\n(cm)',
//     'Hips\n(cm)'
//   ];

//   final List<Map<String, dynamic>> _sizeGuide = [
//     {'UK': 'UK 2', 'US': '00', 'Bust': '76', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 4', 'US': '0', 'Bust': '78', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 6', 'US': '2', 'Bust': '80', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 8', 'US': '4', 'Bust': '80.5', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 10', 'US': '6', 'Bust': '83', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 12', 'US': '8', 'Bust': '88', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 14', 'US': '10', 'Bust': '93', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 18', 'US': '12', 'Bust': '103', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 20', 'US': '14', 'Bust': '110', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 22', 'US': '16', 'Bust': '116', 'Waist': '58', 'Hips': '82.5'},
//     {'UK': 'UK 24', 'US': '18', 'Bust': '76', 'Waist': '58', 'Hips': '82.5'},
//   ];
//   List<Map<String, dynamic>> get sizeGuide => _sizeGuide;

//   List<String> sizes = ['UK Sizes', 'EU Sizes'];

//   String _selectedSize = 'Select Size';
//   String get selectedSize => _selectedSize;

//   set selectedSize(String value) {
//     _selectedSize = value;

//     notifyListeners();
//   }

//   bool _allowOffer = false;
//   bool get allowOffer => _allowOffer;

//   set allowOffer(bool value) {
//     _allowOffer = value;
//     notifyListeners();
//   }

//   final List<Map<String, dynamic>> _storeQuickLinks = [
//     {'title': 'Quick Response', 'image': 'assets/images/flash_icon.png'},
//     {'title': 'Trusted Seller', 'image': 'assets/images/shield_tick.png'},
//     {'title': 'Fast Shipper', 'image': 'assets/images/truck_fast.png'}
//   ];

//   List<Map<String, dynamic>> get storeQuickLinks => _storeQuickLinks;

  

//   /// This function retrieves a limited number of products from a database and stores them in a map if
//   /// they exist.
//   ///
//   /// Args:
//   ///   isrefreshMode (bool): A boolean value that indicates whether the function is being called in
//   /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
//   /// the data and not to retrieve it for the first time. Defaults to false
//   ///   limit (int): The maximum number of documents to retrieve from the products collection. In this
//   /// case, it is set to 8. Defaults to 8
//   ///
//   /// Returns:
//   ///   A Future<bool> object is being returned.
//   Future<bool> getPickedForYou(
//       {bool isrefreshMode = false, int limit = 8}) async {
//     if (pickedForYou.isNotEmpty && !isrefreshMode) return true;
//     try {
//       var pickedDocs = await db
//           .collection(AppDBConstants.productsCollection)
//           .limit(limit)
//           .get();
//       if (pickedDocs.docs.isNotEmpty) {
//         pickedForYou = {
//           for (var e in pickedDocs.docs) e.id: Product.fromJson(e.data())
//         };
//         products.addAll(pickedForYou);
//         return true;
//       }
//     } catch (e) {
//       Helpers.debugLog('An error occurred while getting products: $e');
//     }
//     return false;
//   }

//   /// This function retrieves a limited number of user's liked products from a database and stores them in a map if
//   /// they exist.
//   ///
//   /// Args:
//   ///   isrefreshMode (bool): A boolean value that indicates whether the function is being called in
//   /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
//   /// the list of itemsLoved. Defaults to false
//   ///   limit (int): The maximum number of items to retrieve from the database. In this case, it is set
//   /// to 8. Defaults to 8
//   ///
//   /// Returns:
//   ///   A `Future<bool>` is being returned.
//   Future<bool> getUserLovedItem(
//       {bool isrefreshMode = false, int limit = 8}) async {
//     if (itemsLoved.isNotEmpty && !isrefreshMode) return true;

//     try {
//       var itemDocs = await db
//           .collection(AppDBConstants.productsCollection)
//           .limit(limit)
//           .get();

//       if (itemDocs.docs.isNotEmpty) {
//         itemsLoved = {
//           for (var e in itemDocs.docs) e.id: Product.fromJson(e.data())
//         };
//         return true;
//       }
//     } catch (e) {
//       Helpers.debugLog('An error occurred while getting products: $e');
//     }
//     return false;
//   }

//   /// This function retrieves recently viewed products from a database and returns a boolean indicating
//   /// whether the operation was successful.
//   ///
//   /// Args:
//   ///   isrefreshMode (bool): A boolean value that indicates whether the recently viewed products should
//   /// be refreshed or not. If it is set to true, the function will fetch the latest products from the
//   /// database even if there are already some products in the recentlyViewed list. Defaults to false
//   ///   limit (int): The maximum number of documents to retrieve from the "productsCollection"
//   /// collection. The default value is 8, but it can be changed by passing a different value as an
//   /// argument. Defaults to 8
//   ///
//   /// Returns:
//   ///   A `Future<bool>` is being returned.
//   Future<bool> getRecentlyViewed(
//       {bool isrefreshMode = false, int limit = 8}) async {
//     if (recentlyViewed.isNotEmpty && !isrefreshMode) return true;

//     try {
//       var recentlyDocs = await db
//           .collection(AppDBConstants.productsCollection)
//           .limit(limit)
//           .get();

//       if (recentlyDocs.docs.isNotEmpty) {
//         recentlyViewed = {
//           for (var e in recentlyDocs.docs) e.id: Product.fromJson(e.data())
//         };
//         products.addAll(recentlyViewed);
//         return true;
//       }
//     } catch (e) {
//       Helpers.debugLog('An error occurred while getting products: $e');
//     }
//     return false;
//   }

//   Map<String, Product> _ourPicks = {};
//   Map<String, Product> get ourPicks => _ourPicks;
//   set ourPicks(Map<String, Product> value) {
//     _ourPicks = value;
//     notifyListeners();
//   }

//   /// This function retrieves a limited number of picked products from a database and stores them in a map if
//   /// they exist.
//   ///
//   /// Args:
//   ///   isrefreshMode (bool): A boolean value that indicates whether the function is being called in
//   /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
//   /// the data and not to retrieve it for the first time. Defaults to false
//   ///   limit (int): The maximum number of documents to retrieve from the "productsCollection"
//   /// collection. The default value is 6, but it can be overridden by passing a different value as an
//   /// argument. Defaults to 6
//   ///
//   /// Returns:
//   ///   A `Future<bool>` is being returned.
//   Future<bool> getOurPicks({bool isrefreshMode = false, int limit = 6}) async {
//     if (ourPicks.isNotEmpty && !isrefreshMode) return true;

//     try {
//       var ourPiksDoc = await db
//           .collection(AppDBConstants.productsCollection)
//           .limit(limit)
//           .get();

//       if (ourPiksDoc.docs.isNotEmpty) {
//         ourPicks = {
//           for (var e in ourPiksDoc.docs) e.id: Product.fromJson(e.data())
//         };
//         products.addAll(ourPicks);
//         return true;
//       }
//     } catch (e) {
//       Helpers.debugLog('An error occurred while getting products: $e');
//     }
//     return false;
//   }

//   /// The function returns a list of maps containing available colors for a given product.
//   ///
//   /// Args:
//   ///   value (Product): A nullable Product object.
//   ///
//   /// Returns:
//   ///   A list of maps, where each map has a string key and a dynamic value.
//   List<Map<String, dynamic>> optionColors(Product? value) {
//     var colors = <Map<String, dynamic>>[];
//     if (value != null) {
//       for (var element in GlobalAppUtil.optionColors) {
//         if (value.availableColors!.any((color) => element['name'] == color)) {
//           colors.add(element);
//         }
//       }
//     }
//     return colors;
//   }

//   String? _selectedColor = '';
//   String? get selectedColor => _selectedColor;
//   set selectedColor(String? value) {
//     _selectedColor = value;
//     notifyListeners();
//   }

//   /// This function returns the color of a product if it exists in a list of option colors.
//   ///
//   /// Args:
//   ///   value (Product): A Product object that contains information about a product, including its
//   /// color.
//   ///
//   /// Returns:
//   ///   a nullable Color object.
//   Color? getProductColor(Product? value) {
//     Color? color;
//     if (selectedColor != null) {
//       color = GlobalAppUtil.optionColors
//           .firstWhere((data) => data['name'] == selectedColor)['color'];
//     }
//     return color;
//   }

//   Map<String, Map<String, Product>> sellerProuducts = {};

//   /// This function retrieves a specified number of products from a database and stores them in a map if
//   /// they exist.
//   ///
//   /// Args:
//   ///   isrefreshMode (bool): A boolean value that indicates whether the function is being called in
//   /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
//   /// the list of products. Defaults to false
//   ///   limit (int): The maximum number of products to retrieve from the database. The default value is
//   /// 4, but it can be changed by passing a different value as an argument. Defaults to 4
//   ///
//   /// Returns:
//   ///   A `Future<bool>` is being returned.
//   Future<bool> getMoreProductsFromSeller({
//     bool isrefreshMode = false,
//     int limit = 4,
//     required String sellerId,
//   }) async {
//     if (sellerProuducts[sellerId] != null && !isrefreshMode) return true;
//     try {
//       var productDocs = await db
//           .collection(AppDBConstants.productsCollection)
//           .where('sellerId', isEqualTo: sellerId)
//           .limit(limit)
//           .get();

//       if (productDocs.docs.isNotEmpty) {
//         shopProducts = {
//           for (var e in productDocs.docs) e.id: Product.fromJson(e.data())
//         };
//         sellerProuducts[sellerId] = shopProducts;
//         Helpers.debugLog('SELLER[$sellerId]$sellerProuducts');
//         return true;
//       }
//     } catch (e) {
//       Helpers.debugLog('An error occurred while getting products: $e');
//     }
//     return false;
//   }

//   Map<String, Map<String, Product>> sellerProuductsSimilar = {};

//   /// This function retrieves a limited number of products from a database and stores them in a map if
//   /// they exist.
//   ///
//   /// Args:
//   ///   isrefreshMode (bool): A boolean value that indicates whether the function is being called in
//   /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
//   /// the data and not to retrieve it for the first time. Defaults to false
//   ///   limit (int): The maximum number of similar products to retrieve from the database. The default
//   /// value is 4, but it can be changed by passing a different value as an argument. Defaults to 4
//   ///
//   /// Returns:
//   ///   A Future<bool> is being returned.
//   Future<bool> getSimilarItems(
//       {bool isrefreshMode = false,
//       int limit = 6,
//       required String category,
//       required String productId}) async {
//     if (sellerProuductsSimilar[category] != null && !isrefreshMode) {
//       return true;
//     }

//     try {
//       var productDocs = await db
//           .collection(AppDBConstants.productsCollection)
//           .where(ProductFields.productId, isNotEqualTo: productId)
//           .where(ProductFields.category, isEqualTo: category)
//           .limit(limit)
//           .get();

//       if (productDocs.docs.isNotEmpty) {
//         similarProducts = {
//           for (var e in productDocs.docs) e.id: Product.fromJson(e.data())
//         };
//         products.addAll(similarProducts);
//         sellerProuductsSimilar[category] = similarProducts;
//         return true;
//       }
//     } catch (e) {
//       Helpers.debugLog('An error occurred while getting similar products: $e');
//     }
//     return false;
//   }

//   Map<String, Product> products = {};

//   /// This function retrieves a single product from a database and updates the existing products list
//   /// with the new product.
//   ///
//   /// Args:
//   ///   productId (String): A required String parameter that represents the ID of the product that needs
//   /// to be retrieved.
//   ///   isRefereshMode (bool): A boolean value that indicates whether the function is being called in
//   /// refresh mode or not. If it is set to true, it means that the function is being called to refresh
//   /// the data and not to retrieve it for the first time. Defaults to false
//   /// This is a function that retrieves a single product by its ID and can optionally refresh the data.
//   ///
//   /// Args:
//   ///   productId (String): A required parameter of type String that represents the unique identifier of
//   /// the product that needs to be fetched.
//   ///   isRefereshMode (bool): The `isRefereshMode` parameter is a boolean value that indicates whether
//   /// the function is being called in refresh mode or not. If `isRefereshMode` is `true`, it means that
//   /// the function is being called to refresh the data for the given `productId`. If `isReferesh.
//   /// Defaults to false
//   ///
//   /// Returns:
//   ///   A `Future<bool>` is being returned.
//   Future<bool> getSingleProduct(
//       {required String productId, bool isRefereshMode = false}) async {
//     // the products should be the currenly available ones
//     if (products[productId] != null && !isRefereshMode) return true;
//     // get the product
//     try {
//       var data = await db
//           .collection(AppDBConstants.productsCollection)
//           .doc(productId)
//           .get();
//       if (!data.exists) {
//         ShortMessages.showShortMessage(
//             message:
//                 "The selected item is not available, please try again later");
//         return false;
//       }
//       final product = Product.fromJson(data.data()!);

//       ///update the existing products to have this

//       products[productId] = product;

//       // since the the productViewPage, when you call this furure you'll be using the products call in the future,
//       // you'll access product like this products[productId] from the navigation arguments

//       return true;

//       // update the products
//     } catch (e) {
//       // if there is an error let the user know
//       ShortMessages.showShortMessage(
//           message:
//               "Something broke, or the item is not available, please try again later");
//       return false;
//     }
//   }

//   /// This function generates a dynamic link for a product and returns it, or returns null if an error
//   /// occurs.
//   ///
//   /// Args:
//   ///   product (Product): A required parameter of type Product, which represents the product for which
//   /// the link is being created.
//   ///   context (BuildContext): The BuildContext is a parameter that represents the location of a widget
//   /// within the widget tree. It is used to access the theme, media query, and other properties of the
//   /// current context. In this case, it is used to create a dynamic link for a product using the
//   /// ProductInfoView routeName.
//   ///
//   /// Returns:
//   ///   The method is returning a `Future` of `String?`, which means it will either return a `String`
//   /// value or `null`.
//   Future<String?> getProductLink({
//     required Product product,
//     required BuildContext context,
//   }) async {
//     setLoadingProductLink(productId: product.productId!);
//     if (loadedProductLinks.containsKey(product.productId!)) {
//       setLoadingProductLink(productId: product.productId!, isLoading: false);
//       return loadedProductLinks[product.productId!];
//     }
//     try {
//       var productLink = await DynamicLinkServices.createLink(
//         context: context,
//         appPath: ProductInfoView.routeName,
//         params: {ProductFields.productId: product.productId!},
//         title: product.label!,
//         description: product.description!,
//         mediaUrl: product.heroImage,
//       );

//       setLoadingProductLink(productId: product.productId!, isLoading: false);
//       updateProductLink(
//         productId: product.productId!,
//         productLink: productLink,
//       );

//       return productLink;
//     } catch (e) {
//       setLoadingProductLink(productId: product.productId!, isLoading: false);
//       ShortMessages.showShortMessage(
//           type: ShortMessageType.error,
//           message:
//               'An error occurred while creating the product link, please try again');
//       return null;
//     }
//   }

//   Map<String, String> _loadedProductLinks = {};

//   /// > This is the loaded product links map
//   Map<String, String> get loadedProductLinks => _loadedProductLinks;

//   set loadedProductLinks(Map<String, String> loadedProductLinks) {
//     _loadedProductLinks = loadedProductLinks;
//     notifyListeners();
//   }

//   Map<String, bool> _loadingProductLinks = {};

//   /// > This is the loading product links map
//   Map<String, bool> get loadingProductLinks => _loadingProductLinks;
//   set loadingProductLinks(Map<String, bool> loadingProductLinks) {
//     _loadingProductLinks = loadingProductLinks;
//     notifyListeners();
//   }

//   Map<String, bool> _loadingProductLike = {};
//   Map<String, bool> get loadingProductLike => _loadingProductLike;
//   set loadingProductLike(Map<String, bool> value) {
//     _loadingProductLike = value;
//     notifyListeners();
//   }

//   void updateProductLink(
//       {required String productId, required String productLink}) {
//     loadedProductLinks[productId] = productLink;
//     notifyListeners();
//   }

//   void setLoadingProductLink(
//       {required String productId, bool isLoading = true}) {
//     loadingProductLinks[productId] = isLoading;
//     notifyListeners();
//   }

//   bool productLinkIsLoading({required String productId}) {
//     return loadingProductLinks[productId] ?? false;
//   }

//   /// This function shares a product by generating a link and using the Share plugin to share it.
//   ///
//   /// Args:
//   ///   productId (String): A required String parameter that represents the ID of the product to be
//   /// shared.
//   ///   context (BuildContext): The `BuildContext` parameter is used to provide the context in which the
//   /// method is being called. It is typically used to access resources such as themes, localization, and
//   /// navigation.
//   ///
//   /// Returns:
//   ///   If the product is null, an error message is shown and the function returns. If the link is null,
//   /// the function also returns. Otherwise, the link is shared using the Share plugin. The function
//   /// returns void.
//   Future<void> shareProuct(
//       {required String productId, required BuildContext context}) async {
//     final product = products[productId];
//     if (product == null) {
//       ShortMessages.showShortMessage(
//           type: ShortMessageType.error,
//           message: 'An error occurred, try again later !');
//       return;
//     }
//     final link = await getProductLink(product: product, context: context);
//     if (link == null) return;
//     Share.share(link);
//   }

//   /// This function allows a user to like or unlike a product and updates the product's likes count in
//   /// the database.
//   ///
//   /// Args:
//   ///   product (Product): A required parameter of type Product, which represents the product that the
//   /// user wants to like or unlike.
//   ///   userId (String): A required String parameter representing the unique identifier of the user who
//   /// is liking the product.
//   ///
//   /// Returns:
//   ///   a `Future<void>`.
//   Future<void> likeProduct({
//     required String productId,
//   }) async {
//     BuildContext? context = NavigationService.navigatorKey.currentContext;
//     if (context == null) return;
//     var product = products[productId]!;

//     if (userId == null) {
//       NavigationService.navigate(
//         context,
//         AuthGenesisPage.routeName,
//         forever: true,
//       );
//       return;
//     }

//     var likes = product.likes!.toSet();
//     Map<Object, Object> updateField = {};
//     if (hasUserLiked(product.productId!, userId!)) {
//       likes.remove(userId);
//       updateField[ProductFields.likes] = FieldValue.arrayRemove([userId]);
//     } else {
//       likes.add(userId!);
//       updateField[ProductFields.likes] = FieldValue.arrayUnion([userId]);
//     }

//     _updateLikes(product.productId!, likes.toList());

//     try {
//       await db
//           .collection(AppDBConstants.productsCollection)
//           .doc(product.productId)
//           .update(updateField);
//       getSingleProduct(productId: product.productId!, isRefereshMode: true);
//     } catch (e) {
//       Helpers.debugLog('Unable to update product likes: $e');
//     }
//   }

//   /// The function checks if a user has liked a specific product.
//   ///
//   /// Args:
//   ///   productId (String): The ID of the product for which we want to check if the user has liked it.
//   ///   userId (String): The userId parameter is a string that represents the unique identifier of a
//   /// user.
//   ///
//   /// Returns:
//   ///   A `Future<bool>` is being returned.
//   bool hasUserLiked(String productId, String? userId) {
//     var data = products[productId];
//     if (data != null && userId != null) {
//       var product = data;
//       return product.likes!.contains(userId);
//     }
//     return false;
//   }

//   void _updateLikes(String productId, List<String> likes) {
//     products[productId] = products[productId]!.copyWith(likes: likes);
//     notifyListeners();
//   }
// }
