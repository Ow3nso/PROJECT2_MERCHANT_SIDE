import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show GlobalAppUtil, AccountType;

class CardUtil {
  /// If the year is less than 100, then add the first two digits of the current year to the front of
  /// the year
  ///
  /// Args:
  ///   year (int): The year to be converted.
  ///
  /// Returns:
  ///   A DateTime object.
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  /// `hasDateExpired` is a function that takes two parameters, `month` and `year`, and returns a
  /// boolean value
  ///
  /// Args:
  ///   month (int): The month of the date you want to check.
  ///   year (int): The year of the date to check.
  ///
  /// Returns:
  ///   a boolean value.
  static bool hasDateExpired(int month, int year) {
    return isNotExpired(year, month);
  }

  /// It has not expired if both the year and date has not passed
  ///
  /// Args:
  ///   year (int): The year the card expires
  ///   month (int): The month of the year (1-12)
  ///
  /// Returns:
  ///   a boolean value.
  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  /// It takes a string of the form "MM/YY" and returns a list of integers of the form [MM, YY]
  ///
  /// Args:
  ///   value (String): The value of the input field.
  ///
  /// Returns:
  ///   A list of integers.
  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  /// The month has passed if the year is in the past or the year is the current year and the month is
  /// less than the current month plus one
  ///
  /// Args:
  ///   year (int): The year of the card's expiration date.
  ///   month (int): The month of the card's expiration date.
  ///
  /// Returns:
  ///   A boolean value.
  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  /// The year has passed if the year we are currently is more than card's year
  ///
  /// Args:
  ///   year (int): The year of the card.
  ///
  /// Returns:
  ///   The year has passed if the year we are currently is more than card's year
  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  /// It takes a string and returns a string with all non-numeric characters removed
  ///
  /// Args:
  ///   text (String): The text to be cleaned.
  ///
  /// Returns:
  ///   A string with all non-numeric characters removed.
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  /// If the input is null or empty, return 'This field is required'. Otherwise, if the input is less
  /// than 8 characters, return 'Card is invalid'. Otherwise, if the sum of the digits is divisible by
  /// 10, return null. Otherwise, return 'Card is invalid'
  ///
  /// Args:
  ///   input (String): The input string to validate.
  ///
  /// Returns:
  ///   A function that takes a string and returns a string.
  static String? validateCardNum(String? input) {
    if (input == null || input.isEmpty) {
      return 'This field is required';
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return 'Card is invalid';
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return 'Card is invalid';
  }

  /// If the value is null or empty, return 'This field is required'. If the value is less than 3 or
  /// greater than 4, return 'CVV is invalid'. Otherwise, return null
  ///
  /// Args:
  ///   value (String): The value of the field.
  ///
  /// Returns:
  ///   A string.
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  /// It validates the date entered by the user
  ///
  /// Args:
  ///   value (String): The value of the field.
  ///
  /// Returns:
  ///   a String?.
  static String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(RegExp(r'(/)'))) {
      var split = value.split(RegExp(r'(/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// It takes a string as input and returns a CardType enum value
  ///
  /// Args:
  ///   input (String): The card number entered by the user.
  ///
  /// Returns:
  ///   A CardType object.
  static AccountType getCardTypeFromNumber(String input) {
    AccountType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = AccountType.mastercard;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = AccountType.visa;
    } else {
      cardType = AccountType.none;
    }
    return cardType;
  }

  /// If the image is not empty, return an Image widget with the image, otherwise return null.
  ///
  /// Args:
  ///   cardType (CardType): The type of card.
  static Widget? getCardIcon(AccountType? cardType) {
    String image = '';
    Widget? widget;
    switch (cardType) {
      case AccountType.mastercard:
        image = 'assets/images/mastercard.png';
        break;
      case AccountType.debit:
        image = 'assets/images/visa_logo.png';
        break;
      case AccountType.visa:
        image = 'assets/images/visa_logo.png';
        break;
      default:
    }

    if (image.isNotEmpty) {
      widget = Image.asset(
        image,
        width: 40.0,
        package: GlobalAppUtil.productListingPackageName,
      );
    }

    return widget;
  }
}
