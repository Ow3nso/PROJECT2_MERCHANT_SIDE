import 'dart:async';
import 'dart:io';

import 'firebase/firestore_db.dart';
import 'firebase/firebase_logger.dart';
import 'firebase/firebase_storage.dart';
import 'firebase/mock_firebase_storage.dart';
import 'firebase/mock_firestore_db.dart';
import 'firebase/mock_firebase_logger.dart';
import 'local/local_db.dart';

import 'task_queue.dart';

enum DbType { firestore, mockFirestore, local }

abstract class Database {
  factory Database(DbType type) {
    switch (type) {
      case DbType.firestore:
        return FirestoreDb();
      case DbType.mockFirestore:
        return MockFirestoreDb();
      case DbType.local:
        return LocalDb();
    }
  }

  Future<List<Map<String, dynamic>>?> getAllDocs(String collection);

  Future<Map<String, dynamic>?> getDoc(String collection, String docId);

  Future<bool> updateDoc(
      String collection, String docId, Map<String, dynamic> doc);

  Future<List<Map<String, dynamic>>?> docsWhereInArray(
      String collection, String arrayField, String queryField);

  Future<bool> deleteDoc(String collection, String docId);

  Future<List<Map<String, dynamic>>?> docsWhereEqualTo(
      String collection, String cond1, String cond2);
}

enum StorageType { firebase, mockRemote }

abstract class Storage {
  factory Storage(StorageType type) {
    switch (type) {
      case StorageType.mockRemote:
        return MockFirebaseStorage();
      case StorageType.firebase:
      default:
        return GoogleStorage();
    }
  }

  Future<dynamic> downloadFile(String remotePath, String toPath);

  Future<String> getDownloadURL(String remotePath);

  Future<bool> uploadMedia(
      String path, File file, LukhuTaskQueue q, Function finishCb);

  Future<bool> deleteFile(String path);
}

enum LoggerType { crashlytics, mockLogger }

abstract class Logger {
  factory Logger(LoggerType type) {
    switch (type) {
      case LoggerType.crashlytics:
        return FirebaseLogger();
      default:
        return MockLogger();
    }
  }

  Future<void> logWarn(String error);

  Future<void> logError(Exception e, String reason, bool fatal);
}
