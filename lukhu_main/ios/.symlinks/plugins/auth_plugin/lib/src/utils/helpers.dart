import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

class Helpers{
  static  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

/// The function compares two maps and returns true if they have the same keys and values.
/// 
/// Args:
///   map1 (Map): The first parameter is a Map object named "map1". It is likely that this function is
/// designed to compare two Map objects and check if they have the same key-value pairs.
///   map2 (Map): The parameter `map2` is a variable of type `Map`. It is one of the two maps being
/// compared in the `compareMaps` function.
/// 
/// Returns:
///   a boolean value. It returns `true` if the two maps passed as arguments have the same length and
/// contain the same key-value pairs, and `false` otherwise.
  static bool compareMaps(Map map1, Map map2) {
    if (map1.length != map2.length) {
      return false;
    }

    for (var key in map1.keys) {
      if (!map2.containsKey(key) || map1[key] != map2[key]) {
        return false;
      }
    }

    return true;
  }
}