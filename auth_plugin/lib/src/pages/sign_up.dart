import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/add_phone_number_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/add_profile_photo_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/dob_selection_flow_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/name_flow_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/phone_confirmation_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/seller_experience_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/set_password_flow_view.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/username_flow_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Helpers, NavigationService, ReadContext, WatchContext;
import '../controllers/user/user_repository.dart';
import '../widgets/sign_up_flow/gender_selection.dart';
import '../widgets/sign_up_flow/user_location_flow.dart';
import '../widgets/sign_up_flow/user_store_flow.dart';
import 'onboarding.dart';
import 'progress_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });
  static const routeName = 'signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpFlowController get signUpFlowController =>
      context.read<SignUpFlowController>();
  set signUpFlowController(SignUpFlowController value) {
    signUpFlowController = value;
  }

  List<Widget> get _options => [
        SelectAccountTypeView(signUpFlowController: signUpFlowController),
        if (signUpFlowController.userIsASeller)
          SellerExperienceView(signUpFlowController: signUpFlowController),
        NameFlowView(signUpFlowController: signUpFlowController),
        UserStoreFlow(signUpController: signUpFlowController),
        UserNameFlowView(signUpFlowController: signUpFlowController),
        SetPasswordFlowView(signUpFlowController: signUpFlowController),
        DOBSelectionView(signUpFlowController: signUpFlowController),
        AddPhoneNumberView(signUpFlowController: signUpFlowController),
        PhoneConfirmationView(
          dialogChild: const AddProfilePhotoView(),
          phoneNumber: signUpFlowController.phoneController.text,
          code: signUpFlowController.sentOtp ?? '0101010',
          loading: signUpFlowController.loading,
          onCodeResend: () {
            /// resend code
            signUpFlowController.sendOTP(true);
          },
          onRender: () {
            signUpFlowController.sendOTP();
          },
          codeTimer: signUpFlowController.timeRemainderToEnableOTP,
          resendCodeEnabled: signUpFlowController.resendOtp,
          onSuccess: () {
            NavigationService.navigate(
                context, CategorySelectionView.routeName);
          },
        ),
      ];

  // ignore: unused_element
  List<Widget> get _dukastaxOption => [
        NameFlowView(signUpFlowController: signUpFlowController),
        UserStoreFlow(signUpController: signUpFlowController),
        UserLocationFlow(signUpController: signUpFlowController),
        UserNameFlowView(signUpFlowController: signUpFlowController),
        SetPasswordFlowView(signUpFlowController: signUpFlowController),
        DOBSelectionView(signUpFlowController: signUpFlowController),
        GenderSelection(signUpFlowController: signUpFlowController),
        AddPhoneNumberView(signUpFlowController: signUpFlowController),
        PhoneConfirmationView(
          dialogChild: const AddProfilePhotoView(),
          phoneNumber: signUpFlowController.phoneController.text,
          code: signUpFlowController.sentOtp ?? '0101010',
          loading: signUpFlowController.loading,
          onCodeResend: () {
            /// resend code
            signUpFlowController.sendOTP(true);
          },
          onRender: () {
            signUpFlowController.sendOTP();
          },
          codeTimer: signUpFlowController.timeRemainderToEnableOTP,
          resendCodeEnabled: signUpFlowController.resendOtp,
          onSuccess: () {
            context.read<SignUpFlowController>().mockProgress();
            NavigationService.navigate(
              context,
              ProgressScreen.routeName,
            );
          },
        ),
      ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null) {
        context
            .read<SignUpFlowController>()
            .setExeperience(args as Map<String, dynamic>);
      }
      Helpers.debugLog("[ARG]$args");
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.read<UserRepository>().hasSocialData) {
        signUpFlowController.initUser(context.read<UserRepository>().user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (signUpFlowController.currentOption == 0) {
          return true;
        }
        signUpFlowController.currentOption--;
        return false;
      },
      child: Scaffold(
        backgroundColor: AuthConstants.optionCardBackgroundBlue,
        body: SafeArea(
          child: AnimatedBuilder(
              animation: signUpFlowController,
              builder: (_, c) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthBackButton(
                        onPressed: () {
                          if (signUpFlowController.currentOption == 0) {
                            Navigator.pop(context);
                            return;
                          }
                          signUpFlowController.currentOption--;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          'Step ${signUpFlowController.currentOption + 1} of ${_options.length}',
                          style: TextStyle(
                              color: AuthConstants.textErrorRed,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                          child: (context
                                      .watch<SignUpFlowController>()
                                      .isMarketplace
                                  ? _options
                                  : _dukastaxOption)[
                              signUpFlowController.currentOption])
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: AuthConstants.textDarkColor,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16,
            )),
      ),
    );
  }
}
