import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppDBConstants,
        FieldValue,
        FirebaseFirestore,
        Helpers,
        Product,
        ProductFields,
        Shop,
        ShopFields;

class ShopController extends ChangeNotifier {
  final db = FirebaseFirestore.instance;

  Map<String, Shop> _shops = {};
  Map<String, Shop> get shops => _shops;
  set shops(Map<String, Shop> value) {
    _shops = value;
    notifyListeners();
  }

  Map<String, Product> _storeProducts = {};
  Map<String, Product> get storeProducts => _storeProducts;
  set storeProducts(Map<String, Product> value) {
    _storeProducts = value;
    notifyListeners();
  }

  Map<String, Map<String, Shop>> userShops = {};

  /// This function retrieves a limited number of shops from a database and returns a boolean indicating
  /// whether the operation was successful.
  ///
  /// Args:
  ///   isRefreshMode (bool): A boolean value that indicates whether the function is being called in
  /// refresh mode or not. If it is true, it means that the function is being called to refresh the data
  /// and should not return any cached data. Defaults to false
  ///   limit (int): The limit parameter is an optional integer value that specifies the maximum number
  /// of shop documents to retrieve from the database. The default value is 2, but it can be overridden
  /// by passing a different value when calling the function. Defaults to 2
  ///
  /// Returns:
  ///   A `Future<bool>` is being returned.
  Future<bool> getShops({bool isRefreshMode = false, int limit = 2}) async {
    if (shops.isNotEmpty && !isRefreshMode) return false;
    try {
      var shopDocs =
          await db.collection(AppDBConstants.shopCollection).limit(limit).get();

      if (shopDocs.docs.isNotEmpty) {
        shops = {for (var e in shopDocs.docs) e.id: Shop.fromJson(e.data())};
        return true;
      }
    } catch (e) {
      Helpers.debugLog('An error occurred while getting shops: $e');
    }
    return false;
  }

  Shop? shop(int index, Map<String, Shop> value) {
    return value[_productKey(index, value)];
  }

  String _productKey(int index, Map<String, Shop> value) {
    return value.keys.elementAt(index);
  }

  /// This function retrieves a specified number of products from a Firestore collection based on a
  /// given seller ID.
  ///
  /// Args:
  ///   userId (String): A required String parameter representing the ID of the user whose products are
  /// being retrieved.
  ///   limit (int): The limit parameter is an optional integer that specifies the maximum number of
  /// products to retrieve from the database. The default value is 2 if no value is provided. Defaults
  /// to 2
  ///
  /// Returns:
  ///   A `Future` that resolves to a `Map` of `String` keys and `Product` values, representing the
  /// products of a store with the given `userId`. If the `userId` is empty, an empty `Map` is returned.
  /// If an error occurs while getting the products, an error message is logged and an empty `Map` is
  /// returned.
  Future<Map<String, Product>> getStoreProduct(
      {required String userId,
      int limit = 2,
      bool isRefreshMode = false}) async {
    Map<String, Product> products = {};
    if (userId.isEmpty) return products;
    try {
      var productDocs = await db
          .collection(AppDBConstants.productsCollection)
          .where(ProductFields.sellerId, isEqualTo: userId)
          .orderBy(ProductFields.createdAt, descending: true)
          .limit(limit)
          .get();

      if (productDocs.docs.isNotEmpty) {
        products = {
          for (var e in productDocs.docs) e.id: Product.fromJson(e.data())
        };
      }
    } catch (e) {
      Helpers.debugLog('An error occurred while getting shops: $e');
    }
    return products;
  }

  /// This function retrieves a single shop from a Firestore database and returns it as a Map with the
  /// shop ID as the key and the Shop object as the value.
  ///
  /// Args:
  ///   shopId (String): The parameter shopId is a String that represents the unique identifier of a
  /// shop.
  ///
  /// Returns:
  ///   A `Future` object that resolves to a `Map` of `String` keys and `Shop` values. If the `shopId`
  /// parameter is empty, an empty `Map` is returned. If there is an error while getting the shop data,
  /// an error message is logged and an empty `Map` is returned.
  Future<Map<String, Shop>> getUserShop(
      {required String shopId, bool isRefreshMode = false}) async {
    Map<String, Shop> shop = {};
    if (userShops[shopId] != null && !isRefreshMode) return userShops[shopId]!;
    try {
      var shopDoc =
          await db.collection(AppDBConstants.shopCollection).doc(shopId).get();

      if (shopDoc.exists) {
        shop = {shopDoc.id: Shop.fromJson(shopDoc.data()!)};
        userShops[shopId] = shop;
      }
      shops.addAll(shop);
    } catch (e) {
      Helpers.debugLog('An error occurred while getting shops: $e');
    }
    return shop;
  }

  /// The function checks if a user has followed a specific shop.
  ///
  /// Args:
  ///   userId (String): A nullable String representing the ID of the user who may have followed the
  /// shop.
  ///   shopId (String): A required parameter of type String that represents the ID of the shop being
  /// checked for followers.
  ///
  /// Returns:
  ///   a boolean value indicating whether a user with the given userId has followed the shop with the
  /// given shopId. If the userId is not provided or is null, the function returns false.
  bool hasFollowedShop({
    String? userId,
    required String shopId,
  }) {
    var shop = shops[shopId];
    if (shop != null) {
      return shop.followers!.contains(userId);
    }
    return false;
  }

  /// This function allows a user to follow or unfollow a shop by updating the shop's list of followers.
  ///
  /// Args:
  ///   userId (String): A nullable String representing the ID of the user who wants to follow or
  /// unfollow a shop. If it is null, the function returns without doing anything.
  ///   shopId (String): A required String parameter representing the ID of the shop that the user wants
  /// to follow or unfollow.
  ///
  /// Returns:
  ///   If `userId` is `null`, nothing is returned explicitly but the function will exit early due to
  /// the `return` statement. Otherwise, nothing is returned explicitly as the return type is
  /// `Future<void>`.
  Future<void> followShop({
    String? userId,
    required String shopId,
  }) async {
    var shop = shops[shopId];

    if (shop == null) return;
    var followers = shop.followers!.toSet();
    Map<Object, Object> updateField = {};
    if (hasFollowedShop(shopId: shopId, userId: userId)) {
      followers.remove(userId);
      updateField[ShopFields.followers] = FieldValue.arrayRemove([userId]);
    } else {
      followers.add(userId!);
      updateField[ShopFields.followers] = FieldValue.arrayUnion([userId]);
    }

    _updateFollowers(shopId, followers.toList());

    try {
      await db
          .collection(AppDBConstants.shopCollection)
          .doc(shopId)
          .update(updateField);
      updateFollowing(
        userId!,
        shop.userId!,
      );

      getUserShop(shopId: shopId, isRefreshMode: true);
    } catch (e) {
      Helpers.debugLog('Unable to update shop followers: $e');
    }
  }

  /// This function updates the list of shops that a user is following in a database and updates the
  /// user's shop information.
  ///
  /// Args:
  ///   userId (String): The ID of the user who is performing the updateFollowing operation.
  ///   shopOwner (String): The ID of the shop owner that the user wants to follow/unfollow.
  ///
  /// Returns:
  ///   If the `shop` variable is `null`, then the function will return without doing anything.
  /// Otherwise, the function will execute the rest of the code.
  Future<void> updateFollowing(
    String userId,
    String shopOwner,
  ) async {
    var shop = getShop(userId);
    if (shop == null) return;
    var following = shop.following!.toSet();
    Map<Object, Object> updateField = {};
    if (!following.contains(shopOwner)) {
      following.add(shopOwner);
      updateField[ShopFields.following] = FieldValue.arrayUnion([shopOwner]);
    } else {
      following.remove(shopOwner);
      updateField[ShopFields.following] = FieldValue.arrayRemove([shopOwner]);
    }
    _updateFollowers(shop.shopId!, following.toList(), false);
    try {
      await db
          .collection(AppDBConstants.shopCollection)
          .doc(shop.shopId)
          .update(updateField);

      getUserShop(shopId: shop.shopId!, isRefreshMode: true);
    } catch (e) {
      Helpers.debugLog('Unable to update shop following: $e');
    }
  }

  /// This function updates the followers or following list of a shop and notifies listeners.
  ///
  /// Args:
  ///   shopId (String): A string representing the unique identifier of a shop.
  ///   value (List<String>): A list of strings representing the followers or following of a shop.
  ///   updateFollowers (bool): A boolean parameter that determines whether the followers or following
  /// list of a shop should be updated. If it is set to true, the followers list will be updated, and if
  /// it is set to false, the following list will be updated. Defaults to true
  void _updateFollowers(String shopId, List<String> value,
      [bool updateFollowers = true]) {
    var shop = shops[shopId];
    if (shop != null) {
      if (updateFollowers) {
        shop = shop.copyWith(followers: value);
        shops[shopId] = shop;
        getStoresStats(shopId);
      } else {
        shop = shop.copyWith(following: value);
        shops[shopId] = shop;
      }
    }

    notifyListeners();
  }

  /// The function checks if a given user owns a shop by comparing the shop's user ID with the given
  /// user ID.
  ///
  /// Args:
  ///   shop (Shop): The shop parameter is a nullable Shop object, which represents a shop in a system.
  ///   userId (String): The ID of the user that we want to check if they own the shop.
  ///
  /// Returns:
  ///   a boolean value indicating whether the user with the given userId owns the shop or not. If the
  /// shop is not null and its userId matches the given userId, the function returns true. Otherwise, it
  /// returns false.
  bool userOwnsShop(String shopId, String userId) {
    var shop = shops[shopId];
    if (shop != null) {
      return shop.userId == userId;
    }
    return false;
  }

  Shop? getShop(String userId) {
    var shop = shops.values.toList();
    var index = shop.indexWhere((value) => value.userId == userId);
    if (index != -1) {
      return shop[index];
    }
    return null;
  }

  final List<Map<String, dynamic>> _storeStats = [
    {'title': 'Seller Rating', 'description': '0'},
    {'title': 'Transactions', 'description': '0'},
    {'title': 'Followers', 'description': '0'},
    {'title': 'Following', 'description': '0'}
  ];

  List<Map<String, dynamic>> get storeStats => _storeStats;

  /// This function updates the store statistics based on the selected shop's rating, number of
  /// transactions, followers, and following.
  ///
  /// Args:
  ///   value (String): The value parameter is a string that is used to retrieve a shop object from a
  /// map called "shops". The method then updates the values of a list called "_storeStats" based on the
  /// properties of the retrieved shop object. Finally, it notifies any listeners that the data has been
  /// updated.
  ///
  /// Returns:
  ///   If the value of `shop` is `null`, then nothing is returned and the function execution stops.
  void getStoresStats(String shopId) {
    var shop = shops[shopId];
    if (shop == null) return;
    _storeStats[0]['description'] = '${shop.shopRating}';
    _storeStats[1]['description'] = '${shop.transactions!.length}';
    _storeStats[2]['description'] = '${shop.followers!.length}';
    _storeStats[3]['description'] = '${shop.following!.length}';
    notifyListeners();
  }

  final List<Map<String, dynamic>> storeBadges = [
    {
      'title': 'Quick Response',
      'image': 'assets/images/flash_icon.png',
      'key': 'quick_response'
    },
    {
      'title': 'Trusted Seller',
      'image': 'assets/images/shield_tick.png',
      'key': 'trusted_seller'
    },
    {
      'title': 'Fast Shipper',
      'image': 'assets/images/truck_fast.png',
      'key': 'fast_shipper'
    },
  ];

  /// This function retrieves a list of badges earned by a shop based on its ID.
  ///
  /// Args:
  ///   shopId (String): The parameter shopId is a String that represents the unique identifier of a
  /// shop.
  ///
  /// Returns:
  ///   The function `getStoreBadges` returns a list of maps, where each map contains a set of key-value
  /// pairs with dynamic values. The keys in the maps are strings.
  List<Map<String, dynamic>> getStoreBadges(String shopId) {
    List<Map<String, dynamic>> badges = [];
    var shop = shops[shopId];
    if (shop != null) {
      for (var shopBadge in storeBadges) {
        if (shop.earnedBadges!.contains(shopBadge['key'])) {
          badges.add(shopBadge);
        }
      }
    }
    return badges;
  }
}
