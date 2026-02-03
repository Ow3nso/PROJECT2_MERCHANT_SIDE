// ignore_for_file: use_build_context_synchronously

import 'package:chat_pkg/chat_pkg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        HourGlass,
        LuhkuAppBar,
        NavigationService;

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  static const routeName = 'users_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuhkuAppBar(
        backAction: DefaultBackButton(),
        title: Text('Test Users'),
        appBarType: AppBarType.other,
      ),
      body: StreamBuilder<List<types.User>>(
        stream: FirebaseChatCore.instance.users(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, i) {
                  final user = snapshot.data![i];
                  return InkWell(
                    onTap: () {
                      _handlePressed(user, context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                           CircleAvatar(
                            backgroundImage: user.imageUrl != null
                                ? NetworkImage(user.imageUrl!)
                                : null,
                            child:user.imageUrl == null? const Icon(Icons.person):null,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(user.firstName ?? 'Name'),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  'We could not fetch users list, ${snapshot.error.toString()}'),
            );
          }
          return const Center(
            child: HourGlass(),
          );
        },
      ),
    );
  }

  void _handlePressed(types.User otherUser, BuildContext context) async {
    final room = await FirebaseChatCore.instance.createRoom(otherUser);
    NavigationService.navigate(context, ChatPage.routeName, arguments: room);
  }
}
