import 'package:chat_pkg/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        LuhkuAppBar,
        ReadContext,
        StyleColors,
        WatchContext;

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static const routeName = 'chat';

  @override
  Widget build(BuildContext context) {
    final types.Room room =
        ModalRoute.of(context)!.settings.arguments as types.Room;

    return Scaffold(
      appBar: LuhkuAppBar(
        backAction: const DefaultBackButton(),
        title: Text(
          room.name ?? 'Chat Page',
        ),
        appBarType: AppBarType.other,
      ),
      body: StreamBuilder<types.Room>(
        initialData: room,
        stream: FirebaseChatCore.instance.room(room.id),
        builder: (context, snapshot) => StreamBuilder<List<types.Message>>(
          initialData: const [],
          stream: FirebaseChatCore.instance.messages(snapshot.data!),
          builder: (context, snapshot) => Chat(
            showUserAvatars: true,
            showUserNames: true,
            theme: _chatTheme(context),
            isAttachmentUploading:
                context.watch<ChatController>().isAttachmentUploading,
            messages: snapshot.data ?? [],
            onAttachmentPressed: () => context
                .read<ChatController>()
                .handleAttachmentPressed(context: context, roomId: room.id),
            onMessageTap: (_, message) => context
                .read<ChatController>()
                .handleMessageTap(
                    context: context, message: message, roomId: room.id),
            onPreviewDataFetched: (textMessage, preData) => context
                .read<ChatController>()
                .handlePreviewDataFetched(
                    message: textMessage,
                    previewData: preData,
                    roomId: room.id),
            onSendPressed: (txt) => context
                .read<ChatController>()
                .handleSendPressed(message: txt, roomId: room.id),
            user: types.User(
              id: FirebaseChatCore.instance.firebaseUser?.uid ?? '',
            ),
          ),
        ),
      ),
    );
  }

  DefaultChatTheme _chatTheme(BuildContext context) {
    return DefaultChatTheme(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        primaryColor: StyleColors.pink,
        inputBackgroundColor: StyleColors.chatInputBackground,
        emptyChatPlaceholderTextStyle:
            TextStyle(color: StyleColors.btnColorGrey),
        inputBorderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        inputTextStyle: TextStyle(color: StyleColors.dark),
        inputTextColor: StyleColors.dark);
  }
}
