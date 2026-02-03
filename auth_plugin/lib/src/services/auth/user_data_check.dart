import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show StringExtension;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FirebaseFirestore, UserFields, UserModel;

class UserDataCheck {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  static Future<bool> isValueTaken(String value, String valueKey) async {
    final query = await _firestore
        .collection(AuthConstants.usersCollection)
        .where(valueKey, isEqualTo: value.trim())
        .get();
    return query.size > 0;
  }

  static Future<String?> getEmailByPhone(String phone) async {
    final query = await _firestore
        .collection(AuthConstants.usersCollection)
        .where(UserFields.phoneNumber, isEqualTo: phone.toLukhuNumber())
        .get();
    if (query.size > 0) {
      final data = query.docs.first;
      final user = UserModel.fromJson(data.data());
      return user.email;
    }
    return null;
  }

  static Future<String?> getPhoneByEmail(String email) async {
  final query = await _firestore
      .collection(AuthConstants.usersCollection)
      .where(UserFields.email, isEqualTo: email)
      .get();
  
  if (query.size > 0) {
    final data = query.docs.first;
    final user = UserModel.fromJson(data.data());
    return user.phoneNumber; 
  }
  
  return null;
}
}
