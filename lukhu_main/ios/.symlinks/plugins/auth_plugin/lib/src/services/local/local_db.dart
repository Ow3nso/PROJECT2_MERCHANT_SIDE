import '../backend_factory.dart';

class LocalDb implements Database {
  String error = "";

  @override
  Future<List<Map<String, dynamic>>?> getAllDocs(String collection) async {
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getDoc(String collection, String docId) async {
    return null;
  }

  @override
  Future<bool> updateDoc(
      String collection, String docId, Map<String, dynamic> doc) async {
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>?> docsWhereInArray(
      String collection, String arrayField, String queryField) async {
    return null;
  }

  @override
  Future<bool> deleteDoc(String collection, String docId) async {
    return true;
  }

  @override
  Future<List<Map<String, dynamic>>?> docsWhereEqualTo(
      String collection, String cond1, String cond2) async {
    return [];
  }
}
