import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppDBConstants,
        DeliveryStatus,
        FirebaseFirestore,
        Helpers,
        Offer,
        OfferFields,
        Product,
        ShortMessages,
        Uuid;

class OfferController extends ChangeNotifier {
  late GlobalKey<FormState> offerFormKey;
  late TextEditingController offerPricerController;
  late TextEditingController offerDescriptionController;
  final db = FirebaseFirestore.instance;

  /// The function initializes various variables and controllers to null or default values.
  void init() {
    offerPricerController = TextEditingController();
    offerFormKey = GlobalKey();
    offerDescriptionController = TextEditingController();
    product = null;
    offer = null;
  }

  Map<String, Offer> _offers = {};
  Map<String, Offer> get offers => _offers;
  set offers(Map<String, Offer> value) {
    _offers = value;
    notifyListeners();
  }

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;
  set isSubmitting(bool value) {
    _isSubmitting = value;
    notifyListeners();
  }

  Offer? _offer;
  Offer? get offer => _offer;
  set offer(Offer? value) {
    _offer = value;
    notifyListeners();
  }

  Product? _product;
  Product? get product => _product;
  set product(Product? value) {
    _product = value;
    notifyListeners();
  }

  /// The function submits an offer with the given user ID and offer details, and returns a boolean
  /// indicating whether the offer was successfully saved.
  ///
  /// Args:
  ///   userId (String): The ID of the user submitting the offer.
  ///
  /// Returns:
  ///   A Future<bool> is being returned.
  Future<bool> submitOffer({
    required String userId,
    required Product originalProduct,
  }) async {
    isSubmitting = true;
    final id = const Uuid().v4();
    product = originalProduct;
    offer = Offer.empty();
    offer = offer!.copyWith(
      userId: userId,
      productId: product!.productId!,
      id: id,
      offerPrice: double.parse(offerPricerController.text.trim()),
      description: offerDescriptionController.text,
      createdAt: DateTime.now(),
      price: product!.price,
      sellerId: product!.sellerId,
      offerType: DeliveryStatus.pending,
      images: product!.images,
    );
    if (product!.sellerId! == userId) {
      offer = offer!.copyWith(
          offerType: DeliveryStatus.approved,
          startTime: DateTime.now().millisecondsSinceEpoch,
          endTime: DateTime.now()
              .add(const Duration(hours: 24))
              .millisecondsSinceEpoch);
    }
    final offerData = offer!.toJson();
    if (!isOfferDataValid(data: offerData)) {
      isSubmitting = false;
      ShortMessages.showShortMessage(
        message: 'Please enter a valid offer price',
      );
      return false;
    }
    offer = Offer.fromJson(offerData);
    return saveOffer();
  }

  /// This function saves an offer to a database collection and returns a boolean value indicating
  /// success or failure.
  ///
  /// Returns:
  ///   A `Future<bool>` is being returned, with a value of `false`.
  Future<bool> saveOffer() async {
    try {
      final offerInsertRef =
          db.collection(AppDBConstants.offerCollection).doc(offer!.id!);
      await offerInsertRef.set(offer!.toJson());
      isSubmitting = false;
      return true;
    } catch (e) {
      ShortMessages.showShortMessage(
        message: 'An error occured while adding your offer, please try again.',
      );
      isSubmitting = false;
    }
    isSubmitting = false;
    return false;
  }

  Map<String, Map<String, Offer>> similarOffers = {};

  /// This function retrieves a user's offers from a database and stores them in a map.
  ///
  /// Args:
  ///   userId (String): A required String parameter representing the user ID for which the offers are
  /// to be fetched.
  ///   limit (int): The maximum number of offer documents to retrieve from the database. The default
  /// value is 10 if not specified. Defaults to 4
  ///   isRefreshMode (bool): A boolean flag indicating whether the function is being called in
  /// "refresh" mode, meaning that the function should bypass any cached data and retrieve fresh data
  /// from the database. If isRefreshMode is true, the function will retrieve fresh data even if
  /// similarOffers[userId] is not null. Defaults to false
  ///
  /// Returns:
  ///   A `Future<bool>` is being returned.
  Future<bool> getUserOffers({
    required String userId,
    int limit = 4,
    bool isRefreshMode = false,
  }) async {
    if (similarOffers[userId] != null && !isRefreshMode) return true;
    if (similarOffers[userId] != null && !isRefreshMode) {
      return true;
    }
    try {
      var offerDocs = await db
          .collection(AppDBConstants.offerCollection)
          .where(OfferFields.userId, isEqualTo: userId)
          .limit(limit)
          .get();
      Helpers.debugLog('[OFFERS] ${offerDocs.docs.length}');
      if (offerDocs.docs.isNotEmpty) {
        offers = {for (var e in offerDocs.docs) e.id: Offer.fromJson(e.data())};
        similarOffers[userId] = offers;

        return true;
      }
    } catch (e) {
      Helpers.debugLog('An error occurred while getting offers: $e');
    }
    return false;
  }

  /// The function checks if all required fields in a given map of offer data are not null or empty.
  ///
  /// Args:
  ///   data (Map<String, dynamic>): A required parameter of type Map<String, dynamic> that contains the
  /// data for an offer. The keys of the map represent the fields of the offer and the values represent
  /// the values of those fields.
  ///
  /// Returns:
  ///   a boolean value. It returns `true` if all the required fields in the `data` map are not null or
  /// empty strings, and `false` otherwise.
  bool isOfferDataValid({required Map<String, dynamic> data}) {
    for (final field in requiredOfferField) {
      if (data[field] == null || data[field] == '') {
        return false;
      }
    }
    return true;
  }

  final List<String> requiredOfferField = [
    OfferFields.offerPrice,
    OfferFields.price,
    OfferFields.productId,
    OfferFields.sellerId,
  ];

  bool get allowOfer => offerPricerController.text.isNotEmpty;

  /// The function returns a child offer from a map of offers based on the index provided.
  ///
  /// Args:
  ///   index (int): The index parameter is an integer value that represents the position of the desired
  /// offer in the Map of offers.
  ///   value (Map<String, Offer>): The parameter "value" is a Map object that contains key-value pairs
  /// where the key is a String and the value is an Offer object. This map is used to look up the offer
  /// corresponding to the index passed as a parameter.
  ///
  /// Returns:
  ///   The method `getChildOffer` is returning an object of type `Offer` from the `value` map based on
  /// the index provided as input. The index is used to retrieve a key from the map using the
  /// `_singleOffer` method, and the corresponding value (an `Offer` object) is returned.
  Offer? getChildOffer(int index, Map<String, Offer> value) {
    return value[_singleOffer(index, value)];
  }

  /// This function returns the key at a specific index in a map of offers.
  ///
  /// Args:
  ///   index (int): The index parameter is an integer value representing the position of the key in the
  /// Map that we want to retrieve.
  ///   value (Map<String, Offer>): A Map object with String keys and Offer values.
  ///
  /// Returns:
  ///   The `_singleOffer` function is returning a string value, which is the key at the specified index
  /// in the given map `value`.
  String _singleOffer(int index, Map<String, Offer> value) {
    return value.keys.elementAt(index);
  }
}
