import 'package:auth_plugin/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FirebaseFirestore, StringExtension, UserModel;

import '../../utils/app_util.dart';

class EditAccountController extends ChangeNotifier {
  bool _showOriginalPassword = true;
  bool get showOriginalPassword => _showOriginalPassword;
  set showOriginalPassword(bool value) {
    _showOriginalPassword = value;
    notifyListeners();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  bool _showNewPassword = true;
  bool get showNewPassword => _showNewPassword;
  set showNewPassword(bool value) {
    _showNewPassword = value;
    notifyListeners();
  }

  bool _showRepeatPassword = true;
  bool get showRepeatPassword => _showRepeatPassword;
  set showRepeatPassword(bool value) {
    _showRepeatPassword = value;
    notifyListeners();
  }

  GlobalKey<FormState> updatePasswordFormKey = GlobalKey();

  void updateOriginalPassword() => showOriginalPassword = !showOriginalPassword;

  void updateRepeatPassword() => showRepeatPassword = !showRepeatPassword;

  void updateNewPassword() => showNewPassword = !showNewPassword;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController originalPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  List<Map<String, dynamic>> get socialMedia => AppUtil.socialMedia;

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  void init(UserModel u) {
    user = u;
    firstNameController = TextEditingController(text: u.firstName);
    lastNameController = TextEditingController(text: u.lastName);
    userNameController = TextEditingController(text: u.userName);
    phoneNumberController =
        TextEditingController(text: u.phoneNumber?.toPhone());
    bioController = TextEditingController(text: u.bioDescription);
    sizes = u.sizes?.join(',') ?? '';
    bioController = TextEditingController();
    categories = u.selectedCategories ?? [];
    originalPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    repeatPasswordController = TextEditingController();
  }

  List<String?> _categories = [];
  List<String?> get categories => _categories;

  UserModel? editedModel() {
    if (user == null) return null;
    return user!.copyWith(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      //userName: userNameController.text,
      phoneNumber: phoneNumberController.text,
      //bioDescription: bioController.text,
      //sizes: sizes.isEmpty ? null : sizes.split(','),
      //selectedCategories: categories.isEmpty ? null : categories,
    );
  }

  bool hasChanges() => editedModel() == null
      ? false
      : !Helpers.compareMaps(user!.toJson(), editedModel()!.toJson());
  set categories(List<String?> value) {
    _categories = value;
    notifyListeners();
  }

  String get getUserCatogories =>
      categories.isEmpty ? "Tap to add" : categories.join(',');

  String _sizes = '';
  String get sizes => _sizes;
  set sizes(String value) {
    _sizes = value;
    notifyListeners();
  }

  void addSizes(Map<String, dynamic> value) {
    for (var v in value.entries) {
      Map<String, dynamic> myMap = v.value;
      Set<String> mySet = {};
      for (var element in myMap.entries) {
        Map<String, dynamic> list = element.value;
        mySet.add('${element.key}: ${list.values.toList().join('')}');
      }

      sizes = mySet.toList().join(',');
    }
  }

  bool _userIsReady = false;
  bool get userIsReady => _userIsReady;
  set userIsReady(bool value) {
    _userIsReady = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> updateProfileData() async {
    user = user!.copyWith(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phoneNumber: phoneNumberController.text.trim().toLukhuNumber(),
    );

    return hasChanges();
  }

  bool get allowEditing =>
      firstNameController.text.isNotEmpty &&
      lastNameController.text.isNotEmpty &&
      phoneNumberController.text.isNotEmpty;
}
