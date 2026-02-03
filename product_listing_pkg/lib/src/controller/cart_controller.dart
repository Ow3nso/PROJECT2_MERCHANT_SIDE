import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AccountType,
        AccountsController,
        AppDBConstants,
        BlurDialogBody,
        CustomerController,
        DeliveryStatus,
        FirebaseFirestore,
        Helpers,
        MissingDetailsCard,
        NavigationService,
        OrderDetailModel,
        OrderModel,
        PaymentModel,
        Product,
        ProductFields,
        ReadContext,
        ShortMessageType,
        ShortMessages,
        StringExtension,
        TransactionController,
        UserRepository,
        Uuid;

class CartController extends ChangeNotifier {
  Map<String, Product> cart = {};
  Set<String> productId = {};
  Set<String> sellerId = {};
  final db = FirebaseFirestore.instance;

  /// The function adds or removes a product from a cart and notifies listeners.
  ///
  /// Args:
  ///   value (Product): a Product object that represents the item being added to the cart.
  void addToCart(Product value) {
    if (value.stock! == 0) {
      ShortMessages.showShortMessage(message: '${value.label} is out of stock');
      return;
    }
    bool exists = cart.keys.any((id) => value.productId == id);

    if (exists) {
      cart.remove(value.productId);
      sellerId.remove(value.sellerId);
      productId.remove(value.productId);
      cartQuantity.remove(value.productId);
      cartSizes.remove(value.productId);
      cartColors.remove(value.productId);
    } else {
      ShortMessages.showShortMessage(message: '${value.label} added to cart');
      cart.addAll({value.productId!: value});
      sellerId.add(value.sellerId!);
      productId.add(value.productId!);
      cartQuantity[value.productId!] = 1;
    }

    notifyListeners();
  }

  /// The function checks if a given ID is present in a cart.
  ///
  /// Args:
  ///   id (String): The parameter "id" is a String representing the unique identifier of a product that
  /// is being checked if it has been added to the cart.
  ///
  /// Returns:
  ///   The function `isAddedToCart` is returning a boolean value. It returns `true` if the `id` passed
  /// as a parameter is present in the `cart` map, and `false` otherwise.
  bool isAddedToCart(String id) {
    return cart.keys.contains(id);
  }

  int get cartCount => cart.keys.length;

  Map<String, String> _cartSizes = {};
  Map<String, String> get cartSizes => _cartSizes;
  set cartSizes(Map<String, String> value) {
    _cartSizes = value;
    notifyListeners();
  }

  Map<String, String> _cartColors = {};
  Map<String, String> get cartColors => _cartColors;
  set cartColors(Map<String, String> value) {
    _cartColors = value;
    notifyListeners();
  }

  /// The function updates the quantity of a product in a cart based on whether the user wants to add or
  /// remove the product.
  ///
  /// Args:
  ///   addProduct (bool): A boolean value that indicates whether to add the product to the cart or not.
  /// If it is set to true, the quantity of the product in the cart will be increased by 1. If it is set
  /// to false, the quantity of the product in the cart will be decreased by 1. Defaults to false
  ///   value (Product): The required parameter "value" is of type "Product" and represents the product
  /// that needs to be added or removed from the cart.
  ///   action (String): The "action" parameter is a string that specifies the type of action to be
  /// performed on the cart. The default value is "add", which means that a product will be added to the
  /// cart. However, it can also be set to "remove" to remove a product from the cart. Defaults to add
  void updateCart({
    bool addProduct = false,
    required Product value,
  }) {
    var quantity = cartQuantity[value.productId]!;
    var hasStock = value.stock! > quantity;
    if (addProduct) {
      if (!hasStock) {
        ShortMessages.showShortMessage(
            message: 'Quantity added exceeds available stock');
        return;
      }
      quantity += 1;
    } else {
      if (quantity > 1) {
        quantity -= 1;
      }
    }

    cartQuantity[value.productId!] = quantity;
    notifyListeners();
  }

  /// This function checks if a given product is already present in the cart.
  ///
  /// Args:
  ///   value (Product): The parameter "value" is of type "Product", which is an object representing a
  /// product. It is used to check if the cart contains a product with the same ID as the "value"
  /// parameter.
  bool cartContains(Product value) =>
      cart.keys.any((element) => element == value.productId);

  double _cartTotal() {
    double total = 0;
    for (var cart in cart.values.toList()) {
      total += (getPrice(cart.productId!) * cartQuantity[cart.productId]!);
    }
    return total;
  }

  /// The function clears the cart and its quantity and notifies the listeners.
  void clearCart() {
    cart = {};
    order = null;
    cartQuantity = {};
    cartSizes = {};
    cartColors = {};
    initPayment = false;
    notifyListeners();
  }

  double get cartTotal => _cartTotal();

  /// The function checks if the cart has any items with a discount amount or percentage.
  ///
  /// Returns:
  ///   The function `cartHasDiscount()` returns a boolean value. It returns `true` if there is at least
  /// one item in the `cart` map that has a non-zero `discountAmount` or a positive
  /// `discountPercentage`, and `false` otherwise.
  bool cartHasDiscount() {
    if (cart.keys.isEmpty) return false;
    return cart.values.toList().any(
        (value) => value.discountAmount! != 0 || value.discountPercentage! > 0);
  }

  Map<String, int> cartQuantity = {};

  /// This function returns the quantity of a product in the cart based on its ID.
  ///
  /// Args:
  ///   productId (String): The parameter `productId` is a `String` representing the unique identifier
  /// of a product in a shopping cart.
  int getCartQuantity(String productId) => cartQuantity[productId]!;

  int getBagQuantity() {
    if (cartQuantity.isEmpty) return 0;
    var list = cartQuantity.values.toList();
    return list.reduce((value, element) => value + element);
  }

  /// This function calculates the total price of a product in a shopping cart, taking into account any
  /// discounts applied.
  ///
  /// Args:
  ///   productId (String): A string representing the ID of a product in the cart.
  ///
  /// Returns:
  ///   The function `getPrice` returns a double value which represents the total price of a product
  /// after applying any available discounts.
  double getPrice(String productId) {
    var product = cart[productId];
    double total = 0;

    if (product != null) {
      total = product.price!;
      if (product.discountAmount! != 0) {
        total -= product.discountAmount!;
      } else {
        total -= product.discountPercentage! / 100;
      }
    }
    return total;
  }

  OrderModel? _order;
  OrderModel? get order => _order;
  set order(OrderModel? value) {
    _order = value;
    notifyListeners();
  }

  bool _uploading = false;

  /// A variable that is used to determine if the app is uploading a file.
  bool get uploading => _uploading;
  set uploading(bool value) {
    _uploading = value;
    notifyListeners();
  }

  TextEditingController customerName = TextEditingController();

  String? _orderName;
  String? get orderName => _orderName;
  set orderName(String? value) {
    _orderName = value;
    notifyListeners();
  }

  Timer interval(
    Duration duration,
    void Function(Timer) func,
  ) {
    Timer function() {
      Timer timer = Timer(duration, function);
      func(timer);
      return timer;
    }

    return Timer(duration, function);
  }

  Future<void> addOrder() async {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    if (context == null) return;

    PaymentModel? accountPaymentType =
        context.read<AccountsController>().selectedMethod.keys.isNotEmpty
            ? context.read<AccountsController>().selectedMethod.values.first
            : null;
    if (accountPaymentType?.type != AccountType.mpesa) {
      ShortMessages.showShortMessage(
        message: 'Only mpesa transactions are allowed!.',
        type: ShortMessageType.warning,
      );
      return;
    }
    initPayment = true;
    final id = const Uuid().v4();
    order = OrderModel.empty();
    List<OrderDetailModel> details = [];
    context.read<TransactionController>().missingPhoneController.text =
        accountPaymentType?.account!.toPhone() ?? '';
    context.read<TransactionController>().missingNameontroller.text =
        context.read<UserRepository>().fullname;
    order = order!.copyWith(
      createdAt: DateTime.now(),
      id: id,
      orderId: formatOrderId((orderCount ?? 0) + 1),
      userId: context.read<UserRepository>().fbUser?.uid,
      statusType: DeliveryStatus.pending,
      price: _cartTotal(),
      description: 'New Order',
      paymentType: accountPaymentType?.type,
      account: accountPaymentType?.account,
      status: false,
      phoneNumber: accountPaymentType?.account?.toPhone(),
      customerId: context.read<CustomerController>().customer?.customerId,
      shopId: context.read<UserRepository>().shop?.shopId,
    );

    for (var cartItem in cart.values) {
      var detail = OrderDetailModel(
        productId: cartItem.productId,
        sellerId: cartItem.sellerId,
        quantity: cartQuantity[cartItem.productId] ?? 0,
        amount: cartItem.price,
        orderImages: cartItem.images,
        size: cartSizes[cartItem.productId],
        color: cartSizes[cartItem.productId],
      );
      details.add(detail);
    }

    order = order!.copyWith(
      items: details,
    );

    notifyListeners();
  }

  Future<bool> insertOrder() async {
    try {
      final orderRef =
          db.collection(AppDBConstants.orderCollection).doc(order!.id);
      await orderRef.set(order!.toJson());
      updateStock();
      return true;
    } catch (e) {
      Helpers.debugLog('Something happened while adding order: $e');
      return false;
    }
  }

  Map<String, String> storeImage = {};

  String? getOrderImage(OrderModel? value) {
    String? image;
    if (value != null) {
      for (var item in value.items!) {
        if (item.orderImages!.isNotEmpty) {
          image = item.orderImages!.first;
          storeImage[item.productId!] = image;
        }
      }
    }
    return image;
  }

  bool _initPayment = false;
  bool get initPayment => _initPayment;
  set initPayment(bool value) {
    _initPayment = value;
    notifyListeners();
  }

  Future<bool> showMissingDialog() async {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    if (context == null) return false;
    final response = showDialog<bool>(
      context: context,
      builder: (ctx) {
        return const BlurDialogBody(
          bottomDistance: 80,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: MissingDetailsCard(),
          ),
        );
      },
    );

    bool? result = await response;

    return Future.value(result ?? false);
  }

  // Future<void> _insertPayment(BuildContext context) async {
  //   context.read<PaymentController>().insertPayment().then(
  //     (paid) {
  //       if (paid) {
  //         ShortMessages.showShortMessage(
  //           message: 'Payment confirmed successfully.',
  //           type: ShortMessageType.success,
  //         );
  //         order = order!.copyWith(
  //           name: context
  //               .read<TransactionController>()
  //               .missingNameontroller
  //               .text
  //               .trim(),
  //           phoneNumber: context
  //               .read<TransactionController>()
  //               .missingPhoneController
  //               .text
  //               .trim()
  //               .toLukhuNumber(),
  //         );
  //         insertOrder().then((inserted) {
  //           if (inserted) {
  //             context.read<CartController>().initPayment = false;
  //             NavigationService.navigate(
  //               context,
  //               PaymentOrderView.routeName,
  //               forever: true,
  //             );
  //           } else {
  //             initPayment = false;
  //             ShortMessages.showShortMessage(
  //               message: 'Something happened. Please trye again!.',
  //               type: ShortMessageType.warning,
  //             );
  //           }
  //         });
  //       } else {
  //         context.read<CartController>().initPayment = false;
  //       }
  //     },
  //   );
  // }

  int? _orderCount;
  int? get orderCount => _orderCount;
  set orderCount(int? value) {
    _orderCount = value;
    notifyListeners();
  }

  Future<int> countOrderDocuments() async {
    final countingRef = db.collection(AppDBConstants.orderCollection);
    final count = await countingRef.get().then((value) => value.docs.length);
    return Future.value(count);
  }

  /// The function takes an integer input and returns a string with the input formatted as an order ID.
  ///
  /// Args:
  ///   input (int): The input parameter is an integer value that represents an order ID.
  ///
  /// Returns:
  ///   a formatted string that includes the input number padded with zeros and prefixed with "LO".
  String formatOrderId(int input) {
    String formattedNumber = 'LO${input.toString().padLeft(10, '0')}';
    return formattedNumber;
  }

  /// The function updates the stock count of products in a database based on the quantities in a
  /// shopping cart.
  ///
  /// Returns:
  ///   The function `updateStock()` returns a `Future<bool>`.
  Future<bool> updateStock() async {
    var collection = db.collection(AppDBConstants.productsCollection);
    var batch = db.batch();

    for (var cartItem in cart.values) {
      var updatedCount = cartItem.stock! - cartQuantity[cartItem.productId]!;
      batch.update(
        collection.doc(cartItem.productId),
        {ProductFields.stock: updatedCount},
      );
    }

    try {
      await batch.commit();
      Helpers.debugLog('Product stock updated successfully');
      return true;
    } catch (e) {
      Helpers.debugLog('Something happended while updating stock: $e');
    }

    return false;
  }
}
