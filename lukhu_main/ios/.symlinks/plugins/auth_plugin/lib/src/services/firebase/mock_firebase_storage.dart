import '../backend_factory.dart';

import 'dart:async';
import 'dart:io';

import '../task_queue.dart';

class MockFirebaseStorage implements Storage {
  bool _downloadReturn = true;
  bool uploadReturn = false;

  set downloadReturn(bool val) => _downloadReturn = val;

  @override
  Future<bool> downloadFile(String remotePath, String toPath) async {
    return Future.delayed(const Duration(seconds: 1), () {
      if (_downloadReturn == false) throw Exception("Download Failed!");
      return _downloadReturn;
    });
  }

  @override
  Future<String> getDownloadURL(String remotePath) async {
    return "my_download_url";
  }

  @override
  Future<bool> uploadMedia(
      String path, File file, LukhuTaskQueue q, Function finishCb) async {
    return uploadReturn;
  }

  @override
  Future<bool> deleteFile(String path) async {
    return true;
  }
}
