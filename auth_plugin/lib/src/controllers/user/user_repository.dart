// ignore_for_file: unnecessary_getters_setters, unused_element

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AndroidDeviceInfo,
        AppDBConstants,
        Device,
        DeviceDetails,
        DeviceFields,
        DeviceInfoPlugin,
        DynamicLinkServices,
        FieldValue,
        FirebaseAuth,
        FirebaseCrashlytics,
        FirebaseFirestore,
        FirebaseMessaging,
        // GlobalAppUtil,
        Helpers,
        ImageUploadType,
        IosDeviceInfo,
        NavigationService,
        PackageInfo,
        ReadContext,
        Shop,
        ShopFields,
        SignUpFlowController,
        SocialMedia,
        StringExtension,
        User,
        UserFields,
        UserModel,
        Uuid,
        Wallet,
        WalletModel;

import '../../services/auth/user_auth_services.dart';
import '../../services/notification/push_notification_service.dart';
import '../auth/edit_account_controller.dart';

enum Status {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
  loading
}

class UserRepository with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _newUser = false;
  final UserAuthServices _userAuthServices;
  Status _status = Status.uninitialized;
  String? _error;
  StreamSubscription<UserModel?>? _userListener;
  UserModel? _fsUser;
  Device? currentDevice;
  PushNotificationService? pnService;
  bool? _loading;
  String? _signupDisplayName;
  PackageInfo? _packageInfo;

  PackageInfo? get packageInfo => _packageInfo;
  set packageInfo(PackageInfo? value) {
    _packageInfo = value;
    notifyListeners();
  }

  bool _hasSocialData = false;
  final DynamicLinkServices _dynamicLinkServices = DynamicLinkServices();

  /// This ia the instance of the dynamic link services
  DynamicLinkServices get dynamicLinkServices => _dynamicLinkServices;

  UserRepository.instance(this.pnService)
      : _userAuthServices = UserAuthServices.instance() {
    _error = '';
    _loading = true;
    _userAuthServices.auth?.authStateChanges().listen(_onAuthStateChanged);
    PackageInfo.fromPlatform().then((value) {
      packageInfo = value;
    });
    FirebaseMessaging.instance.getToken().then((value) => token = value);

    /// Initialize the dynamic link services
    dynamicLinkServices.init();
  }

  String? get error => _error;
  Status get status => _status;
  //Firebase auth manages the current user, so we just call it directly with the latest user session[user]
  User? get fbUser => FirebaseAuth.instance.currentUser;
  UserModel? get user => _fsUser;

  bool? get isLoading => _loading;
  Future<void> Function(User?)? get onAuthStateChanged => _onAuthStateChanged;
  StreamSubscription<UserModel?>? get userListener => _userListener;
  UserAuthServices get userAuthServices => _userAuthServices;
  bool get newUser => _newUser;
  bool get hasSocialData => _hasSocialData;
  Shop? _shop;
  Shop? get shop => _shop;
  set shop(Shop? value) {
    _shop = value;
    notifyListeners();
  }

  /// checks if user is authenticated
  bool get userAuthenticated => fbUser != null;

  set hasSocialData(bool value) {
    _hasSocialData = value;
    notifyListeners();
  }

  set error(String? value) {
    _error = value;
    notifyListeners();
  }

  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  set signupDisplayName(String? value) {
    _signupDisplayName = value;
    notifyListeners();
  }

  set fsUser(UserModel? value) {
    _fsUser = value;
    notifyListeners();
  }

  set newUser(bool value) {
    _newUser = value;
    notifyListeners();
  }

  /// > Get the shop data from firestore and store it in the shop variable
  ///
  /// Returns:
  ///   A Future<void>
  Future<void> getUserShop() async {
    final shopData = await firestore
        .collection(AuthConstants.shopCollection)
        .where(UserFields.userId, isEqualTo: fbUser?.uid)
        .get();
    if (shopData.size > 0) {
      final data = shopData.docs.first;
      shop = Shop.fromJson(data.data());
    }
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.unauthenticated;
      _fsUser = null;
    } else {
      if (shop == null) {
        await getUserShop().catchError((e) {
          if (kDebugMode) {
            log('ERROR GETTING SHOP DATA->$e');
          }
        });

        await getUserWallet().catchError((e) {
          if (kDebugMode) {
            log('ERROR GETTING WALLET DATA->$e');
          }
        });
      }
      await _saveUserRecord().catchError((e) {
        if (kDebugMode) {
          log('ERROR SAVING USER DATA->$e');
        }
      });

      _status = Status.authenticated;
    }
    notifyListeners();
  }

  String? _token;
  String? get token => _token;
  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  WalletModel? _walletModel;
  WalletModel? get walletModel => _walletModel;
  set walletModel(WalletModel? value) {
    _walletModel = value;
    notifyListeners();
  }

  Future<void> getUserWallet() async {
    final walletDoc = await firestore
        .collection(AppDBConstants.walletCollection)
        .where(ShopFields.shopId, isEqualTo: shop?.shopId)
        .get();

    if (walletDoc.docs.isEmpty) {
      wallet = Wallet.empty();
      wallet = wallet!.copyWith(
        userId: fbUser?.uid,
        shopId: shop?.shopId,
        id: const Uuid().v4(),
        balance: 0,
        updatedAt: DateTime.now().millisecondsSinceEpoch,
        availableBalance: 0,
        pendingBalance: 0,
        name: shop?.name,
      );

      await firestore
          .collection(AppDBConstants.walletCollection)
          .doc(wallet!.id)
          .set(wallet!.toJson());

      // ExternalRequestService.makeRequest(
      //   url: '${GlobalAppUtil.paymentUrl}${GlobalAppUtil.walletApi}',
      //   headers: {'Authorization': 'Bearer $token'},
      //   request: 'post',
      //   body: {
      //     ShopFields.userId: shop?.userId,
      //     ShopFields.businessName: shop?.name,
      //   },
      // ).then((value) {
      //   if (value != null) {
      //     if (value['status'] == 'success') {
      //       walletModel =
      //           WalletModel.fromJson(value['data'] as Map<String, dynamic>);
      //     }
      //   }
      // });
    } else {
      final data = walletDoc.docs.first;
      wallet = Wallet.fromJson(data.data());
    }

    notifyListeners();
  }

  Future<bool> updateWallet() async {
    try {
      final walletRef = firestore.collection(AppDBConstants.walletCollection);
      await walletRef.doc(wallet!.id).update(wallet!.toJson());
      return true;
    } catch (e) {
      if (kDebugMode) {
        log('ERROR UPDATING WALLET->$e');
      }
      return false;
    }
  }

  String? _userName;
  String? get userName => _userName;
  set userName(String? value) {
    _userName = value;
    notifyListeners();
  }

  Future<UserModel> _createNewUser() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var names = (fbUser!.displayName?.trim() ?? _signupDisplayName?.trim())
            ?.split(' ') ??
        [];
    UserModel newUser = UserModel(
      email: fbUser!.email?.trim(),
      firstName: names.isEmpty ? '' : names.first.trim(),
      imageUrl: fbUser!.photoURL,
      userId: fbUser!.uid,
      lastLoggedIn: DateTime.now().toUtc(),
      buildNumber: packageInfo.buildNumber,
      storageDir: const Uuid().v1(),
      userName: userName?.trim(),
      lastName: names.length > 1 ? names.last.trim() : '',
      userPin: '0',
    );

    await firestore
        .collection(AuthConstants.usersCollection)
        .doc(fbUser?.uid)
        .set(newUser.toJson());
    return newUser;
  }

  Future<void> _saveUserRecord() async {
    if (fbUser == null) {
      _error = "Tried to save user record with null user";
      FirebaseCrashlytics.instance.log(_error!);
      return;
    }

    UserModel? userDoc;
    final userData = await firestore
        .collection(AuthConstants.usersCollection)
        .doc(fbUser?.uid)
        .get();
    bool userExists = userData.exists;
    newUser = userExists;
    if (userExists) {
      userDoc = UserModel.fromJson(userData.data() as Map<String, dynamic>);
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      await firestore
          .collection(AuthConstants.usersCollection)
          .doc(fbUser?.uid)
          .update({
        UserFields.lastLoggedIn: FieldValue.serverTimestamp(),
        UserFields.buildNumber: packageInfo.buildNumber,
        UserFields.storageDir: userDoc.storageDir ?? const Uuid().v1()
      });

      _fsUser = userDoc;

      notifyListeners();
    } else {
      userDoc = await _createNewUser();
    }
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    if (context != null) {
      // ignore: use_build_context_synchronously
      context.read<EditAccountController>().init(userDoc);
    } else {
      Helpers.debugLog("context is null");
    }

    await _saveDevice(userDoc);
  }

  Future<void> _createWallet() async {}

  Future<void> _saveDevice(UserModel user) async {
    DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
    String? deviceId;
    DeviceDetails? deviceDescription;
    if (Platform.isAndroid) {
      AndroidDeviceInfo deviceInfo = await devicePlugin.androidInfo;
      deviceId = deviceInfo.id;
      deviceDescription = DeviceDetails(
        device: deviceInfo.device,
        model: deviceInfo.model,
        osVersion: deviceInfo.version.sdkInt.toString(),
        platform: 'android',
      );
    }
    if (Platform.isIOS) {
      IosDeviceInfo deviceInfo = await devicePlugin.iosInfo;
      deviceId = deviceInfo.identifierForVendor;
      deviceDescription = DeviceDetails(
        osVersion: deviceInfo.systemVersion,
        device: deviceInfo.name,
        model: deviceInfo.utsname.machine,
        platform: 'ios',
      );
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String buildNumber = packageInfo.buildNumber;
    final nowMS = DateTime.now().toUtc().millisecondsSinceEpoch;
    if (user.buildNumber != buildNumber) {
      await firestore
          .collection(AuthConstants.usersCollection)
          .doc(user.userId!)
          .update({
        UserFields.buildNumber: buildNumber,
      });
    }
    final deviceData = await firestore
        .collection('${AuthConstants.usersCollection}/${user.userId}/devices')
        .doc(deviceId)
        .get();
    Device? existing;
    if (deviceData.exists) {
      existing = Device.fromJson(deviceData.data() as Map<String, dynamic>);
      var token = existing.token ?? await pnService?.init();
      await firestore
          .collection('${AuthConstants.usersCollection}/${user.userId}/devices')
          .doc(deviceId)
          .update({
        DeviceFields.lastUpdatedAt: nowMS,
        DeviceFields.expired: false,
        DeviceFields.uninstalled: false,
        DeviceFields.token: token,
      });
      currentDevice = existing;
    } else {
      var token = await pnService?.init();
      Device device = Device(
        createdAt: DateTime.now().toUtc(),
        deviceInfo: deviceDescription,
        token: token,
        expired: false,
        id: deviceId,
        lastUpdatedAt: nowMS,
        uninstalled: false,
      );
      await firestore
          .collection('${AuthConstants.usersCollection}/${user.userId}/devices')
          .doc(deviceId)
          .set(device.toJson());

      currentDevice = device;
    }
    notifyListeners();
  }

  Future<void> setPin([bool allowReset = false]) async {}

  Future<String?> authToken() async {
    if (fbUser == null) return null;
    return await fbUser!.getIdToken();
  }

  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    bool passwordChanged =
        await userAuthServices.changePassword(currentPassword, newPassword);
    error = userAuthServices.rd.error;
    return passwordChanged;
  }

  Future<bool> updateImageUri({
    ImageUploadType type = ImageUploadType.profile,
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    if (data.keys.isEmpty) return false;
    try {
      var id = type == ImageUploadType.profile ? fbUser!.uid : shop!.id;
      final useref = firestore.collection(collectionPath).doc(id);
      await useref.update(data);

      return true;
    } catch (e) {
      if (kDebugMode) {
        log('Error occured: $e');
      }
      return false;
    }
  }

  Future<bool> recoverPassword(String email) async {
    status = Status.authenticating;
    bool recoveryEmailSent = await userAuthServices.recoverPassword(email);
    error = userAuthServices.rd.error;
    status = Status.unauthenticated;
    return recoveryEmailSent;
  }

  Future<bool> updateProfile(ImageUploadType value, String image) async {
    if (value == ImageUploadType.profile) {
      fsUser = _fsUser!.copyWith(
        imageUrl: image,
      );
      fsUser = _fsUser;

      return updateUser(_fsUser!);
    }

    if (value == ImageUploadType.logo) {
      shop = _shop!.copyWith(imageUrl: image);
      return updateShop(_shop);
    } else if (value == ImageUploadType.header) {
      shop = _shop!.copyWith(coverImage: image);
      return updateShop(_shop);
    }

    return false;
  }

  Wallet? _wallet;
  Wallet? get wallet => _wallet;
  set wallet(Wallet? value) {
    _wallet = value;
    notifyListeners();
  }

  String get fullname => "${user?.firstName ?? ''} ${user?.lastName ?? ''}";

  Future<bool> resetPassword(String code, String newPassword) async {
    status = Status.authenticating;
    bool passwordUpdated =
        await userAuthServices.resetPassword(code, newPassword);
    error = userAuthServices.rd.error;
    status = Status.unauthenticated;
    return passwordUpdated;
  }

  Future<bool> signIn(String email, String password) async {
    status = Status.authenticating;
    bool siginIsASuccess = await userAuthServices.signIn(email, password);
    if (!siginIsASuccess) {
      _status = Status.unauthenticated;
    }
    error = userAuthServices.rd.error;
    return siginIsASuccess;
  }

  Future<bool> signup(String displayName, String email, String password) async {
    status = Status.authenticating;

    signupDisplayName = displayName;
    fbUser?.updateDisplayName(displayName);
    bool signupIsASuccess =
        await userAuthServices.signup(displayName, email, password);
    if (signupIsASuccess) {
      status = Status.authenticated;
    } else {
      status = Status.unauthenticated;
    }
    _error = userAuthServices.rd.error.replaceAll('firebase_auth/', '');
    if (kDebugMode) {
      log(_error ?? '');
    }
    return signupIsASuccess;
  }

  // Future<bool> signInWithGoogle() async {
  //   status = Status.authenticating;
  //   bool signedInWithGoogle = await userAuthServices.signInWithGoogle();
  //   error = userAuthServices.rd.error;
  //   if (!signedInWithGoogle) {
  //     status = Status.unauthenticated;
  //   } else {
  //     status = Status.authenticated;
  //   }
  //   return signedInWithGoogle;
  // }

//   Future<dynamic> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     if (googleUser == null) {
//       throw Exception('Google sign-in aborted by user');
//     }
//
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser.authentication;
//
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//
//     return userCredential.user;
//   } catch (e) {
//     // Handle specific errors if needed
//     print('Exception during sign in with Google: $e');
//     return null; // Return null or throw the error for the caller to handle
//   }
// }

  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        // Navigate to the main page after successful sign-in using MaterialPageRoute
        // _navigateToAfterLogin(context);
        return true;
      } else {
        print('Error');
      }
    } on FirebaseAuthException catch (e) {
      print('Error');
    }
    return false; // Return null if sign-in fails
  }

  Future<bool> signInWithFacebook() async {
    status = Status.authenticating;
    bool signedInWithFB = await userAuthServices.signInWithFacebook();
    if (!signedInWithFB) {
      _status = Status.unauthenticated;
    }
    error = userAuthServices.rd.error;
    return signedInWithFB;
  }

  Future<void> signOut() async {
    await userAuthServices.signOut();
    status = Status.unauthenticated;
    userListener?.cancel();
  }

  Future<bool> updateShop(Shop? value) async {
    try {
      if (value!.userId != fbUser?.uid) {
        Helpers.debugLog("user id does not match");
        return false;
      }
      await firestore
          .collection(AuthConstants.shopCollection)
          .doc(value.shopId)
          .update(value.toJson());
      return true;
    } catch (e) {
      Helpers.debugLog("error updating user: $e");
      return false;
    }
  }

  Future<bool> updateAndUpload(ImageUploadType value) async {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    if (context == null) return false;
    var status = await updateProfile(
      value,
      context.read<SignUpFlowController>().profilePhotoUrl!,
    );
    return status;
    // updateImageUri(collectionPath: AppUtil.pathToUpload(value)[1], data: {
    //   AppUtil.pathToUpload(value)[2]:
    //       context.read<SignUpFlowController>().profilePhotoUrl,
    // }).then((val) {
    //   if (val) {}
    // });
  }

  SocialMedia? _socialMedia;
  SocialMedia? get socialMedia => _socialMedia;
  set socialMedia(SocialMedia? value) {
    _socialMedia = value;
    notifyListeners();
  }

  Future<bool> updateSocial({int index = 0, required String link}) async {
    if (link.isEmpty) return false;
    socialMedia = SocialMedia.empty();
    if (shop!.socialMedia != null) {
      socialMedia = shop!.socialMedia;
    }

    switch (index) {
      case 0:
        socialMedia =
            socialMedia!.copyWith(instagram: 'https://instgram.com/$link');
        break;
      case 1:
        socialMedia =
            socialMedia!.copyWith(facebook: 'https://facebook.com/$link');
        break;
      case 2:
        socialMedia = socialMedia!
            .copyWith(whatsapp: 'https://wa.me/${link.toLukhuNumber()}');
        break;
      case 3:
        socialMedia =
            socialMedia!.copyWith(twitter: 'https://twitter.com/$link');
        break;
    }

    shop = shop!.copyWith(socialMedia: socialMedia);

    Helpers.debugLog('[SOCIAL-MEDIA]${shop!.toJson()}');
    _socialMedia = null;
    return true;
  }

  Future<bool> updateUser(UserModel user) async {
    try {
      if (user.userId != fbUser?.uid) {
        Helpers.debugLog("user id does not match");
        return false;
      }
      await firestore
          .collection(AuthConstants.usersCollection)
          .doc(fbUser?.uid)
          .update(user.toJson());
      return true;
    } catch (e) {
      Helpers.debugLog("error updating user: $e");
      return false;
    }
  }

  @override
  void dispose() {
    _userListener?.cancel();
    super.dispose();
  }
}
