import 'package:chat_pkg/controllers/chat_controller.dart';
import 'package:chat_pkg/pages/chat.dart';
import 'package:chat_pkg/pages/inbox.dart';
import 'package:chat_pkg/pages/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show ChangeNotifierProvider, SingleChildWidget;

class ChatRoutes{
    static Map<String, Widget Function(BuildContext)> guarded = {
     Inbox.routName:(p0) => const Inbox(),
     ChatPage.routeName:(p0) => const ChatPage(),
     if(kDebugMode)
     UsersPage.routeName:(p0) => const UsersPage()
  };

    static Map<String, Widget Function(BuildContext)> public = {

  };

    static List<SingleChildWidget> providers() {
    return [
       ChangeNotifierProvider(
        create: (_) => ChatController(),
      ),
    ];
  }
}