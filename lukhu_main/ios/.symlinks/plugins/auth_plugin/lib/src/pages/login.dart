// ignore_for_file: use_build_context_synchronously

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppType,
        AuthInputField,
        Helpers,
        NavigationController,
        NavigationService,
        ReadContext,
        StringExtension,
        WatchContext;
import 'package:auth_plugin/src/pages/password_reset.dart';
import 'package:auth_plugin/src/pages/sign_up.dart';
import 'package:auth_plugin/src/services/auth/user_data_migration.dart';
import 'package:auth_plugin/src/services/field_validators.dart';
import 'package:flutter/material.dart';

import '../const/auth_constants.dart';
import '../controllers/auth/sign_up_flow.dart';
import '../controllers/user/user_repository.dart';
import '../widgets/buttons/default_auth_btn.dart';
import 'auth_genesis.dart';

class PasswordLoginPage extends StatefulWidget {
  const PasswordLoginPage({super.key});
  static const routeName = 'login';

  @override
  State<PasswordLoginPage> createState() => _PasswordLoginPageState();
}

class _PasswordLoginPageState extends State<PasswordLoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  bool emailHasError = false;
  bool passwordHasError = false;
  Future<void> _login() async {
    String emailValue = email.text.trim();
    // if (emailValue.isNumeric()) {
    //   context.read<UserRepository>().status = Status.authenticating;
    //   String? numberRelatedEmail =
    //       await UserDataCheck.getEmailByPhone(email.text.trim());
    //   if (numberRelatedEmail == null) {
    //     bool oldUser = await _checkIfIsAnOlduser();

    //     if (oldUser) {
    //       /// Handle logic for old user
    //       NavigationService.navigate(context, SignUpPage.routeName);
    //       return;
    //     }
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //           content:
    //               Text('There is no account associated with the phone number')),
    //     );
    //     return;
    //   }
    //   emailValue = numberRelatedEmail;
    // }
    bool loggedIn = await context
        .read<UserRepository>()
        .signIn(emailValue, password.text.trim());
    if (loggedIn) {
      _navigateToAfterLogin();
      return;
    }

    bool oldUser = await _checkIfIsAnOlduser();
    if (oldUser) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Navigating you to update your data.')),
      );

      NavigationService.navigate(context, SignUpPage.routeName);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid email or password provided!!')),
    );

    return;
  }

  /// This is the function that handles the navigation after login
  void _navigateToAfterLogin() {
    if (context.read<NavigationController>().pendingRoute != null) {
      Navigator.pop(context);
      NavigationService.navigate(
          context, context.read<NavigationController>().pendingRoute!,
          arguments: context.read<NavigationController>().pendingArguments,
          forever: true);
      context.read<NavigationController>().pendingRoute = null;
      context.read<NavigationController>().pendingArguments = null;
      return;
    }
    NavigationService.navigate(context, '/');
  }

  Future<bool> _checkIfIsAnOlduser() async {
    context.read<UserRepository>().status = Status.authenticating;
    final userData = {
      'username': null,
      'phoneNumber': email.text.trim().isNumeric()
          ? email.text.trim().toLukhuNumber()
          : null,
      'emailAddress': email.text.trim().isNumeric() ? null : email.text.trim()
    };
    final keysToDelete = [];
    userData.forEach((key, value) {
      if (value == null) {
        keysToDelete.add(key);
      }
    });

    for (var key in keysToDelete) {
      userData.remove(key);
    }
    final oldUserdata = await UserDataMigrationService.isOldUser(userData);
    context.read<UserRepository>().status = Status.authenticated;
    if (oldUserdata != null) {
      bool dataExist = oldUserdata['status'] == 'success';
      if (dataExist) {
        context.read<SignUpFlowController>().oldUserData =
            oldUserdata['data'][0];
        context.read<SignUpFlowController>().passwordController.text =
            password.text.trim();
        context.read<SignUpFlowController>().initUserOldData();
      }
      return dataExist;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments;
    Helpers.debugLog("[ARG]$args");
    var isDukastax = true;
    return Scaffold(
      backgroundColor: AuthConstants.optionCardBackgroundBlue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              LukhuIcon(
                isDukastax: isDukastax,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Karibu! Login in below',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    letterSpacing: 0.24,
                    color: Colors.black),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthInputField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: email,
                        hintText: 'Email Address or phone',
                        validator: (s) {
                          final error =
                              FieldsValidator.emailOrPhoneValidator(s);
                          setState(() {
                            emailHasError = error != null;
                          });
                          return error;
                        },
                        suffixIcon:
                            emailHasError ? const SuffixErrorIcon() : null,
                        onChange: (s) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      AuthInputField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: obscurePassword,
                        controller: password,
                        hintText: 'Password',
                        validator: (s) {
                          final error =
                              FieldsValidator.loginpasswordVlidator(s);
                          setState(() {
                            passwordHasError = error != null;
                          });
                          return error;
                        },
                        onFieldSubmitted: (s) {
                          //Login
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          child: obscurePassword
                              ? passwordHasError
                                  ? const SuffixErrorIcon()
                                  : Icon(
                                      Icons.visibility_off_rounded,
                                      color: AuthConstants.suffixGray,
                                    )
                              : Icon(Icons.visibility_rounded,
                                  color: AuthConstants.suffixGray),
                        ),
                        onChange: (s) {
                          setState(() {});
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height * .02,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  onPressed: () {
                    //Go to password reset page
                    NavigationService.navigate(
                        context, PasswordReset.routeName);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: AuthConstants.linkBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              const Spacer(),
              AuthButton(
                color: AuthConstants.buttonBlue,
                label: 'Log In',
                loading: context.watch<UserRepository>().status ==
                    Status.authenticating,
                actionDissabledColor: AuthConstants.buttonBlueDissabled,
                onTap: password.text.isEmpty || email.text.isEmpty
                    ? null
                    : () {
                        //Login
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
              ),
              SizedBox(
                height: size.height * .03,
              ),
              AuthButton(
                color: Colors.white,
                label: 'Create an account',
                actionDissabledColor: AuthConstants.buttonBlueDissabled,
                textColor: const Color(0xff34303E),
                boarderColor: AuthConstants.boarderColor,
                onTap: () {
                  //Navigate to account creation
                  NavigationService.navigate(
                    context,
                    "dukastax_onboard",
                    forever: true,
                    arguments: {
                      "type": AppType.dukastax,
                    },
                  );
                },
              ),
              SizedBox(
                height: size.height * .02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SuffixErrorIcon extends StatelessWidget {
  const SuffixErrorIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.error_outline_rounded,
      color: AuthConstants.textErrorRed,
    );
  }
}
