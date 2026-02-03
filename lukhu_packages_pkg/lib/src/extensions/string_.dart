extension StringExtension on String {
  /// It checks if the string matches the regular expression for an email address
  ///
  /// Returns:
  ///   A boolean value.
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  /// It checks if the password is valid or not.
  ///
  /// Returns:
  ///   A boolean value.
  bool isValidPassword() {
    /*
    r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length  
$
    */
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }

  /// It checks if the string is a valid phone number.
  bool isValidPhoneNumber() =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(this);

  /// If the string is shorter than n, return the whole string, otherwise return the last n characters
  /// of the string.
  ///
  /// Args:
  ///   n (int): the number of characters to return
  String lastChars(int n) => substring(length - n);

  bool isNumeric() => RegExp(r'^-?[0-9]+$').hasMatch(this);

  String toLukhuNumber() {
    String number = this;
    if (number.length == 10) return '254${number.lastChars(9)}';

    if (number.length == 9 && number[0] == '7') return '254$number';

    if (number.startsWith('254') && number.length == 12) return number;
    if (number.length > 12) return number.lastChars(12);

    return number;
  }

  String toRouterPath() {
    if (split('/').isNotEmpty) return this;
    return '/$this';
  }

  String toLukhuWebLink() {
    var link = toLowerCase().trim();
    if (link.startsWith('.')) {
      link = link.substring(1);
    } else if (link.endsWith('.')) {
      link = link.substring(0, length - 1);
    } else if (link.endsWith('.') && link.startsWith('.')) {
      link = link.substring(0, length - 1);
      link = link.substring(1);
    }
    return '$link.lukhu.shop';
  }

  String toPhone() {
    var phone = this;
    if (phone.startsWith('254')) {
      phone = phone.substring(3);
    }
    return '0$phone';
  }
}
