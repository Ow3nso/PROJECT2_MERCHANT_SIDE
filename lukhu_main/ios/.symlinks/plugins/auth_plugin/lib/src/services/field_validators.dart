import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show  StringExtension;

class FieldsValidator {
  /// If the provided string is empty, return an error message. If the provided string is not a valid
  /// email address, return an error message. Otherwise, return null
  ///
  /// Args:
  ///   s (String): The string to be validated
  ///
  /// Returns:
  ///   A function that takes a string and returns a string.
  static String? emailValidator(String? s) {
    if (s!.isEmpty) return 'Email Address is reuired';
    if (!s.isValidEmail()) return 'Provided email address is invalid';
    return null;
  }

  /// If the password is empty, less than 8 characters, or not a valid password, return an error
  /// message. Otherwise, return null
  ///
  /// Args:
  ///   s (String): The value of the text field.
  ///
  /// Returns:
  ///   A string that is either null or a string that contains an error message.
  static String? passwordVlidator(String? s) {
    if (s!.isEmpty) return 'Password is required';
    if (s.length < 8) return 'Password must be at least 8 characters in length';

    if (!s.isValidPassword()) {
      return '''A weak password has been provided.
        Password:
        - should contain at least one upper case.
        - should contain at least one lower case.
        - should contain at least one digit.
        - should contain at least one Special character.
        - Must be at least 8 characters in length.
        ''';
    }

    return null;
  }

  static String? loginpasswordVlidator(String? s) {
    if (s!.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  static String? phoneValidator(String? s) {
    if (s!.isEmpty) return 'Please provide your phone number';
    if (!s.isValidPhoneNumber()) return 'Please key in a valid phone number\n';
    return null;
  }

  static String? emailOrPhoneValidator(String? s) {
    if (s!.isNumeric()) {
      return phoneValidator(s);
    }
    return emailValidator(s);
  }

  static RegExp specialCharRegExp =
      RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
          "'"
          ']');
  static RegExp caseRegEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");

  static List<Map<String, dynamic>> passwordRules(String password) => [
        {
          'label': '8 characters long',
          'has': password.length >= 8,
        },
        {
          'label': "At least 1 special character (e.g !@#\$)",
          'has': password.contains(specialCharRegExp),
        },
        {
          'label': 'At least one uppercase/lowercase character',
          'has': password.contains(caseRegEx),
        },
        {
          'label': 'At least one digit',
          'has': password.contains(RegExp(r'[0-9]')),
        },
      ];
}
