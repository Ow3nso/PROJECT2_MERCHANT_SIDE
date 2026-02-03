// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AuthGenesisPage,
        FirebaseFirestore,
        Helpers,
        NavigationService,
        ReadContext,
        ShortMessages,
        UserModel,
        UserRepository;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../pages/chat.dart';

class ChatService {
  /// `openChat` opens a chat page with the user with the given `recipientId`
  ///
  /// Args:
  ///   recipientId (String): The id of the user you want to chat with.
  ///
  /// Returns:
  ///   A Future<void>
  static Future<void> openChat({required String recipientId, }) async {
    BuildContext context = NavigationService.navigatorKey.currentState!.context;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final name = await firestore.collection("users").doc(recipientId).get();
    if (!name.exists) {
      Helpers.debugLog("User does not exist");
      ShortMessages.showShortMessage(message: "User does not exist");
      return;
    }
    final UserModel user = UserModel.fromJson(name.data()!);
    if (context.read<UserRepository>().userAuthenticated) {
      try {
        types.User otherUser = types.User(
            id: recipientId,
            lastName: user.lastName,
            firstName: user.firstName,
            imageUrl: user.imageUrl,
            lastSeen: user.lastSeen,
            );
        final room = await FirebaseChatCore.instance.createRoom(otherUser);
        NavigationService.navigateGlobally(
            route: ChatPage.routeName, arguments: room);
      } catch (e) {
        if (kDebugMode) {
          log("Error occured trying to open chat page: $e");
        }
        rethrow;
      }
      return;
    }

    Helpers.debugLog("User is not authenticated");

    NavigationService.navigate(context, AuthGenesisPage.routeName);
  }
}
