import 'dart:async';
import 'dart:io';

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FirebaseException, FirebaseStorage,TaskSnapshot, TaskState; 
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import '../backend_factory.dart';
import '../task_queue.dart';
import 'firebase_logger.dart';

class GoogleStorage implements Storage {
  final _store = FirebaseStorage.instance.ref();
  final _logger = FirebaseLogger();
  final LukhuTaskQueue q = LukhuTaskQueue.instance();

  @override
  Future<TaskSnapshot> downloadFile(String remotePath, String toPath) async {
    final fileRef = _store.child(remotePath);
    final file = File(toPath);
    final downloadTask = fileRef.writeToFile(file);

    return downloadTask.whenComplete(() => {});
  }

  @override
  Future<String> getDownloadURL(String remotePath) async {
    return await _store.child(remotePath).getDownloadURL();
  }

  @override
  Future<bool> uploadMedia(
      String path, File file, LukhuTaskQueue q, Function finishCb) async {
    final storageRef = _store.child(path);
    try {
      final uploadTask = storageRef.putFile(file);
      var taskKey = basename(file.path);
      q.queue[taskKey] = LukhuTask();
      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        q.notify();
        switch (taskSnapshot.state) {
          case TaskState.running:
            q.queue[taskKey]!.progress =
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            q.queue[taskKey]!.status = LukhuTaskStatus.running;
            break;
          case TaskState.paused:
            q.queue[taskKey]!.status = LukhuTaskStatus.paused;
            break;
          case TaskState.canceled:
            q.queue[taskKey]!.status = LukhuTaskStatus.canceled;
            break;
          case TaskState.error:
            q.queue[taskKey]!.status = LukhuTaskStatus.error;
            q.queue[taskKey]!.error = "Unable to complete task: ${file.path}";
            _logger.logWarn(q.queue[taskKey]!.error);
            break;
          case TaskState.success:
            q.queue[taskKey]!.status = LukhuTaskStatus.success;
            q.queue[taskKey]!.progress = 1;
            q.queue[taskKey]!.error = "";
            finishCb();
            q.queue.remove(taskKey);
            break;
        }
      });
    } on FirebaseException catch (e) {
      _logger.logError(e, "failed to upload media", false);
      return false;
    }
    return true;
  }

  @override
  Future<bool> deleteFile(String path) async {
    final storageRef = _store.child(path);
    try {
      await storageRef.delete();
    } on FirebaseException catch (e) {
      if (e.toString().contains("[firebase_storage/unauthorized]")) {
        _logger.logWarn(e.message!);
      } else {
        _logger.logError(e, "failed to delete media", false);
      }

      return false;
    }
    return true;
  }
}
