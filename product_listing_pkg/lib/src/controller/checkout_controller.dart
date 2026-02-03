import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show AccountType;
import 'package:product_listing_pkg/test_data/test_data.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

import '../pages/bag/widgets/account_card.dart';

class CheckoutController extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  BorderRadius _borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(4), topLeft: Radius.circular(4));
  BorderRadius get borderRadius => _borderRadius;

  /// A setter method that sets the value of the _borderRadius variable to the value passed in, and then
  /// calls the notifyListeners() method.
  set borderRadius(BorderRadius value) {
    _borderRadius = value;
    notifyListeners();
  }

  /// It returns a Timer object that calls the function func every duration milliseconds.
  ///
  /// Args:
  ///   duration (Duration): The duration of the timer.
  ///   func: The function to be called when the timer expires.
  Timer interval(Duration duration, func) {
    Timer function() {
      Timer timer = Timer(duration, function);
      func(timer);
      return timer;
    }

    return Timer(duration, function);
  }

  int _selectedDeliveryIndex = 0;
  int get selectedDeliveryIndex => _selectedDeliveryIndex;

  set selectedDeliveryIndex(int value) {
    _selectedDeliveryIndex = value;
    if (value == 0) {
      borderRadius = const BorderRadius.only(
          bottomLeft: Radius.circular(4), topLeft: Radius.circular(4));
    } else {
      borderRadius = const BorderRadius.only(
          bottomRight: Radius.circular(4), topRight: Radius.circular(4));
    }
    notifyListeners();
  }

  void setState() {
    notifyListeners();
  }

  List<Map<String, dynamic>> tabs = [
    {'image': 'assets/images/location.png', 'title': 'Home/Office'},
    {'image': 'assets/images/shop.png', 'title': 'Pickup'}
  ];

  List<Map<String, dynamic>> checkoutLabels = [
    {'image': 'assets/images/house.png', 'title': 'Home'},
    {'image': 'assets/images/buildings.png', 'title': 'Office'},
    {'image': 'assets/images/more_circle.png', 'title': 'Other'}
  ];

  int? _selectedLabel;
  int? get selectedLabel => _selectedLabel;
  set selectedLabel(int? value) {
    _selectedLabel = value;
    notifyListeners();
  }

  bool isLabelSelected(int index) => _selectedLabel == index;

  List<Map<String, dynamic>> get pickUpPoints => AppUtil.pickUpPoints;

  void updateFilterValues({
    required String key,
    String? value,
    required int index,
  }) {
    pickUpPoints[index]['value'] = value;
    if (key.toLowerCase().contains('town')) {
      selectedTown = value ?? '';
    } else {
      selectedPoint = value ?? '';
    }
    collapse(index, true);

    notifyListeners();
  }

  bool _isStorePicked = false;
  bool get isStorePicked => _isStorePicked;

  set isStorePicked(bool value) {
    _isStorePicked = value;

    notifyListeners();
  }

  void togglePoint(int index) {
    pickUpPoints[index]['isOpen'] = !pickUpPoints[index]['isOpen'];
    isActive = true;
    notifyListeners();
  }

  String _selectedAccount = '';
  String get selectedAccount => _selectedAccount;
  set selectedAccount(String value) {
    _selectedAccount = value;
    notifyListeners();
  }

  void addAddAccount(int index, String account) {
    paymentOptions[index]['account'] = account;
    selectedAccount = _selectedAccount;
    notifyListeners();
  }

  bool _isActive = false;
  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
    notifyListeners();
  }

  bool _shouldPickStore = false;
  bool get shouldPickStore => _shouldPickStore;

  set shouldPickStore(bool value) {
    _shouldPickStore = value;
    notifyListeners();
  }

  void collapse(int index, [bool closeAll = false]) {
    for (var point in pickUpPoints) {
      if (closeAll) {
        point['isOpen'] = false;
      } else {
        if (pickUpPoints.indexOf(point) != index) {
          point['isOpen'] = false;
        }
      }
    }
    isActive = false;
    notifyListeners();
  }

  String _selectedTown = '';
  String get selectedTown => _selectedTown;

  set selectedTown(String value) {
    _selectedTown = value;
    notifyListeners();
  }

  String _selectedPoint = '';
  String get selectedPoint => _selectedPoint;
  set selectedPoint(String value) {
    _selectedPoint = value;
    notifyListeners();
  }

  List<String> getLocations(int index) => pickUpPoints[index]['options'];

  List<Map<String, dynamic>> checkoutProcess = [
    {
      'title': 'Delivery',
      'isComplete': false,
    },
    {
      'title': 'Payment',
      'isComplete': false,
    },
    {
      'title': 'Review',
      'isComplete': false,
    }
  ];

  void resetCheckoutProcess() {
    checkoutProcess[0]['isComplete'] = false;
    checkoutProcess[1]['isComplete'] = false;
    checkoutProcess[2]['isComplete'] = false;
    paymentOptions[0]['isSelected'] = false;
    paymentOptions[1]['isSelected'] = false;
    paymentOptions[2]['isSelected'] = false;
  }

  Map<String, dynamic> location = {};

  List<Map<String, dynamic>> userLocations = [];

  List<Map<String, dynamic>> pickedLocations = TestData.pickedLocations;

  bool get hasSelected => userLocations.any((value) => value['isSelected']);

  /// This function checks if certain conditions are met and executes a callback function if they are.
  ///
  /// Args:
  ///   callback (void Function()): A function that will be called if certain conditions are met in the
  /// checkDetails function.
  ///   index (int): The index parameter is an optional integer parameter with a default value of -1. It
  /// is used to determine which step of the checkout process is being checked. If the index is not
  /// equal to 2 and certain conditions are met, the callback function is called and the checkout
  /// process is updated. Defaults to -1
  Future<void> checkDetails(void Function() callback,
      [int index = -1, bool allow = false]) async {
    if ((isStorePicked || allow) && index != 2) {
      callback();
      selectedIndex = index;
      selectedDeliveryIndex = 0;
      checkoutProcess[0]['isComplete'] = true;
    }
  }

  AccountType? _paymentType;
  AccountType? get paymentType => _paymentType;
  set paymentType(AccountType? value) {
    _paymentType = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> paymentOptions = AppUtil.paymentOptions;

  bool get userIsAlmostFinished =>
      isStorePicked &&
      selectedTown.isNotEmpty &&
      selectedPoint.isNotEmpty &&
      hasChosenPayment;

  /// It takes in a map and a string, and then it sets the isSelected property of the map to true, and
  /// the isSelected property of all other maps in the list to false
  ///
  /// Args:
  ///   data (Map<String, dynamic>): The data of the selected payment option.
  ///   text (String): The text that the user has entered into the text field.
  void choosePayment(Map<String, dynamic> data, [String text = '']) {
    var index = paymentOptions.indexOf(data);
    for (var option in paymentOptions) {
      option['isSelected'] = false;
    }
    paymentOptions[index]['isSelected'] = !paymentOptions[index]['isSelected'];
    paymentType = paymentOptions[index]['type'] as AccountType;
    if (text.length >= 4 && index != 0) {
      paymentOptions[index]['account'] = 'ending in ${text.substring(0, 4)}';
    }
    hasChosenPayment = true;

    notifyListeners();
  }

  bool get isCheckoutInPayment => _selectedIndex == 1;

  bool _hasChosenPayment = false;
  bool get hasChosenPayment => _hasChosenPayment;
  set hasChosenPayment(bool value) {
    _hasChosenPayment = value;
    notifyListeners();
  }

  Map<String, dynamic>? get chosenPaymentOption =>
      paymentOptions.firstWhere((value) => value['isSelected']);

  TextEditingController discountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  GlobalKey<FormState> selectLocationKey = GlobalKey();

  bool get hasDiscount => discountController.text.isNotEmpty;

  CardType? _cardType;
  CardType? get cardType => _cardType;
  set cardType(CardType? value) {
    _cardType = value;
    notifyListeners();
  }

  bool _showGlow = false;
  bool get showGlow => _showGlow;
  set showGlow(bool value) {
    _showGlow = value;
    notifyListeners();
  }

  /// It starts a timer that runs for 4 seconds, and then calls a callback function
  ///
  /// Args:
  ///   callback (void Function()): The function to be called after the timer is complete.
  void startTimer(void Function() callback, [int index = 1]) async {
    var i = 0;
    interval(const Duration(milliseconds: 1000), (time) {
      i++;
      if (kDebugMode) {
        print('[TIME]====$i');
      }
      if (i == 4) {
        time.cancel();
        showGlow = false;
        allowTransaction = false;
        checkoutProcess[index]['isComplete'] = true;
        selectedIndex = index;
        callback();
      }
    });
  }

  bool get hasCompleted => checkoutProcess.any((value) => !value['isComplete']);

  bool _allowTransaction = false;
  bool get allowTransaction => _allowTransaction;
  set allowTransaction(bool value) {
    _allowTransaction = value;
    notifyListeners();
  }

  /// The function resets the checkout process by setting all steps to incomplete and resetting the
  /// selected index to 0.
  void reset() {
    for (var process in checkoutProcess) {
      process['isComplete'] = false;
    }
    selectedIndex = 0;
    notifyListeners();
  }
}
