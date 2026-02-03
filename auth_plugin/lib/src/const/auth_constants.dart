import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show IntExtension;
import 'package:flutter/material.dart';

class AuthConstants {
  ///Colors
  static Color backgoundBlue = const Color(0xffE6ECFF);
  static Color optionCardBackgroundBlue = const Color(0xffF5F4F8);
  static Color textDarkColor = const Color(0xff1D1929);
  static Color buttonBlue = const Color(0xff003CFF);
  static Color buttonBlueDissabled = const Color(0xffB3C5FF);
  static Color boarderColor = const Color(0xffE8E8EA);
  static Color dividerGrayColor = const Color(0xff8E8C94);
  static Color linkBlue = const Color(0xffF38707);
  static Color suffixGray = const Color(0xffBBBABF);
  static Color boarderErrorRed = const Color(0xffFACCCC);
  static Color textErrorRed = const Color(0xffEB3333);
  static Color textFieldBoarderGray = const Color(0xffD2D1D4);
  static Color activeRed = const Color(0xffF42829);
  static Color gray90 = const Color(0xff34303E);
  static Color goodGreen = const Color(0xff2F9803);
  static Color innerBorderGray = const Color(0xffE1E1E1);
  static Color unselectedTextColor = const Color(0xff737373);
  static Color subtitleFadeGray = const Color(0xff77757F);
  static Color progressBlues = const Color(0xff4D77FF);
  static Color progressBackground = const Color(0xffF1F5FF);
  static Color lukhuPink = const Color(0xffDC0E51);
  static Color tinyGray = const Color(0xff615E69);

  ///Strings
  static String pluginName = 'auth_plugin';

  ///web links
  static String termsOfService =
      'https://lukhu.helpscoutdocs.com/article/22-terms-and-conditions';

  static String termsOfServiceDuka =
      'https://lukhu.tawk.help/article/dukastax-terms-and-conditions';

  static String privacyPolicyDuka =
      'https://lukhu.tawk.help/article/dukastax-privacy-policy';
  static String wallets = '';

  /// DB
  ///
  ///
  static String usersCollection = 'users';
  static String shopCollection = 'shops';

  ///Data
  static List<String> sizesLocales = [
    'UK Sizes',
    'EU Sizes',
    'US Sizes',
    'Inches'
  ];

  static String dukastaxImage = "assets/images/dukastax_bg.png";
  static String dukaIcon = "assets/icons/duka_icon.png";
  static String duka = "assets/icons/dukastax.png";
  static String locationIcon = "assets/icons/location.png";

  static Map<String, Map<String, List<String>>> get localeSizes => {
        'Tops': {
          sizesLocales[0]:
              2.upTo(30, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[1]:
              30.upTo(58, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[2]:
              0.upTo(26, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[3]:
              2.upTo(75, stepSize: 2).map((e) => e.toString()).toList(),
        },
        'Bottoms': {
          sizesLocales[0]:
              4.upTo(26, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[1]:
              32.upTo(54, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[2]:
              0.upTo(22, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[3]:
              2.upTo(75, stepSize: 2).map((e) => e.toString()).toList(),
        },
        'Shoes': {
          sizesLocales[0]:
              2.upTo(9, stepSize: 1).map((e) => e.toString()).toList(),
          sizesLocales[1]:
              35.upTo(42, stepSize: 1).map((e) => e.toString()).toList(),
          sizesLocales[2]:
              4.upTo(11, stepSize: 1).map((e) => e.toString()).toList(),
          // sizesLocales[3]:
          //     2.upTo(75, stepSize: 2).map((e) => e.toString()).toList(),
        },
        'Dresses': {
          sizesLocales[0]:
              2.upTo(30, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[1]:
              30.upTo(58, stepSize: 2).map((e) => e.toString()).toList(),
          sizesLocales[2]:
              0.upTo(26, stepSize: 2).map((e) => e.toString()).toList(),
          // sizesLocales[3]:
          //     2.upTo(75, stepSize: 2).map((e) => e.toString()).toList(),
        },
      };

  //External requests
  static String prodBaseUrl = 'https://api.lukhu.co.ke/api/v1/';
  static String stagingBaseUrl = 'https://production.kaps.co.ke:3056/api/v1/';
  static bool prod = false;
}
