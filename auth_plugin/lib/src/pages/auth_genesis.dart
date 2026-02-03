// ignore_for_file: use_build_context_synchronously, dead_code

import 'dart:developer';

import 'package:auth_plugin/src/pages/login.dart';
import 'package:auth_plugin/src/widgets/account/dukastax_container.dart';
import 'package:auth_plugin/src/widgets/buttons/default_auth_btn.dart';
import 'package:auth_plugin/src/widgets/launchers/link_text.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppType,
        DukastaxOnboard,
        Helpers,
        NavigationController,
        NavigationService,
        ReadContext,
        WatchContext;

import '../controllers/user/user_repository.dart';
import '../widgets/buttons/dukastax_link_buttton.dart';
import 'sign_up.dart';

/// `_AuthGenesisPageState` is a stateful widget that displays the first page of the authentication flow
class AuthGenesisPage extends StatefulWidget {
  const AuthGenesisPage({super.key});
  static const routeName = 'auth';
  @override
  State<AuthGenesisPage> createState() => _AuthGenesisPageState();
}

class _AuthGenesisPageState extends State<AuthGenesisPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _googleSignIn(BuildContext context) async {
    bool signedIn = await context.read<UserRepository>().signInWithGoogle(context);
    if (signedIn) {
      _navigateToAfterLogin(context);
      return;
    }
    if (kDebugMode) {
      log(context.read<UserRepository>().error ?? '');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Something went wrong, please try again later')),
    );
  }

  // Future<UserCredential?> signInWithGoogle(BuildContext context) async {
  //   try {
  //     await FirebaseAuth.instance.signOut();
  //     await GoogleSignIn().signOut();
  //
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //     if (googleAuth != null) {
  //       final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //
  //       final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //       // Navigate to the main page after successful sign-in using MaterialPageRoute
  //       _navigateToAfterLogin(context);
  //       return userCredential;
  //     } else {
  //       print('Error');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print('Error');
  //   }
  //   return null; // Return null if sign-in fails
  // }

  Future<void> _facebookSignIn(BuildContext context) async {
    bool signedIn = await context.read<UserRepository>().signInWithFacebook();
    if (signedIn) {
      _navigateToAfterLogin(context);
      return;
    }
    if (kDebugMode) {
      log(context.read<UserRepository>().error ?? '');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Something went wrong, please try again later')),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     final args = ModalRoute.of(context)!.settings.arguments;
  //     if (args == null) {
  //       context.read<SignUpFlowController>().accountTypeSelectedOption =
  //           "I want to Sell";
  //       context.read<SignUpFlowController>().currentOption++;
  //       context.read<SignUpFlowController>().appType = AppType.dukastax;
  //     }
  //     Helpers.debugLog("[ARG]$args");
  //   });
  // }

  void _navigateToAfterLogin(BuildContext context) {
    if (context.read<UserRepository>().newUser) {
      context.read<UserRepository>().hasSocialData = true;
      NavigationService.navigate(context, SignUpPage.routeName, forever: true);
      return;
    }
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
    NavigationService.navigate(context, '/', forever: true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments;
    Helpers.debugLog("[ARG]$args");
    var isDukastax = true;
    return Scaffold(
      backgroundColor: AuthConstants.backgoundBlue,
      body: IgnorePointer(
        ignoring:
            context.watch<UserRepository>().status == Status.authenticating,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                    child: //isDukastax
                        DukastaxContainer(
                  height: 450,
                )
                    // : Image.asset(
                    //     'assets/images/auth_genesis_background.png',
                    //     package: AuthConstants.pluginName,
                    //     width: size.width,
                    //     fit: BoxFit.cover,
                    //   )

                    ),
                Expanded(
                    child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AuthConstants.optionCardBackgroundBlue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // _space(add: 2),
                        // if (!isDukastax)
                        //   Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       const LukhuIcon(),
                        //       _space(),
                        //       Text(
                        //         'The Safest and Fastest Way to Buy, Sell and Discover Fashion Online! 😎 ',
                        //         style: TextStyle(
                        //             color: AuthConstants.textDarkColor,
                        //             fontWeight: FontWeight.w700,
                        //             fontSize: 16),
                        //       ),
                        //     ],
                        //   ),
                        _space(add: 2),
                        AuthButton(
                          color: AuthConstants.buttonBlue,
                          label: isDukastax
                              ? "Log in with Phone Number"
                            
                              : 'Log In with Password',
                          actionDissabledColor:
                              AuthConstants.buttonBlueDissabled,
                          onTap: () {
                            ///Navigate to login
                            NavigationService.navigate(
                                context, PasswordLoginPage.routeName);
                          },
                        ),
                        _space(add: 2),
                        AuthButton(
                          color: Colors.white,
                          label: 'Create an account',
                          actionDissabledColor:
                              AuthConstants.buttonBlueDissabled,
                          textColor: const Color(0xff34303E),
                          boarderColor: AuthConstants.boarderColor,
                          onTap: () {
                            //Navigate to account creation
                            NavigationService.navigate(
                              context,
                              DukastaxOnboard.routeName,
                              arguments: {
                                "type": AppType.dukastax,
                              },
                            );
                            // if (isDukastax) {
                            //   return;
                            // }
                            // NavigationService.navigate(
                            //     context, SignUpPage.routeName);
                          },
                        ),
                        // _space(add: 2),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                                    color: AuthConstants.dividerGrayColor)),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                'or',
                                style: TextStyle(
                                    color: AuthConstants.dividerGrayColor),
                              ),
                            ),
                            Expanded(
                                child: Divider(
                                    color: AuthConstants.dividerGrayColor))
                          ],
                        ),
                        // _space(add: 2),
                        AuthButton(
                          asssetIcon: 'assets/icons/google_icon.png',
                          color: Colors.white,
                          label: 'Continue with Google',
                          actionDissabledColor:
                              AuthConstants.buttonBlueDissabled,
                          textColor: const Color(0xff34303E),
                          boarderColor: AuthConstants.boarderColor,
                          onTap: () async {
                            //Signin with google
                            _googleSignIn(context);
                            // await signInWithGoogle(context);
                          },
                        ),
                        _space(add: 2),
                        AuthButton(
                          color: Colors.white,
                          asssetIcon: 'assets/icons/fb_icon.png',
                          label: 'Continue with Facebook',
                          actionDissabledColor:
                              AuthConstants.buttonBlueDissabled,
                          textColor: const Color(0xff34303E),
                          boarderColor: AuthConstants.boarderColor,
                          onTap: () {
                            // Signin with facebook
                            _facebookSignIn(context);
                          },
                        ),
                        _space(add: 1),
                        if (context.watch<UserRepository>().status ==
                            Status.authenticating)
                          const Center(child: CircularProgressIndicator()),
                        _space(add: 2),
                        !isDukastax
                            ? LinkTextButton(
                                text: 'By continuing, you agree to our ',
                                url: AuthConstants.termsOfService,
                                urlHolderText: 'Terms of Service')
                            : const Align(child: DukastaxLinkButton())
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// `_space` is a function that returns a `SizedBox` with a height of `_columnSpacing` times the value
  /// of the `add` parameter
  ///
  /// Args:
  ///   add (double): This is the multiplier for the spacing. Defaults to 1
  ///
  /// Returns:
  ///   A SizedBox with a height of _columnSpacing * add.
  SizedBox _space({double add = 1}) {
    return const SizedBox(height: 0);
  }
}

/// `LukhuIcon` is a stateless widget that displays the lukhu icon
class LukhuIcon extends StatelessWidget {
  const LukhuIcon({
    Key? key,
    this.isDukastax = false,
  }) : super(key: key);
  final bool isDukastax;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isDukastax
          ? 'assets/images/dukastax_logo.png'
          : 'assets/images/lukhu.png',
      package: AuthConstants.pluginName,
    );
  }
}
