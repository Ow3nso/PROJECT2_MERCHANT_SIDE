import 'package:auth_plugin/src/controllers/earn/earn_lukhu_controller.dart';
import 'package:auth_plugin/src/controllers/gift/gifts_controller.dart';
import 'package:auth_plugin/src/controllers/settings/address_controller.dart';
import 'package:auth_plugin/src/pages/account/account_page.dart';
import 'package:auth_plugin/src/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ChangeNotifierProvider, SingleChildWidget;

import '../controllers/auth/account_controller.dart';
import '../controllers/auth/edit_account_controller.dart';
import '../controllers/auth/password_reset.dart';
import '../controllers/auth/sign_up_flow.dart';
import '../controllers/auth/user_item_controller.dart';
import '../controllers/settings/user_notification_controller.dart';
import '../controllers/user/user_repository.dart';
import '../pages/account/account_security.dart';
import '../pages/account/edit_account.dart';
import '../pages/auth_genesis.dart';
import '../pages/buy_gift.dart';
import '../pages/delivery_address.dart';
import '../pages/earn.dart';
import '../pages/follow_recommendation.dart';
import '../pages/gift_cards.dart';
import '../pages/login.dart';
import '../pages/onboarding.dart';
import '../pages/password_reset.dart';
import '../pages/pay_gift.dart';
import '../pages/progress_screen.dart';
import '../pages/sign_up.dart';
import '../pages/sizes_selection.dart';
import '../pages/terms_and_condition.dart';
import '../pages/your_gifts.dart';
import '../services/notification/push_notification_service.dart';

class AuthRoutes {
  static Map<String, Widget Function(BuildContext)> availableRoutes() {
    return {
      AuthGenesisPage.routeName: (_) => const AuthGenesisPage(),
      FollowerRecommendetionPage.routeName: (_) =>
          const FollowerRecommendetionPage(),
      PasswordLoginPage.routeName: (_) => const PasswordLoginPage(),
      CategorySelectionView.routeName: (_) => const CategorySelectionView(),
      PasswordReset.routeName: (_) => const PasswordReset(),
      ProgressScreen.routeName: (_) => const ProgressScreen(),
      SignUpPage.routeName: (_) => const SignUpPage(),
      SizesSelectionPage.routeName: (_) => const SizesSelectionPage(),
      TermsConditionPage.routeName: (_) => const TermsConditionPage(),
    };
  }

  static Map<String, Widget Function(BuildContext)> guarded = {
    AccountPage.routeName: (p0) => const AccountPage(),
    AccountSettingsPage.routeName: (p0) => const AccountSettingsPage(),
    EditAccountPage.routeName: (_) => const EditAccountPage(),
    AccountSecurityPage.routeName: (_) => const AccountSecurityPage(),
    DeliveryAddressPage.routeName: (_) => const DeliveryAddressPage(),
    EarnPage.routeName: (_) => const EarnPage(),
    GiftCardPage.routeName: (_) => const GiftCardPage(),
    BuyGiftPage.routeName: (_) => const BuyGiftPage(),
    YourGiftPage.routeName: (_) => const YourGiftPage(),
    PayGiftPage.routeName: (_) => const PayGiftPage(),
  };

  static String initialRoute = AuthGenesisPage.routeName;

  static List<SingleChildWidget> authProviders() {
    PushNotificationService pnService = PushNotificationService();
    return [
      ChangeNotifierProvider(create: (_) => UserRepository.instance(pnService)),
      ChangeNotifierProvider(create: (_) => SignUpFlowController()),
      ChangeNotifierProvider(create: (_) => PasswordResetController()),
      ChangeNotifierProvider(create: (_) => AccountController()),
      ChangeNotifierProvider(create: (_) => EditAccountController()),
      ChangeNotifierProvider(create: (_) => UserItemController()),
      ChangeNotifierProvider(create: (_) => AddressController()),
      ChangeNotifierProvider(create: (_) => UserNotificationController()),
      ChangeNotifierProvider(create: (_) => EarnWithLukhuController()),
      ChangeNotifierProvider(create: (_) => GiftsController()),
    ];
  }
}
