import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseHandler<Snapshot> {
  Future<Snapshot> getDocumentById(String collection, String id);
  Stream<Snapshot> getDocumentByIdStream(String collection, String id);
  Future<void> addDocument(String collection, Map<String, dynamic> data);
  Future<void> addDocumentWithId(
      String collection, String id, Map<String, dynamic> data);
  Future<void> updateDocument(
      String collection, String id, Map<String, dynamic> data);
  Future<bool> isDocExists(String collection, String id);
  Future<void> deleteDocument(String collection, String id);
  Future<QuerySnapshot> getDocuments(String collection, {Query? query});
}
