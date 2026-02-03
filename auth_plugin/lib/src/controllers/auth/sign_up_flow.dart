import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
import 'package:auth_plugin/src/services/auth/user_data_migration.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppDBConstants,
        AppType,
        DateFormat,
        FirebaseAuth,
        FirebaseFirestore,
        FirebaseMessaging,
        FirebaseStorage,
        ImageUploadType,
        NavigationController,
        NavigationService,
        ReadContext,
        Shop,
        // ShopFields,
        StringExtension,
        UploadTask,
        User,
        UserModel,
        Uuid,
        Wallet;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../const/auth_constants.dart';
import '../../services/api/external_request_service.dart';
import '../../utils/app_util.dart';

class SignUpFlowController with ChangeNotifier {
  int _currentOption = 0;
  String? _accountTypeSelectedOption;
  Timer? _timer;
  UserModel? _user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobFieldController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _buildingHouseController =
      TextEditingController();
  final Map<String, Map<String, Map<String, List<String>>>> _sizesData = {};
  final List<String> _followingHandles = [];
  List<dynamic> _trendingSellers = [];
  File? _fileProfileImage;
  String? _profilePhotoUrl;
  bool _loading = false;
  Map<String, dynamic>? _oldUserData;
  double _progress = 0;
  String _sellerExperience = '';
  int _timeRemainderToEnableOTP = 60;
  bool _resendOtp = false;
  final List<String> _selectedCategories = [];
  String? _sentOtp;
  BuildContext? _context;
  DateTime? _dob = DateTime.now();
  int get currentOption => _currentOption;

  String? get accountTypeSelectedOption => _accountTypeSelectedOption;
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get dobFieldController => _dobFieldController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get otpController => _otpController;
  TextEditingController get storeNameController => _storeNameController;
  TextEditingController get locationController => _locationController;
  TextEditingController get buildingHouseController => _buildingHouseController;
  String get sellerExperience => _sellerExperience;
  bool get resendOtp => _resendOtp;
  DateTime? get dob => _dob;
  int get timeRemainderToEnableOTP => _timeRemainderToEnableOTP;
  double get progress => _progress;
  BuildContext? get context => _context;
  List<String> get selectedCategories => _selectedCategories;
  Map<String, Map<String, Map<String, List<String>>>> get sizesData =>
      _sizesData;
  List<String> get followingHandles => _followingHandles;
  UserModel? get user => _user;
  String get name => _nameController.text;
  String get lastPhoneDigits => phoneController.text.lastChars(3);
  File? get fileProfileImage => _fileProfileImage;
  Map<String, dynamic>? get oldUserData => _oldUserData;
  String? get profilePhotoUrl => _profilePhotoUrl;
  bool get loading => _loading;
  String? get sentOtp => _sentOtp;
  bool get userIsASeller =>
      ['I want to Sell', 'Maybe both'].contains(accountTypeSelectedOption);

  List<dynamic> get trendingSellers => _trendingSellers;
  set currentOption(int value) {
    _currentOption = value;
    notifyListeners();
  }

  String? _gender;
  String? get gender => _gender;
  set gender(String? value) {
    _gender = value;
    notifyListeners();
  }

  set resendOtp(bool value) {
    _resendOtp = value;
    notifyListeners();
  }

  set accountTypeSelectedOption(String? value) {
    _accountTypeSelectedOption = value;
    notifyListeners();
  }

  set dob(DateTime? value) {
    _dob = value;
    if (dob != null) {
      dobFieldController.text = DateFormat.yMMMMEEEEd().format(dob!);
    }
    notifyListeners();
  }

  set progress(double value) {
    _progress = value;
    notifyListeners();
  }

  set context(BuildContext? value) {
    _context = value;
    notifyListeners();
  }

  set timeRemainderToEnableOTP(int value) {
    _timeRemainderToEnableOTP = value;
    notifyListeners();
  }

  set sellerExperience(String value) {
    _sellerExperience = value;
    notifyListeners();
  }

  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

  set oldUserData(Map<String, dynamic>? value) {
    _oldUserData = value;
    notifyListeners();
  }

  set fileProfileImage(File? value) {
    _fileProfileImage = value;
    notifyListeners();
  }

  set profilePhotoUrl(String? value) {
    _profilePhotoUrl = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set sentOtp(String? value) {
    _sentOtp = value;
    notifyListeners();
  }

  set trendingSellers(List<dynamic> value) {
    _trendingSellers = value;
    notifyListeners();
  }

  void updateCategories(String category) {
    if (selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
      notifyListeners();
      return;
    }
    _selectedCategories.add(category);
    notifyListeners();
    return;
  }

  AppType _appType = AppType.marketplace;
  AppType get appType => _appType;
  set appType(AppType value) {
    _appType = value;
    notifyListeners();
  }

  void setExeperience(Map<String, dynamic> value) {
    if (value["type"] != null) {
      accountTypeSelectedOption = "I want to Sell";
      appType = value["type"] as AppType;
      sellerExperience = value["selected"];
    }
  }

  bool get isMarketplace => _appType == AppType.marketplace;

  void updateSelectedSizes(
      {required String category,
      required String categoryTitle,
      required String sizeLoCale,
      required String size}) {
    if (sizesData[category] == null) {
      _sizesData[category] = {
        categoryTitle: {sizeLoCale: []}
      };
    }

    if (sizesData[category]![categoryTitle] == null) {
      _sizesData[category]![categoryTitle] = {sizeLoCale: []};
    }

    if (sizesData[category]![categoryTitle]![sizeLoCale] == null) {
      _sizesData[category]![categoryTitle]![sizeLoCale] = [];
    }
    if (sizesData[category]?[categoryTitle]?[sizeLoCale]?.contains(size) ??
        false) {
      sizesData[category]?[categoryTitle]?[sizeLoCale]?.remove(size);
      notifyListeners();
      return;
    }

    sizesData[category]?[categoryTitle]?[sizeLoCale]?.add(size);
    notifyListeners();

    return;
  }

  bool isSizeSelected(
      {required String category,
      required String categoryTitle,
      required String sizeLoCale,
      required String size}) {
    return sizesData[category]?[categoryTitle]?[sizeLoCale]?.contains(size) ??
        false;
  }

  void updateFollowinghadle(String handle) {
    if (followingHandles.contains(handle)) {
      _followingHandles.remove(handle);
    } else {
      _followingHandles.add(handle);
    }
    notifyListeners();
  }

  Future<void> mockProgress() async {
    while (progress < 50) {
      await Future.delayed(const Duration(seconds: 1));
      progress += 10;
    }
    await _saveUser();
    progress += 30;
    FirebaseMessaging.instance.getToken().then((value) => token = value);
    if (userIsASeller) {
      await saveUserShop();
    }
    //await followSelectedSellers();
    progress += 10;
    await Future.delayed(const Duration(seconds: 2));
    progress += 10;
    if (context == null) return;
    _navigateAfterAuth(context!);
  }

  void _navigateAfterAuth(BuildContext context) {
    if (context.read<NavigationController>().pendingRoute != null) {
      NavigationService.navigate(
          context, context.read<NavigationController>().pendingRoute!,
          arguments: context.read<NavigationController>().pendingArguments,
          forever: true);
      context.read<NavigationController>().pendingRoute = null;
      context.read<NavigationController>().pendingArguments = null;
      return;
    }
    NavigationService.navigate(
      context,
      /*userIsASeller ? 'sell_page' :*/ '/',
      forever: true,
    );
  }

  // void startOTPresendTimer() {
  //   timeRemainderToEnableOTP = 60;
  //   _timer?.cancel();
  //   _timer = Timer.periodic(
  //       const Duration(seconds: 1),
  //       (t) => {
  //             if (timeRemainderToEnableOTP == 0)
  //               {
  //                 resendOtp = true,
  //                 t.cancel(),
  //               }
  //             else
  //               {timeRemainderToEnableOTP--}
  //           });
  // }

  User? get fbUser => FirebaseAuth.instance.currentUser;

  void initUser(UserModel? u) {
    if (u == null) return;
    user = UserModel(userId: fbUser?.uid);
    _emailController.text = u.email ?? '';
    _nameController.text = u.firstName ?? '';
    profilePhotoUrl = user?.imageUrl;
    user?.imageUrl = u.imageUrl;
    user?.userId = u.userId;
    user?.lastLoggedIn = u.lastLoggedIn;
    user?.buildNumber = u.buildNumber;
    user?.storageDir = u.storageDir;
    user?.accountType = u.accountType;
    notifyListeners();
  }

  Future<void> _saveUser() async {
    user ??= UserModel(userId: fbUser?.uid);
    user = user!.copyWith(
      phoneNumber: _phoneController.text.trim().toLukhuNumber(),
      dob: dob?.millisecondsSinceEpoch.toString(),
      userSellingExperience: sellerExperience,
      userName: usernameController.text.trim().toLowerCase(),
      email: emailController.text.trim(),
      firstName: nameController.text.trim(),
      selectedCategories: selectedCategories,
      storageDir: const Uuid().v4(),
      accountType: userIsASeller ? 'seller' : 'buyer',
      sizesData: sizesData,
      imageUrl: profilePhotoUrl,
    );
    await firestore
        .collection(AuthConstants.usersCollection)
        .doc(user?.userId)
        .set(user!.toJson());
    if (!newUser) {
      bool savedUser = await UserDataMigrationService.updateUserId({
        'oldId': oldUserData?['id'] ?? '',
        'newId': user?.userId ?? '',
      });
      if (savedUser) {
        if (kDebugMode) {
          log('Old user ID updated');
        }
      }
    }
  }

  String? _token;
  String? get token => _token;
  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  Future<void> saveUserShop() async {
    Shop shop = Shop.empty();
    shop = shop.copyWith(
      webDomain: usernameController.text.isNotEmpty
          ? "${usernameController.text.trim()}.lukhu.shop"
          : "",
      address: locationController.text.trim(),
      name: storeNameController.text.trim(),
      shopId: const Uuid().v4(),
      userId: fbUser?.uid,
      imageUrl: profilePhotoUrl,
    );

    await firestore
        .collection(AuthConstants.shopCollection)
        .doc(shop.shopId)
        .set(shop.toJson());

    createUserWallet(shop.shopId);

    // ExternalRequestService.makeRequest(
    //   url: '${GlobalAppUtil.paymentUrl}${GlobalAppUtil.walletApi}',
    //   headers: {'Authorization': 'Bearer $token'},
    //   body: {
    //     ShopFields.userId: shop.userId,
    //     ShopFields.businessName: shop.name,
    //   },
    // );
  }

  Future<void> createUserWallet([String? shopId]) async {
    Wallet wallet = Wallet.empty();
    if (shopId == null) return;
    wallet = Wallet.empty();
    wallet = wallet.copyWith(
      userId: fbUser?.uid,
      shopId: shopId,
      id: const Uuid().v4(),
      balance: 0,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      availableBalance: 0,
      pendingBalance: 0,
      name: storeNameController.text.trim(),
    );

    await firestore
        .collection(AppDBConstants.walletCollection)
        .doc(wallet.id)
        .set(wallet.toJson());
  }

  Future<void> initUserOldData() async {
    if (kDebugMode) {
      log("Imported data -> $oldUserData");
    }
    if (newUser) return;
    _usernameController.text = oldUserData?['username'] ?? '';
    _phoneController.text = oldUserData?['phone'] ?? '';
    _emailController.text = oldUserData?['email'] ?? '';
    _nameController.text =
        oldUserData?['firstName'] ?? oldUserData?['username'] ?? '';

    notifyListeners();
  }

  bool get newUser => oldUserData == null;

  Future<bool> uploadProfileImage({
    ImageUploadType type = ImageUploadType.profile,
  }) async {
    if (fileProfileImage == null) return false;
    loading = true;
    try {
      final storageRef = FirebaseStorage.instance.ref();
      UploadTask task = storageRef
          .child('${AppUtil.pathToUpload(type)[0]}/${fbUser?.uid}')
          .putFile(fileProfileImage!);
      var t = await task;
      await task.whenComplete(() {
        if (kDebugMode) {
          log('Image uploaded successfully');
        }
      });

      profilePhotoUrl = await t.ref.getDownloadURL();
      if (kDebugMode) {
        log('[IMAGE] $profilePhotoUrl');
      }
      loading = false;
      return true;
    } catch (e) {
      loading = false;
      if (kDebugMode) {
        log('Upload error -> $e');
      }
      return false;
    }
  }

  Future<void> sendOTP([bool resend = false]) async {
    if ((phoneController.text.isEmpty || sentOtp != null) && !resend) return;
    resendOtp = false;
    loading = true;
    String url = '${_baseUrl()}notifications/otp';
    final responseData = await ExternalRequestService.makeRequest(
            url: url,
            body: {'phoneNumber': phoneController.text.trim().toLukhuNumber()},
            request: 'post')
        .catchError((e) => null);
    // startOTPresendTimer();
    loading = false;
    if (responseData == null) {
      if (kDebugMode) {
        log('REQUEST RESPONSE IS NULL');
      }
      return;
    }

    if (responseData['status'] == 'success') {
      String token = responseData['data']['token'];
      sentOtp = utf8.decode(base64.decode(token));
      if (kDebugMode) {
        log('SENT OTP -> $sentOtp ');
      }
    }
  }

  String _baseUrl() => AuthConstants.prod
      ? AuthConstants.prodBaseUrl
      : AuthConstants.stagingBaseUrl;

  Future<void> getTrendingSellers() async {
    String url = '${_baseUrl()}store/popular?page=1&page_size=10';
    loading = true;
    final responseData =
        await ExternalRequestService.makeRequest(url: url, request: 'get')
            .catchError((e) => null);
    loading = false;
    if (responseData == null) return;
    if (responseData['status'] == 'success') {
      trendingSellers = responseData['data'];
    }
  }

  Future<void> followSelectedSellers() async {
    if (followingHandles.isEmpty || fbUser == null) return;
    String url = '${_baseUrl()}store/follow';
    String? token = await fbUser?.getIdToken();
    await ExternalRequestService.makeRequest(
        headers: {'Authorization': 'Bearer $token'},
        url: url,
        request: 'get',
        body: {'stores': followingHandles.toString()}).catchError((e) => null);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
