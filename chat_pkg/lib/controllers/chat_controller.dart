import 'dart:io';

import 'package:chat_pkg/widgets/attatchment_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show BlurDialogBody, Client, FilePicker, FileType, FirebaseStorage, ImagePicker, ImageSource, Uuid, getApplicationDocumentsDirectory, lookupMimeType;
import 'package:open_filex/open_filex.dart';

class ChatController extends ChangeNotifier {
  bool _isAttachmentUploading = false;
  bool get isAttachmentUploading => _isAttachmentUploading;
  set isAttachmentUploading(bool value) {
    setState(() {
      _isAttachmentUploading = value;
    });
  }

  void setState(VoidCallback fn) {
    fn();
    notifyListeners();
  }


  

  void handleAttachmentPressed({required BuildContext context, required String roomId}) {
    showDialog(context: context, builder: (_) =>BlurDialogBody(
      bottomDistance: 100,
       child: AttatchmentsSelectionCard(handleImageSelection:() => handleImageSelection(roomId: roomId),handleFileSelection: () => handleFileSelection(roomId: roomId),),
    ) );
  }

  void handleFileSelection({required String roomId}) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      isAttachmentUploading = true;
      final name = result.files.single.name;
      final filePath = result.files.single.path!;
      final file = File(filePath);

      try {
        final reference = FirebaseStorage.instance.ref(name);
        await reference.putFile(file);
        final uri = await reference.getDownloadURL();

        final message = types.PartialFile(
          mimeType: lookupMimeType(filePath),
          name: name,
          size: result.files.single.size,
          uri: uri,
        );

        FirebaseChatCore.instance.sendMessage(message, roomId);
        isAttachmentUploading = false;
      } finally {
        isAttachmentUploading = false;
      }
    }
  }

  void handleImageSelection({required String roomId}) async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      isAttachmentUploading = true;
      final file = File(result.path);
      final size = file.lengthSync();
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final name = result.name;

      try {
        final reference = FirebaseStorage.instance.ref(name);
        await reference.putFile(file);
        final uri = await reference.getDownloadURL();

        final message = types.PartialImage(
          height: image.height.toDouble(),
          name: name,
          size: size,
          uri: uri,
          width: image.width.toDouble(),
        );

        FirebaseChatCore.instance.sendMessage(
          message,
          roomId,
        );
        isAttachmentUploading = false;
      } finally {
        isAttachmentUploading = false;
      }
    }
  }

  void handleMessageTap(
      {required BuildContext context,
      required types.Message message,
      required String roomId}) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final updatedMessage = message.copyWith(isLoading: true);
          FirebaseChatCore.instance.updateMessage(
            updatedMessage,
            roomId,
          );

          final client = Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final updatedMessage = message.copyWith(isLoading: false);
          FirebaseChatCore.instance.updateMessage(
            updatedMessage,
            roomId,
          );
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void handlePreviewDataFetched(
      {required types.TextMessage message,
      required types.PreviewData previewData,
      required String roomId}) {
    final updatedMessage = message.copyWith(previewData: previewData);

    FirebaseChatCore.instance.updateMessage(updatedMessage, roomId);
  }

  void handleSendPressed({required types.PartialText message, required String roomId}) {
       FirebaseChatCore.instance.sendMessage(
      message,
      roomId,
    );
  }

  String randomString() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}
