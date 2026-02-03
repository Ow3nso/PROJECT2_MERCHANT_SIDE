import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AuthGenesisPage, GoRoute, RouterUtils;

import '../pages/account/account_page.dart';
import '../pages/account/account_security.dart';
import '../pages/account/edit_account.dart';
import '../pages/buy_gift.dart';
import '../pages/delivery_address.dart';
import '../pages/earn.dart';
import '../pages/follow_recommendation.dart';
import '../pages/gift_cards.dart';
import '../pages/login.dart';
import '../pages/onboarding.dart';
import '../pages/password_reset.dart';
import '../pages/set_new_pass.dart';
import '../pages/pay_gift.dart';
import '../pages/progress_screen.dart';
import '../pages/settings.dart';
import '../pages/sign_up.dart';
import '../pages/sizes_selection.dart';
import '../pages/terms_and_condition.dart';
import '../pages/your_gifts.dart';

class AuthRouterService {
  static final List<GoRoute> routes = [
    RouterUtils.generateGoRoute(
      routeName: AuthGenesisPage.routeName,
      routePath: AuthGenesisPage.routeName,
      builder: (context, state) => const AuthGenesisPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: FollowerRecommendetionPage.routeName,
      routePath: FollowerRecommendetionPage.routeName,
      builder: (context, state) => const FollowerRecommendetionPage(),
    ),
    RouterUtils.generateGoRoute(
      routeName: PasswordLoginPage.routeName,
      routePath: PasswordLoginPage.routeName,
      builder: (context, state) => const PasswordLoginPage(),
    ),
    RouterUtils.generateGoRoute(
      routeName: CategorySelectionView.routeName,
      routePath: CategorySelectionView.routeName,
      builder: (context, state) => const CategorySelectionView(),
    ),
    RouterUtils.generateGoRoute(
      routeName: PasswordReset.routeName,
      routePath: PasswordReset.routeName,
      builder: (context, state) => const PasswordReset(),
    ),
    RouterUtils.generateGoRoute(
      routeName: SetNewPassPage.routeName,
      routePath: SetNewPassPage.routeName,
      builder: (context, state) => const PasswordReset(),
    ),
    RouterUtils.generateGoRoute(
      routeName: ProgressScreen.routeName,
      routePath: ProgressScreen.routeName,
      builder: (context, state) => const ProgressScreen(),
    ),
    RouterUtils.generateGoRoute(
      routeName: SignUpPage.routeName,
      routePath: SignUpPage.routeName,
      builder: (context, state) => const SignUpPage(),
    ),
    RouterUtils.generateGoRoute(
      routeName: SizesSelectionPage.routeName,
      routePath: SizesSelectionPage.routeName,
      builder: (context, state) => const SizesSelectionPage(),
    ),
    RouterUtils.generateGoRoute(
      routeName: TermsConditionPage.routeName,
      routePath: TermsConditionPage.routeName,
      builder: (context, state) => const TermsConditionPage(),
    ),
    RouterUtils.generateGoRoute(
      routeName: SignUpPage.routeName,
      routePath: SignUpPage.routeName,
      builder: (context, state) => const SignUpPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: AccountPage.routeName,
      routePath: AccountPage.routeName,
      builder: (context, state) => const AccountPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: AccountSettingsPage.routeName,
      routePath: AccountSettingsPage.routeName,
      builder: (context, state) => const AccountSettingsPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: EditAccountPage.routeName,
      routePath: EditAccountPage.routeName,
      builder: (context, state) => const EditAccountPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: AccountSecurityPage.routeName,
      routePath: AccountSecurityPage.routeName,
      builder: (context, state) => const AccountSecurityPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: DeliveryAddressPage.routeName,
      routePath: DeliveryAddressPage.routeName,
      builder: (context, state) => const DeliveryAddressPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: EarnPage.routeName,
      routePath: EarnPage.routeName,
      builder: (context, state) => const EarnPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: GiftCardPage.routeName,
      routePath: GiftCardPage.routeName,
      builder: (context, state) => const GiftCardPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: BuyGiftPage.routeName,
      routePath: BuyGiftPage.routeName,
      builder: (context, state) => const BuyGiftPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: YourGiftPage.routeName,
      routePath: YourGiftPage.routeName,
      builder: (context, state) => const YourGiftPage(),
    ),
    RouterUtils.generateGoRoute(
      guarded: true,
      routeName: PayGiftPage.routeName,
      routePath: PayGiftPage.routeName,
      builder: (context, state) => const PayGiftPage(),
    ),
  ];
}
