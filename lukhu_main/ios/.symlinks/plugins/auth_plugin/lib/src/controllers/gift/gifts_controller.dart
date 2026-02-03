import 'dart:async';
import 'dart:developer';

import 'package:auth_plugin/src/utils/app_util.dart';
import 'package:flutter/material.dart';

class GiftsController extends ChangeNotifier {
  List<Map<String, dynamic>> availableGifts = AppUtil.availableGifts;

  Map<String, dynamic> terms = AppUtil.terms;

  GiftsController() {
    init();
  }

  int? _selectedGift;
  int? get selectedGift => _selectedGift;
  set selectedGift(int? value) {
    _selectedGift = value;
    notifyListeners();
  }

  String _selectedGiftLabel = '';
  String get selectedGiftLabel => _selectedGiftLabel;
  set selectedGiftLabel(String value) {
    _selectedGiftLabel = value;
    notifyListeners();
  }

  List<String> gifts = ['500', '1,000', '2,000', '4,000', '5,000', '6,000'];

  bool isColor(int value) => _selectedGift == value;

  void setGift(String value) {
    if (gifts.any((data) => data == value)) {
      selectedGift = gifts.indexOf(value);
      selectedGiftLabel = value;
    }
  }

  Recipient? _recipient;
  Recipient? get recipient => _recipient;
  set recipient(Recipient? value) {
    _recipient = value;
    cardDetailsFilled = value == Recipient.myself;
    isGiftForSelf = cardDetailsFilled;
    notifyListeners();
  }

  bool _isGiftForSelf = false;
  bool get isGiftForSelf => _isGiftForSelf;
  set isGiftForSelf(bool value) {
    _isGiftForSelf = value;
    notifyListeners();
  }

  /// The function returns a string based on the input value of the Recipient enum.
  ///
  /// Args:
  ///   value (Recipient): The parameter "value" is of type "Recipient", which is an enum type. It
  /// represents the intended recipient of a purchase and can have two possible values: "myself" or
  /// "someone".
  ///
  /// Returns:
  ///   The function `getRecipient` returns a string value based on the input parameter `value` of the
  /// `Recipient` enum type. If `value` is equal to `Recipient.myself`, the function returns the string
  /// `'Buying for my self'`. If `value` is equal to `Recipient.someone`, the function returns the
  /// string `'Buying for someone else'`.
  String getRecipient(Recipient value) {
    switch (value) {
      case Recipient.myself:
        return 'Buying for my self';
      case Recipient.someone:
        return 'Buying for someone else';
    }
  }

  late TextEditingController giftCardNumberController;
  late TextEditingController giftCardPinController;

  late GlobalKey<FormState> giftFormKey;

  late TextEditingController recipientNameController;
  late TextEditingController recipientEmailController;
  late TextEditingController recipientPhoneController;

  late TextEditingController yourNameController;
  late TextEditingController yourNoteController;

  late GlobalKey<FormState> payCardFormKey;

  /// The function initializes various controllers and keys for form validation in a gift card and
  /// payment card form.
  void init() {
    giftCardNumberController = TextEditingController();
    giftCardPinController = TextEditingController();
    giftFormKey = GlobalKey<FormState>();

    payCardFormKey = GlobalKey();
    recipientNameController = TextEditingController();
    recipientEmailController = TextEditingController();
    recipientPhoneController = TextEditingController();

    yourNameController = TextEditingController();
    yourNoteController = TextEditingController();
  }

  List<Map<String, dynamic>> giftPayProcess = [
    {
      'title': 'Pick Card',
      'isComplete': false,
    },
    {
      'title': 'Details',
      'isComplete': false,
    },
    {
      'title': 'Payment',
      'isComplete': false,
    }
  ];

  List<Map<String, dynamic>> paymentOptions = AppUtil.paymentOptions;

  /// The function checks if a form is valid and updates the payment options and selected index
  /// accordingly, then calls a callback function.
  ///
  /// Args:
  ///   callback (void Function()): A function that will be called after the details are checked. It is
  /// not defined in the code snippet provided, so it must be defined elsewhere in the code.
  ///   index (int): An optional integer parameter with a default value of -1. It is used to determine
  /// the index of the payment option selected. If the value of index is 0, the selectedIndex variable
  /// is set to 0 and the callback function is called. Defaults to -1
  void checkDetails(void Function() callback, [int index = -1]) {
    log('[INDEX]$index');

    if (payCardFormKey.currentState?.validate() ?? false) {
      paymentOptions[0]['isComplete'] = true;
      selectedIndex = index;
      cardDetailsFilled = true;
      log('[INDEX]$paymentOptions');
      callback();
    }

    if (index == 0) {
      selectedIndex = index;
      callback();
    }
  }

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  int? _selectedPayment;
  int? get selectedPayment => _selectedPayment;

  set selectedPayment(int? value) {
    _selectedPayment = value;
    notifyListeners();
  }

  bool _hasBalance = true;
  bool get hasBalance => _hasBalance;
  set hasBalance(bool value) {
    _hasBalance = value;
    notifyListeners();
  }

  /// This function sets the payment method for a given index based on the provided value.
  ///
  /// Args:
  ///   index (int): The index parameter is an integer value that represents the index of the payment
  /// option in the paymentOptions list that needs to be updated.
  ///   value (Object): value is an optional parameter of type Object. It can hold any type of value,
  /// including null.
  void setPaymentMethod(int index, Object? value) {
    if (value != null) {
      var data = value as Map<String, dynamic>;
      paymentOptions[index]['account'] = data['account'];
    }
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
  void startTimer(void Function() callback) async {
    showGlow = true;
    var i = 0;
    interval(const Duration(milliseconds: 1000), (time) {
      i++;

      if (i == 4) {
        time.cancel();
        showGlow = false;
        callback();
      }
    });
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

  bool get allowComplete => cardDetailsFilled && _selectedPayment != null;

  bool _cardDetailsFilled = false;
  bool get cardDetailsFilled => _cardDetailsFilled;

  set cardDetailsFilled(bool value) {
    _cardDetailsFilled = value;
    notifyListeners();
  }

  void clear() {
    recipientEmailController.clear();
    recipientEmailController.clear();
    recipientPhoneController.clear();

    yourNameController.clear();
    yourNoteController.clear();
    cardDetailsFilled = false;

    selectedPayment = null;
    recipient = null;
  }
}
