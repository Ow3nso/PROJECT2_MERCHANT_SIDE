import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DocumentSnapshot, FirebaseException, FirebaseFirestore;
import '../backend_factory.dart';
import 'firebase_logger.dart';

class FirestoreDb implements Database {
  final _db = FirebaseFirestore.instance;
  final _logger = FirebaseLogger();

  String error = '';

  @override
  Future<List<Map<String, dynamic>>?> getAllDocs(String collection) async {
    try {
      final snapshot = await _db.collection(collection).get();
      List<Map<String, dynamic>> docList = [];
      for (var doc in snapshot.docs) {
        Map<String, dynamic>? item = doc.data();
        docList.add(item);
      }
      return docList;
    } on FirebaseException catch (e) {
      _logger.logError(e, "failed to get all docs", false);
    }

    return null;
  }

  @override
  Future<Map<String, dynamic>?> getDoc(String collection, String docId) async {
    try {
      final docRef = _db.collection(collection).doc(docId);
      DocumentSnapshot doc = await docRef.get();
      return doc.data() as Map<String, dynamic>;
    } on FirebaseException catch (e) {
      _logger.logError(e, "failed to get doc", false);
    }

    return null;
  }

  @override
  Future<bool> updateDoc(
      String collection, String docId, Map<String, dynamic> doc) async {
    try {
      await _db.collection(collection).doc(docId).set(doc);
    } on FirebaseException catch (e) {
      _logger.logError(e, "failed to update doc", false);
      return false;
    }
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>?> docsWhereEqualTo(
      String collection, String cond1, String cond2) async {
    try {
      var snapshot =
          await _db.collection(collection).where(cond1, isEqualTo: cond2).get();
      List<Map<String, dynamic>> docList = [];
      for (var doc in snapshot.docs) {
        Map<String, dynamic>? item = doc.data();
        docList.add(item);
      }
      return docList;
    } on FirebaseException catch (e) {
      _logger.logError(e, "docs where query", false);
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> docsWhereInArray(
      String collection, String arrayField, String queryField) async {
    try {
      var snapshot = await _db
          .collection(collection)
          .where(arrayField, arrayContains: queryField)
          .get();
      List<Map<String, dynamic>> docList = [];
      for (var doc in snapshot.docs) {
        Map<String, dynamic>? item = doc.data();
        docList.add(item);
      }
      return docList;
    } on FirebaseException catch (e) {
      _logger.logError(e, "docs where query", false);
      return null;
    }
  }

  @override
  Future<bool> deleteDoc(String collection, String docId) async {
    try {
      await _db.collection(collection).doc(docId).delete();
      return true;
    } on FirebaseException catch (e) {
      _logger.logError(e, "Unable to delete doc", false);
      return false;
    }
  }
}
