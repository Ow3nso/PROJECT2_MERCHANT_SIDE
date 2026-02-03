import '../backend_factory.dart';

class MockFirestoreDb implements Database {
  List<Map<String, dynamic>>? _mockDocs;
  bool updateSuccessful = false;
  String error = "";

  set mockDocs(List<Map<String, dynamic>> md) => _mockDocs = md;

  @override
  Future<List<Map<String, dynamic>>?> getAllDocs(String collection) async {
    return _mockDocs;
  }

  @override
  Future<Map<String, dynamic>?> getDoc(String collection, String docId) async {
    return null;
  }

  @override
  Future<bool> updateDoc(
      String collection, String docId, Map<String, dynamic> doc) async {
    return updateSuccessful;
  }

  @override
  Future<List<Map<String, dynamic>>?> docsWhereInArray(
      String collection, String arrayField, String queryField) async {
    return _mockDocs;
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
