import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show ChatPage, NavigationService, StyleColors;

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.room});
  final types.Room room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CircleAvatar(
        backgroundImage: room.imageUrl != null? NetworkImage(room.imageUrl!):null,
        radius: 30,
        child: room.imageUrl == null? const Icon(Icons.person):null,
      ),
      title: Text(room.name ?? 'room'),
      subtitle: Text(_getMessage(),style: TextStyle(
        color: StyleColors.gray90,
        fontStyle: FontStyle.italic
      ),),
      onTap: () => NavigationService.navigate(context, ChatPage.routeName,
          arguments: room),
    );
  }

  String _getMessage() {
    if (room.metadata?['lastMessage'] == null) return 'tap to open';
    return room.metadata?['lastMessage'];
  }
}
