// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StringExtension;

void main() {
  group('Phone number operation', () {
    String phone = '0712345678';
    String expected = '254712345678';
    test('Phone number starting with -> 07..', () {
      String actual = phone.toLukhuNumber();
      expect(actual, expected);
    });

    test('Phone number starting with -> 7..', () {
      phone = '712345678';
      String actual = phone.toLukhuNumber();
      expect(actual, expected);
    });

    test('Phone number starting with -> 254..', () {
       phone = '254712345678';
      String actual = phone.toLukhuNumber();
      expect(actual, expected);
    });

    test('Phone number starting with -> +254..', () {
       phone = '+254712345678';
      String actual = phone.toLukhuNumber();
      expect(actual, expected);
    });
  });
}
