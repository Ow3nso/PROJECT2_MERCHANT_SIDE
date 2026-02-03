import 'package:chat_pkg/pages/users.dart';
import 'package:chat_pkg/widgets/room_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, DefaultButton, Helpers, HourGlass, LuhkuAppBar, NavigationService, StyleColors;

class Inbox extends StatelessWidget {
  const Inbox({super.key});
  static const routName = 'inbox_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  LuhkuAppBar(
        centerTitle: true,
        actions: [
          if(kDebugMode)
            IconButton(
              tooltip: "View Test Users",
              onPressed: (){
              NavigationService.navigate(context, UsersPage.routeName);
            }, icon: const Icon(Icons.bug_report_rounded))
        ],
        title: const Text('Your Inbox'),
        appBarType: AppBarType.other,
        
      ),
      body: StreamBuilder<List<types.Room>>(
        stream: FirebaseChatCore.instance.rooms(
          orderByUpdatedAt: true
        ),
        initialData: const [],
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: HourGlass());
          }
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                  itemBuilder: (_, i) {
                    return /// A widget that displays the room information.
                    RoomCard(room: snapshot.data![i]);
                  },
                  separatorBuilder: (_, i) =>   Divider(
                        indent: 70,
                        endIndent: 20,
                       thickness: .5,
                       color: Theme.of(context).dividerColor,
        
                  ),
                  itemCount: snapshot.data!.length);
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your messages will be displayed here',
                    textAlign: TextAlign.center,
                  ),
                  if (kDebugMode)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultButton(
                        width: 200,
                        label: 'View test users',
                        color: StyleColors.blue,
                        textColor: StyleColors.white,
                        onTap: () {
                          NavigationService.navigate(
                              context, UsersPage.routeName);
                        },
                      ),
                    )
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            Helpers.debugLog( snapshot.error.toString());
            return const Center(
                child: Text(
                    'We are unable to load your chats,please try again later!'));
          }
          return const Center(child: HourGlass());
        },
      ),
    );
  }
}
