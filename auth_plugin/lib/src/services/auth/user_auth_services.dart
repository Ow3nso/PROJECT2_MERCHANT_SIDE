import 'dart:developer';

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FacebookAuth, FacebookAuthProvider, FirebaseAuth, GoogleAuthCredential, GoogleAuthProvider, GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication, LoginResult, LoginStatus, OAuthCredential, User;
import 'package:flutter/foundation.dart';

import '../../controllers/base/base_repository.dart';
import '../firebase/firebase_logger.dart';

class UserAuthServices {
  UserAuthServices.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn(scopes: ['email']) {
    rd.logger = FirebaseLogger();
  }

  RepoData rd = RepoData();
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  FirebaseAuth? get auth => _auth;
  GoogleSignIn? get googleSignIn => _googleSignIn;
  User? get fbUser => FirebaseAuth.instance.currentUser;

  /// It changes the password of the user.
  ///
  /// Args:
  ///   currentPassword (String): The current password of the user.
  ///   newPassword (String): The new password that the user wants to change to.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: auth?.currentUser?.email as String,
        password: currentPassword,
      );
      await auth?.currentUser?.updatePassword(newPassword);
      rd.error = '';
      return true;
    } catch (error) {
      if (kDebugMode) log(error.toString());
      rd.error =
          "Password can't be changed. Check if your current password is correct or log out and recover your password via email.";
      rd.logger.logWarn(rd.error);
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently
      return false;
    }
  }

  /// It sends a password reset email to the user.
  ///
  /// Args:
  ///   email (String): The email of the user.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> recoverPassword(String email) async {
    try {
      await auth?.sendPasswordResetEmail(email: email);
      rd.error = '';
      return true;
    } catch (e) {
      rd.error = 'The email is incorrect,no account found related to $email';
      rd.logger.logWarn(rd.error);
      return false;
    }
  }

  Future<bool> resetPassword(String code, String newPassword) async {
    try {
      await auth?.confirmPasswordReset(code: code, newPassword: newPassword);
       rd.error = '';
      return true;
    } catch (e) {
      rd.error = 'We could not reset your password please try again later';
      rd.logger.logWarn(rd.error);
      return false;
    }
  }

  /// It signs in the user with the email and password provided.
  ///
  /// Args:
  ///   email (String): The email of the user
  ///   password (String): The password of the user.
  ///
  /// Returns:
  ///   A Future<bool>
  Future<bool> signIn(String email, String password) async {
    try {
      await auth?.signInWithEmailAndPassword(email: email, password: password);
      rd.error = '';
      return true;
    } catch (e) {
      rd.error = 'The email or password is incorrect';
      rd.logger.logWarn(rd.error);
      return false;
    }
  }

  /// It creates a new user with the given email and password.
  ///
  /// Args:
  ///   displayName (String): The name of the user.
  ///   email (String): The email address of the user.
  ///   password (String): The password for the new account.
  ///
  /// Returns:
  ///   A boolean value.
  Future<bool> signup(String displayName, String email, String password) async {
    try {
      await auth?.createUserWithEmailAndPassword(
          email: email, password: password);
      rd.error = '';
      return true;
    } catch (e) {
      rd.error = e.toString();
      rd.logger.logWarn(rd.error);
      return false;
    }
  }

  /// It signs in the user with google.
  ///
  /// Returns:
  ///   A boolean value.
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      ) as GoogleAuthCredential;
      await auth?.signInWithCredential(credential);
      rd.error = '';

      return true;
    } catch (e) {
      rd.error = e.toString();
      if (kDebugMode) {
        log(rd.error);
      }
      rd.logger.logWarn(rd.error);
      return false;
    }
  }

  /// It signs in the user with Facebook credentials.
  ///
  /// Returns:
  ///   A boolean value.
  Future<bool> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final requestData = await FacebookAuth.instance.getUserData(
          fields: "email,name,picture",
        );

        // Create a credential from the access token
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Once signed in, return the UserCredential
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        if (FirebaseAuth.instance.currentUser == null) {
          return false;
        }
        if (requestData['name'] != null) {
          fbUser!.updateDisplayName(requestData['name'] as String);
        }

        if (requestData['email'] != null) {
          fbUser!.updateEmail(requestData['email'] as String);
        }

        if (requestData['picture']['data']['url'] != null) {
          fbUser!
              .updatePhotoURL(requestData['picture']['data']['url'] as String);
        }

        rd.error = '';
        return true;
      } else {
        rd.error = "Firebase failed to sign in with Facebook credentials";
        if (kDebugMode) {
          log(rd.error);
        }
        rd.logger.logWarn(rd.error);

        return false;
      }
    } catch (e) {
      rd.error = e.toString();
      if (kDebugMode) {
        log(rd.error);
      }
      rd.logger.logWarn(rd.error);

      return false;
    }
  }

  /// It signs out the user from the app.
  ///
  /// Returns:
  ///   A Future<void>
  Future<void> signOut() async {
    await auth?.signOut();
    await googleSignIn?.signOut();
    return Future.delayed(Duration.zero);
  }
}
